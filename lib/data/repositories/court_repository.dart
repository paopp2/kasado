import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/helpers/firestore_helper.dart';
import 'package:kasado/data/helpers/firestore_path.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/court_slot/court_slot.dart';

final courtRepositoryProvider = Provider.autoDispose(
  (ref) => CourtRepository(firestoreHelper: FirestoreHelper.instance),
);

class CourtRepository {
  CourtRepository({required this.firestoreHelper});

  final FirestoreHelper firestoreHelper;

  Future<void> pushCourt(Court court) async {
    await firestoreHelper.setData(
      path: FirestorePath.docCourt(court.id),
      data: court.toJson(),
    );
  }

  Stream<List<Court>> getCourtsStream() {
    return firestoreHelper.collectionStream(
      path: FirestorePath.colCourts(),
      builder: (data, docId) => Court.fromJson(data),
    );
  }

  Stream<List<CourtSlot>> getCourtSlots(String courtId) {
    return firestoreHelper.collectionStream(
      path: FirestorePath.colCourtSlots(courtId),
      builder: (data, docId) => CourtSlot.fromJson(data),
    );
  }
}
