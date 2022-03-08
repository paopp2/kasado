import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/data/helpers/firestore_helper.dart';
import 'package:kasado/data/helpers/firestore_path.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';
import 'package:kasado/model/team/team.dart';

final teamRepositoryProvider = Provider.autoDispose(
  (ref) => TeamRepository(
    firestoreHelper: FirestoreHelper.instance,
    currentUser: ref.watch(currentUserProvider)!,
  ),
);

class TeamRepository {
  TeamRepository({
    required this.firestoreHelper,
    required this.currentUser,
  });
  final FirestoreHelper firestoreHelper;
  final KasadoUser currentUser;

  Future<void> pushTeam({
    required Team team,
    required List<KasadoUserInfo> teamPlayerUserInfos,
  }) async {
    await firestoreHelper.setData(
      path: FirestorePath.docTeam(team.id),
      data: team.toJson(),
    );
    for (final userInfo in teamPlayerUserInfos) {
      final isTeamCaptain = userInfo.id == team.teamCaptain.id;
      await firestoreHelper.setData(
        path: FirestorePath.docUserInfo(userInfo.id),
        data: {
          'teamId': team.id,
          'isTeamCaptain': isTeamCaptain,
        },
        merge: true,
      );
    }
  }

  Stream<Team?> getTeamStream(String teamId) {
    return firestoreHelper.documentStream(
      path: FirestorePath.docTeam(teamId),
      builder: (data, docId) => Team.fromJson(data),
    );
  }
}
