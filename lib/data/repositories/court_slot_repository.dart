import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/helpers/firestore_helper.dart';
import 'package:kasado/data/helpers/firestore_path.dart';
import 'package:kasado/data/repositories/team_repository.dart';
import 'package:kasado/data/repositories/user_info_repository.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';

final courtSlotRepositoryProvider = Provider.autoDispose(
  (ref) => CourtSlotRepository(
    firestoreHelper: FirestoreHelper.instance,
    userInfoRepo: ref.watch(userInfoRepositoryProvider),
    teamRepo: ref.watch(teamRepositoryProvider),
  ),
);

class CourtSlotRepository {
  CourtSlotRepository({
    required this.firestoreHelper,
    required this.userInfoRepo,
    required this.teamRepo,
  });

  final FirestoreHelper firestoreHelper;
  final UserInfoRepository userInfoRepo;
  final TeamRepository teamRepo;

  Future<void> pushCourtSlot({
    required CourtSlot courtSlot,
  }) async {
    await firestoreHelper.setData(
      path: FirestorePath.docCourtSlot(courtSlot.courtId, courtSlot.slotId),
      data: courtSlot.toJson(),
    );
  }

  Future<void> addPlayerToCourtSlot({
    required KasadoUser player,
    required CourtSlot courtSlot,
    required double courtTicketPrice,
  }) async {
    KasadoUser? paidUser;
    final userInfo = await userInfoRepo.getUserInfo(player.id);
    // If slot is not full and user is not reserved at another slot, check
    // if user has enough pondo to pay for joining
    if (userInfo!.hasEnoughPondoToPay(courtTicketPrice)) {
      // If user has enough pondo, use pondo to pay for court ticket
      userInfoRepo.addOrDeductPondo(
        currentUserInfo: userInfo,
        isAdd: false,
        pondo: courtTicketPrice,
      );
      paidUser = userInfo.user.copyWith(hasPaid: true);
    }

    // The whole courtSlot has to be pushed to cover for cases wherein the
    // courtSlot doesn't exist yet (has no players before adding [player])
    await pushCourtSlot(
      courtSlot: courtSlot.copyWith(
        players: [...courtSlot.players, paidUser ?? player],
      ),
    );

    // Indicate at player's userInfo that user is already reserved at slot
    await userInfoRepo.reserveUserAt(
      userId: player.id,
      reservedAt: courtSlot.copyWith(players: []),
    );
  }

  Future<void> removePlayerFromCourtSlot({
    required KasadoUser player,
    required CourtSlot courtSlot,
    required double courtTicketPrice,
  }) async {
    if (player.hasPaid) {
      final baseUserInfo = await userInfoRepo.getUserInfo(player.id);
      await userInfoRepo.addOrDeductPondo(
        currentUserInfo: baseUserInfo!,
        isAdd: true,
        pondo: courtTicketPrice,
      );
    }

    final updatedPlayerList = courtSlot.players..remove(player);

    // Nullify player's reservation at userInfo
    await userInfoRepo.reserveUserAt(userId: player.id, reservedAt: null);

    if (updatedPlayerList.isEmpty) {
      // If no player remains at courtSlot, remove the court slot
      await removeCourtSlot(courtSlot.courtId, courtSlot.slotId);
    } else {
      // Otherwise, push the updated list with the leaving user removed
      await firestoreHelper.setData(
        path: FirestorePath.docCourtSlot(courtSlot.courtId, courtSlot.slotId),
        data: {'players': updatedPlayerList.map((u) => u.toJson()).toList()},
        merge: true,
      );
    }
  }

