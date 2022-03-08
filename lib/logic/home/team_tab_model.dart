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
    read(teamUserInfoList.notifier).update((state) => [...state, userInfo]);
  }
}
