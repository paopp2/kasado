import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/data/repositories/team_repository.dart';
import 'package:kasado/logic/home/states/team_tab_state.dart';
import 'package:kasado/logic/shared/view_model.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';
import 'package:kasado/model/team/team.dart';
import 'package:uuid/uuid.dart';

final teamTabModel = Provider.autoDispose(
  (ref) => TeamTabModel(
    read: ref.read,
    currentUser: ref.watch(currentUserProvider)!,
    teamRepo: ref.watch(teamRepositoryProvider),
  ),
);

class TeamTabModel extends ViewModel {
  TeamTabModel({
    required Reader read,
    required this.currentUser,
    required this.teamRepo,
  }) : super(read);

  final KasadoUser currentUser;
  final TeamRepository teamRepo;

  void addUserToTeam({
    required KasadoUserInfo userInfo,
    required String? teamId,
  }) {
    read(teamPlayersListProvider.notifier).update(
      (state) {
        if (userInfo.hasTeam && userInfo.teamId != teamId) {
          Fluttertoast.showToast(msg: "Player is at another team");
        } else if (userInfo.hasReserved) {
          Fluttertoast.showToast(
            msg: "Can't add player because player has slot reservations",
          );
        } else if (state.length == Team.maxPlayerCount) {
          Fluttertoast.showToast(msg: "Team already full");
        } else if (state.contains(userInfo.user)) {
          Fluttertoast.showToast(msg: "User already added");
        } else {
          read(mixpanel)!.track("Added a user to team build");
          return [...state, userInfo.user];
        }
        return state;
      },
    );
  }

  void removeUserFromTeamBuild(KasadoUser user) {
    read(mixpanel)!.track("Removed a player for team build");
    read(removedPlayersListProvider.notifier).update((state) {
      return [...state, user];
    });
    read(teamPlayersListProvider.notifier).update((state) {
      return [...state]..remove(user);
    });
  }

  Future<void> removeUserFromTeam({
    required Team team,
    required KasadoUser player,
    required bool teamHasReserved,
  }) async {
    if (teamHasReserved) {
      Fluttertoast.showToast(
        msg: "Can't leave team because team has a pending reservation",
      );
    } else {
      read(mixpanel)!.track("Left a team");
      await teamRepo.removePlayerFromTeam(team: team, player: player);
    }
  }

  Future<void> pushTeam({
    required BuildContext context,
    required String teamName,
    required Team? team,
    required bool hasReserved,
  }) async {
    final isEdit = team != null;
    final teamPlayersList = read(teamPlayersListProvider);
    if (teamPlayersList.length == 1) {
      Fluttertoast.showToast(msg: "There's no I in TEAM pre");
    } else if (hasReserved) {
      Fluttertoast.showToast(
          msg:
              "Please leave games you've joined before building/editing your team");
    } else {
      final playersToRemove = read(removedPlayersListProvider);
      if (playersToRemove.isNotEmpty) {
        // Remove team info for the removed players
        await teamRepo.removeTeamInfoForPlayers(
          playerIdList: playersToRemove.map((u) => u.id).toList(),
        );
        // Reset removedPlayersList state
        read(removedPlayersListProvider.notifier).state = [];
      }

      read(mixpanel)!.track("Pushed a team", properties: {"isUpdate": isEdit});

      await teamRepo.pushTeam(
        (isEdit)
            ? team.copyWith(
                players: teamPlayersList,
                customTeamName: teamName,
              )
            : Team(
                id: const Uuid().v4(),
                teamCaptain: currentUser,
                players: teamPlayersList,
                customTeamName: teamName,
              ),
      );
      Navigator.pop(context);
    }
  }

  Future<void> dissolveTeam({
    required bool hasReserved,
    required Team team,
    required BuildContext context,
  }) async {
    if (hasReserved) {
      Fluttertoast.showToast(
        msg:
            "Please leave the game you have joined before dissolving your team",
      );
    } else {
      read(mixpanel)!.track("Dissolved a team");
      await teamRepo.dissolveTeam(team);
      Navigator.pop(context);
    }
  }
}
