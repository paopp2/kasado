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
    required double courtTicketPrice,
    required String courtName,
    required VoidCallback onNotEnoughPondo,
  }) async {
    final userInfo = (await userInfoRepo.getUserInfo(player.id))!;

    // Ensure user has enough pondo before proceeding
    if (!userInfo.hasEnoughPondoToPay(courtTicketPrice)) {
      onNotEnoughPondo();
      return;
    }

    // Pay with pondo
    userInfoRepo.addOrDeductPondo(
      currentUserInfo: userInfo,
      isAdd: false,
      pondo: courtTicketPrice,
    );

    // The whole courtSlot has to be pushed to cover for cases wherein the
    // courtSlot doesn't exist yet (has no players before adding [player])
    await pushCourtSlot(
      courtSlot: courtSlot.copyWith(
        players: [...courtSlot.players, userInfo.user.copyWith(hasPaid: true)],
      ),
    );

    // Create a new ticket for joined courtSlot
    await userInfoRepo.createUserTicket(
      courtName: courtName,
      courtSlot: courtSlot,
      userInfo: userInfo,
    );
  }

  Future<void> removePlayerFromCourtSlot({
    required KasadoUser player,
    required CourtSlot courtSlot,
    required double courtTicketPrice,
  }) async {
    final baseUserInfo = await userInfoRepo.getUserInfo(player.id);
    if (player.hasPaid) {
      await userInfoRepo.addOrDeductPondo(
        currentUserInfo: baseUserInfo!,
        isAdd: true,
        pondo: courtTicketPrice,
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
    required String courtName,
    required double courtTicketPrice,
    required VoidCallback onTeamCantFit,
    required Function(List<KasadoUserInfo> playersLackingPondo)
        onNotAllHasEnoughPondo,
  }) async {
    final _team = await teamRepo.getTeam(teamId);
    final _teamPlayers = _team!.players;

    if (courtSlot.availablePlayerSlots >= _teamPlayers.length) {
      final playerUserInfos = await userInfoRepo.getUserInfoList(
        _teamPlayers.map((u) => u.id).toList(),
      );

      // Ensure every player in the team has enough pondo before proceeding
      final playersWhoLackPondo = playerUserInfos.where(
          (playerInfo) => !playerInfo.hasEnoughPondoToPay(courtTicketPrice));
      if (playersWhoLackPondo.isNotEmpty) {
        onNotAllHasEnoughPondo(playersWhoLackPondo.toList());
        return;
      }

      List<KasadoUser> _updatedTeamPlayers = [];
      for (final userInfo in playerUserInfos) {
        // Pay with pondo
        await userInfoRepo.addOrDeductPondo(
          currentUserInfo: userInfo,
          isAdd: false,
          pondo: courtTicketPrice,
        );

        // Indicate team name
        _updatedTeamPlayers.add(userInfo.user.copyWith(
          hasPaid: true,
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
        courtName: courtName,
      );
    } else {
      onTeamCantFit();
    }
  }

  Future<void> removeTeamFromCourtSlot({
    required String teamId,
    required KasadoUserInfo teamCaptainInfo,
    required CourtSlot courtSlot,
    required String courtName,
    required double courtTicketPrice,
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
          pondo: courtTicketPrice,
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
