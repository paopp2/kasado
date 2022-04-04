import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/helpers/firestore_helper.dart';
import 'package:kasado/data/helpers/firestore_path.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';

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

  Future<void> pushCourt(Court court) async {
    await firestoreHelper.setData(
      path: FirestorePath.docCourt(court.id),
      data: court.toJson(),
    );
  }

  Future<void> deleteCourt(Court court) async {
    await firestoreHelper.deleteData(path: FirestorePath.docCourt(court.id));
  }

  Future<void> hideCourtSlot(CourtSlot courtSlot) async {
    final baseCourt = await getCourt(courtSlot.courtId);
    final hiddenCourtSlots = [...baseCourt!.hiddenCourtSlots!, courtSlot]
      ..sort((a, b) => a.timeRange.startsAt.compareTo(b.timeRange.startsAt));
    await firestoreHelper.setData(
      path: FirestorePath.docCourt(baseCourt.id),
      data: {
        'hiddenCourtSlots':
            hiddenCourtSlots.map((slot) => slot.toJson()).toList(),
      },
      merge: true,
    );
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

  Stream<List<Court>> getCourtsStream({KasadoUser? admin}) {
    return firestoreHelper.collectionStream(
      path: FirestorePath.colCourts(),
      builder: (data, docId) => Court.fromJson(data),
      queryBuilder: (admin != null)
          ? (query) => query.where('adminIds', arrayContains: admin.id)
          : null,
    );
  }
}
