import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/home/states/team_tab_state.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';

final teamTabModel = Provider.autoDispose(
  (ref) => TeamTabModel(read: ref.read),
);

class TeamTabModel {
  const TeamTabModel({
    required this.read,
  });
  final Reader read;

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
}
