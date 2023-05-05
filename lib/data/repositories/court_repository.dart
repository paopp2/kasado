import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/helpers/firestore_helper.dart';
import 'package:kasado/data/helpers/firestore_path.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/kasado_location/kasado_location.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

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
    final geo = GeoFlutterFire();
    await firestoreHelper.setData(
      path: FirestorePath.docCourt(court.id),
      data: court.toJson()
        ..addAll({
          'geo': geo
              .point(
                latitude: court.location.lat,
                longitude: court.location.lng,
              )
              .data,
        }),
      merge: isUpdate,
    );
  }

  Future<void> updateAdminIdList({
    required String courtId,
    required List<String> updatedAdminIdList,
  }) async {
    await firestoreHelper.setData(
      path: FirestorePath.docCourt(courtId),
      data: {'adminIds': updatedAdminIdList},
      merge: true,
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
    final geo = GeoFlutterFire();
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
            (snapList) => snapList
                .map((snap) =>
                    Court.fromJson(snap.data()! as Map<String, dynamic>))
                .toList(),
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
