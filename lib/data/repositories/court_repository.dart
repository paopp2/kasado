import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/helpers/firestore_helper.dart';
import 'package:kasado/data/helpers/firestore_path.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/kasado_location/kasado_location.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

final courtRepositoryProvider = Provider.autoDispose(
  (ref) => CourtRepository(
    firestoreHelper: FirestoreHelper.instance,
  ),
);

class CourtRepository {
  CourtRepository({
    required this.firestoreHelper,
  });

  final FirestoreHelper firestoreHelper;

  Future<void> pushCourt(Court court, {bool isUpdate = false}) async {
    await firestoreHelper.setData(
      path: FirestorePath.docCourt(court.id),
      // TODO: Remove the removes
      // The reason for doing this is to avoid overwriting these existing fields
      // at db with nothing, which might fuck up the app if not yet updated.
      // Basically done for backwards compatiblity, sort of
      data: court.toJson()..remove('specialCourtSlots'),
      merge: isUpdate,
    );
  }

  Future<void> deleteCourt(Court court) async {
    await firestoreHelper.deleteData(path: FirestorePath.docCourt(court.id));
  }

  Future<Court?> getCourt(String courtId) async {
    return firestoreHelper.getData(
      path: FirestorePath.docCourt(courtId),
      builder: (data, docId) => Court.fromJson(data),
    );
  }

  Stream<Court?> getCourtStream(String courtId) {
    return firestoreHelper.documentStream(
      path: FirestorePath.docCourt(courtId),
      builder: (data, docId) => Court.fromJson(data),
    );
  }

  Stream<List<Court>> getCourtsStream({
    KasadoUser? admin,
    KasadoLocation? centerLoc,
  }) {
    final geo = Geoflutterfire();
    final streamController = StreamController<List<Court>>();
    Query<Map<String, dynamic>> query =
        FirebaseFirestore.instance.collection(FirestorePath.colCourts());
    if (admin != null) {
      query = query.where('adminIds', arrayContains: admin.id);
    }
    if (centerLoc != null) {
      final center = geo.point(
        latitude: centerLoc.lat,
        longitude: centerLoc.lng,
      );
      final geoRef = geo
          .collection(collectionRef: query)
          .within(
            center: center,
            radius: 1000,
            field: 'geo',
          )
          .map(
            (snapList) =>
                snapList.map((snap) => Court.fromJson(snap.data()!)).toList(),
          );
      geoRef.listen((courtList) {
        streamController.add(courtList);
      }, cancelOnError: true);
    } else {
      final Stream<QuerySnapshot> snapshots = query.snapshots();
      snapshots.listen((snapshot) {
        final result = snapshot.docs
            .map((snapshot) =>
                Court.fromJson(snapshot.data() as Map<String, dynamic>))
            .toList();
        streamController.add(result);
      }, cancelOnError: true);
    }
    streamController.onCancel = streamController.close;

    return streamController.stream;
  }
}
