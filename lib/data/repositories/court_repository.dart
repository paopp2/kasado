import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/helpers/firestore_helper.dart';
import 'package:kasado/data/helpers/firestore_path.dart';
import 'package:kasado/data/repositories/user_info_repository.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';

final courtRepositoryProvider = Provider.autoDispose(
  (ref) => CourtRepository(
    firestoreHelper: FirestoreHelper.instance,
    userInfoRepo: ref.watch(userInfoRepositoryProvider),
  ),
);

class CourtRepository {
  CourtRepository({
    required this.firestoreHelper,
    required this.userInfoRepo,
  });

  final FirestoreHelper firestoreHelper;
  final UserInfoRepository userInfoRepo;

  Future<void> pushCourt(Court court) async {
    await firestoreHelper.setData(
      path: FirestorePath.docCourt(court.id),
      data: court.toJson(),
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

  Stream<List<Court>> getCourtsStream({KasadoUser? admin}) {
    return firestoreHelper.collectionStream(
      path: FirestorePath.colCourts(),
      builder: (data, docId) => Court.fromJson(data),
      queryBuilder: (admin != null)
          ? (query) => query.where('adminIds', arrayContains: admin.id)
          : null,
    );
  }

  Future<void> pushCourtSlot({
    required CourtSlot courtSlot,
  }) async {
    await firestoreHelper.setData(
      path: FirestorePath.docCourtSlot(courtSlot.courtId, courtSlot.slotId),
      data: courtSlot.toJson(),
    );
  }

  Future<void> setCourtSlotClosed({
    required CourtSlot courtSlot,
    required bool isCourtClosed,
    required double courtTicketPrice,
  }) async {
    if (isCourtClosed) {
      // Convert courtSlot players to a map with their respective ID as the key
      final Map<String, KasadoUser> playerMap = {
        for (final player in courtSlot.players) player.id: player,
      };

      // Get the userInfos for each player at courtSlot
      final userInfoList = (playerMap.isEmpty)
          ? []
          : await firestoreHelper.collectionToList(
              path: FirestorePath.colUserInfos(),
              builder: (data, docId) => KasadoUserInfo.fromJson(data),
              queryBuilder: (query) => query.where(
                'id',
                whereIn: playerMap.keys.toList(),
              ),
            );

      for (final userInfo in userInfoList) {
        // If the player has already paid, return their money
        if (playerMap[userInfo.id]!.hasPaid) {
          await userInfoRepo.addOrDeductPondo(
            currentUserInfo: userInfo,
            isAdd: true,
            pondo: courtTicketPrice,
          );
        }

        // Nullify player's reservations to allow them to reserve for another slot
        await userInfoRepo.reserveUserAt(userId: userInfo.id, reservedAt: null);
      }

      // Flag court as closedByAdmin
      await pushCourtSlot(courtSlot: courtSlot.copyWith(isClosedByAdmin: true));
    } else {
      // When a CourtSlot is reopened from being previously closed, remove it.
      // The reason for this is that when a CourtSlot does not appear (or exist)
      // in the 'courts/$courtId/court_slots/' path, it is assumed to be open.
      // Closed CourtSlots remain in the path mentioned but with a flag so that
      // UI knows that it is a closed CourtSlot and can change its state based upon it
      await removeCourtSlot(courtSlot.courtId, courtSlot.slotId);
    }
  }

  Stream<CourtSlot?> getCourtSlotStream(String courtId, String slotId) {
    return firestoreHelper.documentStream(
      path: FirestorePath.docCourtSlot(courtId, slotId),
      builder: (data, docId) => CourtSlot.fromJson(data),
    );
  }

  Stream<List<CourtSlot>> getCourtSlotsStream(String courtId) {
    return firestoreHelper.collectionStream(
      path: FirestorePath.colCourtSlots(courtId),
      builder: (data, docId) => CourtSlot.fromJson(data),
    );
  }

  Future<void> removeCourtSlot(String courtId, String slotId) async {
    await firestoreHelper.deleteData(
      path: FirestorePath.docCourtSlot(courtId, slotId),
    );
  }
}
