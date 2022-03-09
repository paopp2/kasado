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

    await firestoreHelper.setData(
      path: FirestorePath.docUserInfo(team.teamCaptain.id),
      data: {'isTeamCaptain': true},
      merge: true,
    );

    await firestoreHelper.setBatchDataForDocInList(
      docIdList: teamPlayerUserInfos.map((u) => u.id).toList(),
      baseColPath: FirestorePath.colUserInfos(),
      data: {
        'teamId': team.id,
        'reservedAt': null, // Remove any pending reservations for user
      },
      merge: true,
    );
  }

  Future<void> dissolveTeam(Team team) async {
    await firestoreHelper.deleteData(path: FirestorePath.docTeam(team.id));

    await firestoreHelper.setData(
      path: FirestorePath.docUserInfo(team.teamCaptain.id),
      data: {'isTeamCaptain': false},
      merge: true,
    );

    await firestoreHelper.setBatchData(
      baseColPath: FirestorePath.colUserInfos(),
      data: {
        'teamId': null,
        'reservedAt': null, // Remove any pending reservations for user
      },
      merge: true,
    );
  }

  Future<Team?> getTeam(String teamId) async {
    return (await firestoreHelper.getData(
      path: FirestorePath.docTeam(teamId),
      builder: (data, docId) => Team.fromJson(data),
    ));
  }

  Stream<Team?> getTeamStream(String teamId) {
    return firestoreHelper.documentStream(
      path: FirestorePath.docTeam(teamId),
      builder: (data, docId) => Team.fromJson(data),
    );
  }
}
