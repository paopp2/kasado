import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/data/helpers/firestore_helper.dart';
import 'package:kasado/data/helpers/firestore_path.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';
import 'package:kasado/model/team/team.dart';
import 'package:kasado/model/ticket/ticket.dart';

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

  Future<void> pushTeam(Team team) async {
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
      docIdList: team.players.map((p) => p.id).toList(),
      baseColPath: FirestorePath.colUserInfos(),
      dataFromId: (_) => {'teamId': team.id},
      merge: true,
    );
  }

  Future<void> removePlayerFromTeam({
    required Team team,
    required KasadoUser player,
  }) async {
    final updatedTeam = team.copyWith(players: team.players..remove(player));

    pushTeam(updatedTeam);

    await firestoreHelper.setData(
      path: FirestorePath.docUserInfo(player.id),
      data: {
        'teamId': null,
        'isTeamCaptain': false,
      },
      merge: true,
    );
  }

  Future<void> createTeamTicket({
    required KasadoUserInfo teamCaptainInfo,
    required Team team,
    required CourtSlot courtSlot,
    required String courtName,
  }) async {
    final teamTickets = [...teamCaptainInfo.tickets];

    // Remove expired tickets
    final now = DateTime.now();
    teamTickets.removeWhere((ticket) => ticket.expiry.isBefore(now));

    // Add new ticket
    teamTickets.add(Ticket(
      id: "${courtSlot.courtId}|${courtSlot.slotId}",
      courtSlot: courtSlot,
      courtName: courtName,
    ));

    // Update team players' tickets
    await firestoreHelper.setBatchDataForDocInList(
      docIdList: team.players.map((u) => u.id).toList(),
      baseColPath: FirestorePath.colUserInfos(),
      dataFromId: (_) => {
        'tickets': teamTickets.map((t) => t.toJson()).toList(),
      },
      merge: true,
    );
  }

  Future<void> removeTeamTicket({
    required KasadoUserInfo teamCaptainInfo,
    required Team team,
    required CourtSlot courtSlot,
  }) async {
    final teamTickets = [...teamCaptainInfo.tickets];

    // Remove the ticket user intends to remove as well as expired tickets
    final now = DateTime.now();
    teamTickets.removeWhere((ticket) {
      return (ticket.expiry.isBefore(now)) ||
          ticket.id == "${courtSlot.courtId}|${courtSlot.slotId}";
    });

    // Update team players' tickets
    await firestoreHelper.setBatchDataForDocInList(
      docIdList: team.players.map((u) => u.id).toList(),
      baseColPath: FirestorePath.colUserInfos(),
      dataFromId: (_) => {
        'tickets': teamTickets.map((t) => t.toJson()).toList(),
      },
      merge: true,
    );
  }

  /// Remove the team info for  players with IDs in [playerIdList]
  Future<void> removeTeamInfoForPlayers({
    required List<String> playerIdList,
  }) async {
    await firestoreHelper.setBatchDataForDocInList(
      baseColPath: FirestorePath.colUserInfos(),
      docIdList: playerIdList,
      dataFromId: (_) => {
        'teamId': null,
        'isTeamCaptain': false,
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

    await firestoreHelper.setBatchDataForDocInList(
      baseColPath: FirestorePath.colUserInfos(),
      docIdList: team.players.map((u) => u.id).toList(),
      dataFromId: (_) => {'teamId': null},
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
