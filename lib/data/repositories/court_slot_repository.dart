import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
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

  Future<void> incGamesPlayedForPlayers({
    required CourtSlot courtSlot,
    required List<KasadoUser> gamePlayers,
  }) async {
    final playerIdList = gamePlayers.map((u) => u.id).toList();
    await firestoreHelper.setData(
      path: FirestorePath.docCourtSlot(courtSlot.courtId, courtSlot.slotId),
      data: {
        "slotInfoPerPlayer": {
          for (final playerId in playerIdList)
            playerId: {"timesPlayed": FieldValue.increment(1)}
        },
      },
      merge: true,
    );
  }

  Future<void> addPlayerIdToQueue({
    required CourtSlot courtSlot,
    required String playerId,
    VoidCallback? onPlayerAlreadyQueued,
  }) async {
    if (courtSlot.playerIdQueue.contains(playerId)) {
      onPlayerAlreadyQueued?.call();

      return;
    }

    final newPlayerIdQueue = [...courtSlot.playerIdQueue, playerId];
    await firestoreHelper.setData(
      path: FirestorePath.docCourtSlot(courtSlot.courtId, courtSlot.slotId),
      data: {"playerIdQueue": newPlayerIdQueue},
      merge: true,
    );
  }

  Future<void> removePlayerIdFromQueue({
    required CourtSlot courtSlot,
    required String playerId,
  }) async {
    final newPlayerIdQueue = [...courtSlot.playerIdQueue]..remove(playerId);
    await firestoreHelper.setData(
      path: FirestorePath.docCourtSlot(courtSlot.courtId, courtSlot.slotId),
      data: {"playerIdQueue": newPlayerIdQueue},
      merge: true,
    );
  }

  Future<void> setCourtSlotLiveGameStatsId({
    required CourtSlot courtSlot,
    required String? gameStatsId,
  }) async {
    await firestoreHelper.setData(
      path: FirestorePath.docCourtSlot(courtSlot.courtId, courtSlot.slotId),
      data: {"liveGameStatsId": gameStatsId},
      merge: true,
    );
  }

  Future<void> updateCourtSlotPlayers({
    required CourtSlot courtSlot,
    required List<KasadoUser> updatedPlayers,
  }) async {
    await firestoreHelper.setData(
      path: FirestorePath.docCourtSlot(courtSlot.courtId, courtSlot.slotId),
      data: {'players': updatedPlayers.map((u) => u.toJson()).toList()},
      merge: true,
    );
  }

  Future<void> addPlayerToCourtSlot({
    required KasadoUser player,
    required CourtSlot courtSlot,
    // TODO: The Future<bool> refers to user's decision whether to proceed without
    // pondo or otherwise. In the future user should not be able to proceed without pondo
    required Future<bool> Function() onNotEnoughPondo,
  }) async {
    KasadoUser? paidUser;
    final userInfo = await userInfoRepo.getUserInfo(player.id);
    // If slot is not full and user is not reserved at another slot, check
    // if user has enough pondo to pay for joining
    if (userInfo!.hasEnoughPondoToPay(courtSlot.ticketPrice)) {
      // If user has enough pondo, use pondo to pay for court ticket
      userInfoRepo.addOrDeductPondo(
        currentUserInfo: userInfo,
        isAdd: false,
        pondo: courtSlot.ticketPrice,
      );
      paidUser = userInfo.user.copyWith(hasPaid: true);
    } else {
      final isProceed = await onNotEnoughPondo();
      if (!isProceed) return;
    }

    // The whole courtSlot has to be pushed to cover for cases wherein the
    // courtSlot doesn't exist yet (has no players before adding [player])
    await pushCourtSlot(
      courtSlot: courtSlot.copyWith(
        players: [...courtSlot.players, paidUser ?? player],
      ),
    );

    // Create a new ticket for joined courtSlot
    await userInfoRepo.createUserTicket(
      courtSlot: courtSlot,
      userInfo: userInfo,
    );
  }

  Future<void> removePlayerFromCourtSlot({
    required KasadoUser player,
    required CourtSlot courtSlot,
  }) async {
    final baseUserInfo = await userInfoRepo.getUserInfo(player.id);
    if (player.hasPaid) {
      await userInfoRepo.addOrDeductPondo(
        currentUserInfo: baseUserInfo!,
        isAdd: true,
        pondo: courtSlot.ticketPrice,
      );
    }

    final updatedPlayerList = courtSlot.players..remove(player);

    // Remove user ticket
    await userInfoRepo.removeUserTicket(
      userInfo: baseUserInfo!,
      courtSlot: courtSlot,
    );

    if (updatedPlayerList.isEmpty) {
      // If no player remains at courtSlot, remove the court slot
      await removeCourtSlot(courtSlot.courtId, courtSlot.slotId);
    } else {
      // Otherwise, push the updated list with the leaving user removed
      await updateCourtSlotPlayers(
        courtSlot: courtSlot,
        updatedPlayers: updatedPlayerList,
      );
    }
  }

  Future<void> addTeamToCourtSlot({
    required String teamId,
    required KasadoUserInfo teamCaptainInfo,
    required CourtSlot courtSlot,
    required VoidCallback onTeamCantFit,
    // TODO: The Future<bool> refers to teamCaptain's decision whether to
    // proceed lacking pondo or otherwise. In the future user should not be able
    // to proceed without pondo
    required Future<bool> Function(List<KasadoUserInfo> playersLackingPondo)
        onNotAllHasEnoughPondo,
  }) async {
    final _team = await teamRepo.getTeam(teamId);
    final _teamPlayers = _team!.players;

    if (courtSlot.availablePlayerSlots >= _teamPlayers.length) {
      final playerUserInfos = await userInfoRepo.getUserInfoList(
        _teamPlayers.map((u) => u.id).toList(),
      );

      // Check if every player in the team has enough pondo before proceeding
      final playersWhoLackPondo = playerUserInfos.where((playerInfo) =>
          !playerInfo.hasEnoughPondoToPay(courtSlot.ticketPrice));
      if (playersWhoLackPondo.isNotEmpty) {
        final isProceed =
            await onNotAllHasEnoughPondo(playersWhoLackPondo.toList());
        if (!isProceed) return;
      }

      // Get payment for court slot from players with enough pondo and also
      // indicate the players' team name
      List<KasadoUser> _updatedTeamPlayers = [];
      for (final userInfo in playerUserInfos) {
        bool _hasPaid = false;
        if (userInfo.hasEnoughPondoToPay(courtSlot.ticketPrice)) {
          _hasPaid = true;
          await userInfoRepo.addOrDeductPondo(
            currentUserInfo: userInfo,
            isAdd: false,
            pondo: courtSlot.ticketPrice,
          );
        }
        _updatedTeamPlayers.add(userInfo.user.copyWith(
          hasPaid: _hasPaid,
          teamName: _team.teamName,
        ));
      }

      // The whole courtSlot has to be pushed to cover for cases wherein the
      // courtSlot doesn't exist yet (has no players before adding team)
      await pushCourtSlot(
        courtSlot: courtSlot.copyWith(
          players: [...courtSlot.players, ..._updatedTeamPlayers],
        ),
      );

      // Create a ticket for the team
      await teamRepo.createTeamTicket(
        teamCaptainInfo: teamCaptainInfo,
        team: _team,
        courtSlot: courtSlot,
      );
    } else {
      onTeamCantFit();
    }
  }

  Future<void> removeTeamFromCourtSlot({
    required String teamId,
    required KasadoUserInfo teamCaptainInfo,
    required CourtSlot courtSlot,
  }) async {
    final _team = await teamRepo.getTeam(teamId);
    final _teamPlayerIds = _team!.players.map((u) => u.id).toList();

    // Get team players from courtSlot to determine whether a player in team
    // has already paid or not
    final _teamPlayersFromCourtSlot =
        courtSlot.players.where((p) => _teamPlayerIds.contains(p.id)).toList();

    final updatedPlayerList = courtSlot.players
      ..removeWhere((player) => _teamPlayersFromCourtSlot.contains(player));

    // Remove this slot's ticket for the team
    await teamRepo.removeTeamTicket(
      teamCaptainInfo: teamCaptainInfo,
      team: _team,
      courtSlot: courtSlot,
    );

    // Return the money for players who have already paid for the slot
    for (final player in _teamPlayersFromCourtSlot) {
      if (player.hasPaid) {
        final baseUserInfo = await userInfoRepo.getUserInfo(player.id);
        await userInfoRepo.addOrDeductPondo(
          currentUserInfo: baseUserInfo!,
          isAdd: true,
          pondo: courtSlot.ticketPrice,
        );
      }
    }

    if (updatedPlayerList.isEmpty) {
      // If no player remains at courtSlot, remove the court slot
      await removeCourtSlot(courtSlot.courtId, courtSlot.slotId);
    } else {
      // Otherwise, push the updated list with the leaving team players removed
      await updateCourtSlotPlayers(
        courtSlot: courtSlot,
        updatedPlayers: updatedPlayerList,
      );
    }
  }

  Future<void> setCourtSlotClosed({
    required CourtSlot courtSlot,
    required bool isCourtClosed,
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
            pondo: courtSlot.ticketPrice,
          );
        }

        // Remove user ticket
        await userInfoRepo.removeUserTicket(
          userInfo: userInfo,
          courtSlot: courtSlot,
        );
      }

      // Flag court as closedByAdmin (the whole court slot must be pushed to cover
      // for cases wherein courtslot doesn't exist yet (no players))
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

  Future<CourtSlot?> getCourtSlot(String courtId, String slotId) async {
    return await firestoreHelper.getData(
      path: FirestorePath.docCourtSlot(courtId, slotId),
      builder: (data, docId) => CourtSlot.fromJson(data),
    );
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

  Future<void> updateStageTeamPlayers({
    required String courtId,
    required String slotId,
    required List<KasadoUser> teamPlayers,
    required bool isHome,
  }) async {
    await firestoreHelper.setData(
      path: FirestorePath.docCourtSlot(courtId, slotId),
      data: {
        "stage${(isHome) ? 'Home' : 'Away'}TeamPlayers":
            teamPlayers.map((u) => u.toJson()).toList()
      },
      merge: true,
    );
  }
}
