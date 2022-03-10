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

  void addUserInfoToTeam(KasadoUserInfo userInfo) {
    read(teamUserInfoListProvider.notifier).update(
      (state) {
        if (!state.contains(userInfo)) return [...state, userInfo];

        Fluttertoast.showToast(msg: 'User already added');
        return state;
      },
    );
  }

  void removeUserInfoFromTeam(KasadoUserInfo userInfo) {
    read(teamUserInfoListProvider.notifier).update((state) {
      return [...state]..remove(userInfo);
    });
  }

  Future<void> pushTeam() async {
    final teamUserInfoList = read(teamUserInfoListProvider);
    await teamRepo.pushTeam(
      team: Team(
        id: const Uuid().v4(),
        teamCaptain: currentUser,
        players: teamUserInfoList.map((userInfo) => userInfo.user).toList(),
      ),
      teamPlayerUserInfos: teamUserInfoList,
    );
  }

  Future<void> dissolveTeam({
    required bool hasReserved,
    required Team team,
  }) async {
    if (hasReserved) {
      Fluttertoast.showToast(
        msg:
            "Please leave the game you have joined before dissolving your team",
      );
    } else {
      await teamRepo.dissolveTeam(team);
    }
  }
}