  Future<List<KasadoUserInfo>> getUserInfosOfPlayersWithEnoughPondo({
    required double pondoToPay,
    required List<KasadoUser> teamPlayers,
  }) async {
    return firestoreHelper.collectionToList(
      path: FirestorePath.colUserInfos(),
      builder: (data, docId) => KasadoUserInfo.fromJson(data),
      queryBuilder: (query) => query
          // TODO: Limited to 10 teamPlayers only as per Firebase docs
          // (Might have to to fix in the future)
          .where('id', whereIn: teamPlayers.map((u) => u.id).toList())
          .where('pondo', isGreaterThanOrEqualTo: pondoToPay),
    );
  }

  Future<void> addTeamToCourtSlot({
    required String teamId,
    required CourtSlot courtSlot,
    required double courtTicketPrice,
  }) async {
    final team = await teamRepo.getTeam(teamId);
    final teamPlayers = team!.players;

    if (courtSlot.availablePlayerSlots >= teamPlayers.length) {
      final playerUserInfos = await userInfoRepo.getUserInfoList(
        teamPlayers.map((u) => u.id).toList(),
      );

      List<KasadoUser> _updatedTeamPlayers = [];

      // Get payment for court slot from players with enough pondo and also
      // indicate the players' team name
      for (final userInfo in playerUserInfos) {
        bool _hasPaid = false;
        if (userInfo.hasEnoughPondoToPay(courtTicketPrice)) {
          _hasPaid = true;
          await userInfoRepo.addOrDeductPondo(
            currentUserInfo: userInfo,
            isAdd: false,
            pondo: courtTicketPrice,
          );
        }
        _updatedTeamPlayers.add(userInfo.user.copyWith(
          hasPaid: _hasPaid,
          teamName: team.teamName,
        ));
      }

      // The whole courtSlot has to be pushed to cover for cases wherein the
      // courtSlot doesn't exist yet (has no players before adding team)
      await pushCourtSlot(
        courtSlot: courtSlot.copyWith(
          players: [...courtSlot.players, ..._updatedTeamPlayers],
        ),
      );

      // Reserve all team players at court slot
      await userInfoRepo.reserveTeamAt(
        teamPlayersIdList: teamPlayers.map((u) => u.id).toList(),
        reservedAt: courtSlot.copyWith(players: []),
      );
    } else {
      Fluttertoast.showToast(
        msg: "Your team can't fit for this slot, please choose another one",
      );
    }
  }

  Future<void> removeTeamFromCourtSlot({
    required String teamId,
    required CourtSlot courtSlot,
    required double courtTicketPrice,
  }) async {
    final _team = await teamRepo.getTeam(teamId);
    final _teamPlayerIds = _team!.players.map((u) => u.id).toList();

    // Get team players from courtSlot to determine whether a player in team
    // has already paid or not
    final _teamPlayersFromCourtSlot =
        courtSlot.players.where((p) => _teamPlayerIds.contains(p.id));

    final updatedPlayerList = courtSlot.players
      ..removeWhere((player) => _teamPlayersFromCourtSlot.contains(player));

    // Nullify the whole team's court slot reservations
    await userInfoRepo.reserveTeamAt(
      teamPlayersIdList: _teamPlayerIds,
      reservedAt: null,
    );

    // Return the money for players who have already paid for the slot
    for (final player in _teamPlayersFromCourtSlot) {
      if (player.hasPaid) {
        final baseUserInfo = await userInfoRepo.getUserInfo(player.id);
        await userInfoRepo.addOrDeductPondo(
          currentUserInfo: baseUserInfo!,
          isAdd: true,
          pondo: courtTicketPrice,
        );
      }
    }

    if (updatedPlayerList.isEmpty) {
      // If no player remains at courtSlot, remove the court slot
      await removeCourtSlot(courtSlot.courtId, courtSlot.slotId);
    } else {
      // Otherwise, push the updated list with the leaving team players removed
      await firestoreHelper.setData(
        path: FirestorePath.docCourtSlot(courtSlot.courtId, courtSlot.slotId),
        data: {'players': updatedPlayerList.map((u) => u.toJson()).toList()},
        merge: true,
      );
    }
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
