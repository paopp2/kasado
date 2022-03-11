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

  void addUserToTeam(KasadoUserInfo userInfo) {
    read(teamPlayersListProvider.notifier).update(
      (state) {
        if (state.length < Team.maxPlayerCount) {
          if (!state.contains(userInfo.user)) {
            if (userInfo.hasReserved) {
              Fluttertoast.showToast(
                msg:
                    "Can't add player because player is currently reserved for a game",
              );
            } else {
              return [...state, userInfo.user];
            }
          } else {
            Fluttertoast.showToast(msg: 'User already added');
          }
        } else {
          Fluttertoast.showToast(msg: "Team already full");
        }
        return state;
      },
    );
  }

  void removeUserFromTeamBuild(KasadoUser user) {
    read(teamPlayersListProvider.notifier).update((state) {
      return [...state]..remove(user);
    });
  }

  Future<void> pushTeam(BuildContext context) async {
    final teamPlayersList = read(teamPlayersListProvider);
    await teamRepo.pushTeam(
      Team(
        id: const Uuid().v4(),
        teamCaptain: currentUser,
        players: teamPlayersList,
      ),
    );
    Navigator.pop(context);
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
      await teamRepo.dissolveTeam(team);
    }
    Navigator.pop(context);
  }
}
