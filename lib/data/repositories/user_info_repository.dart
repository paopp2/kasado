import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/data/helpers/firestore_helper.dart';
import 'package:kasado/data/helpers/firestore_path.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';
import 'package:kasado/model/stats/stats.dart';
import 'package:kasado/model/ticket/ticket.dart';
import 'package:kasado/model/user_bio/user_bio.dart';

final userInfoRepositoryProvider = Provider.autoDispose(
  (ref) => UserInfoRepository(
    ref: ref,
    firestoreHelper: FirestoreHelper.instance,
  ),
);

class UserInfoRepository {
  UserInfoRepository({
    required this.firestoreHelper,
    required this.ref,
  });
  final FirestoreHelper firestoreHelper;
  final Ref ref;

  Future<bool> userHasInfo(String userId) async {
    return await firestoreHelper.docExists(
      path: FirestorePath.docUserInfo(userId),
    );
  }

  Future<void> pushUserInfoIfNonExistent(KasadoUser user) async {
    final bool userInfoExists = await userHasInfo(user.id);
    if (!userInfoExists) {
      await firestoreHelper.setData(
        path: FirestorePath.docUserInfo(user.id),
        data: KasadoUserInfo.newInstance(user).toJson(),
      );
    }
  }

  Future<void> pushUserBio({
    required String userId,
    required UserBio userBio,
  }) async {
    await firestoreHelper.setData(
      path: FirestorePath.docUserInfo(userId),
      data: {
        'user': {
          'userBio': userBio.toJson(),
        },
      },
      merge: true,
    );
  }

  Future<KasadoUserInfo?> getUserInfo(String userId) async {
    return await firestoreHelper.getData(
      path: FirestorePath.docUserInfo(userId),
      builder: (data, docId) => KasadoUserInfo.fromJson(data),
    );
  }

  Future<List<KasadoUserInfo>> getUserInfoList(List<String> userIdList) async {
    // whereIn queries can only accept a list of up to 10 values
    assert(userIdList.length <= 10);

    return firestoreHelper.collectionToList(
      path: FirestorePath.colUserInfos(),
      builder: (data, docId) => KasadoUserInfo.fromJson(data),
      queryBuilder: (query) => query.where('id', whereIn: userIdList),
    );
  }

  Stream<List<KasadoUserInfo>> getUserInfosStream([
    String? userEmailQuery,
  ]) {
    return firestoreHelper.collectionStream(
      path: FirestorePath.colUserInfos(),
      builder: (data, docId) => KasadoUserInfo.fromJson(data),
      queryBuilder: (query) => query.where(
        'user.email',
        isGreaterThanOrEqualTo: userEmailQuery,
        isLessThanOrEqualTo: (userEmailQuery ?? '') + '\uf8ff',
      ),
    );
  }

  Future<List<KasadoUserInfo>> getUserInfoQueryResults([
    String? userEmailQuery,
  ]) async {
    final query = ref
        .read(algolia)
        .instance
        .index('user_info')
        .query(userEmailQuery ?? '');
    final snap = await query.getObjects();

    return snap.hits.map((h) => KasadoUserInfo.fromJson(h.data)).toList();
  }

  Stream<KasadoUserInfo?> getUserInfoStream(String userId) {
    return firestoreHelper.documentStream(
      path: FirestorePath.docUserInfo(userId),
      builder: (data, docId) => KasadoUserInfo.fromJson(data),
    );
  }

  Future<void> setUserAdminPrivileges({
    required String userId,
    required bool isAdmin,
  }) async {
    await firestoreHelper.setData(
      path: FirestorePath.docUserInfo(userId),
      data: {'isAdmin': isAdmin},
      merge: true,
    );
  }

  Future<void> createUserTicket({
    required KasadoUserInfo userInfo,
    required CourtSlot courtSlot,
  }) async {
    final userTickets = [...userInfo.tickets];

    // Remove expired tickets
    userTickets.removeWhere((ticket) => ticket.isExpired);

    // Add new ticket
    userTickets.add(Ticket(
      id: "${courtSlot.courtId}|${courtSlot.slotId}",
      courtSlot: courtSlot,
    ));

    // Sort tickets from earliest to latest
    userTickets.sort((a, b) => a.courtSlot.timeRange.startsAt
        .compareTo(b.courtSlot.timeRange.startsAt));

    await firestoreHelper.setData(
      path: FirestorePath.docUserInfo(userInfo.id),
      data: {'tickets': userTickets.map((t) => t.toJson()).toList()},
      merge: true,
    );
  }

  Future<void> removeUserTicket({
    required KasadoUserInfo userInfo,
    required CourtSlot courtSlot,
  }) async {
    final userTickets = [...userInfo.tickets];

    // Remove the ticket user intends to remove as well as expired tickets
    userTickets.removeWhere((ticket) {
      return (ticket.isExpired) ||
          ticket.id == "${courtSlot.courtId}|${courtSlot.slotId}";
    });

    await firestoreHelper.setData(
      path: FirestorePath.docUserInfo(userInfo.id),
      data: {'tickets': userTickets.map((t) => t.toJson()).toList()},
      merge: true,
    );
  }

  /// Add [pondo] to user with [currentUserInfo.id] if [isAdd],
  /// deduct if otherwise
  Future<void> addOrDeductPondo({
    required KasadoUserInfo currentUserInfo,
    required bool isAdd,
    required double pondo,
  }) async {
    final pondoToIncrement = pondo * (isAdd ? 1 : -1);
    await firestoreHelper.setData(
      path: FirestorePath.docUserInfo(currentUserInfo.id),
      data: {'pondo': FieldValue.increment(pondoToIncrement)},
      merge: true,
    );
  }

  Stream<List<KasadoUser>> getCourtAdmins(Court court) {
    // whereIn queries can only accept a list of up to 10 values
    assert(court.adminIds.length <= 10);
    final courtAdminUserInfos = firestoreHelper.collectionStream(
      path: FirestorePath.colUserInfos(),
      builder: (data, docId) => KasadoUserInfo.fromJson(data),
      queryBuilder: (query) => query.where('id', whereIn: court.adminIds),
    );

    return courtAdminUserInfos.map((userInfoList) =>
        userInfoList.map((userInfo) => userInfo.user).toList());
  }

  Stream<List<Stats>> getUserStatsStream(String userId) {
    return firestoreHelper.collectionStream(
      path: FirestorePath.colUserStats(userId),
      builder: (data, docId) => Stats.fromJson(data).copyWith(id: docId),
      queryBuilder: (query) => query
          .orderBy('courtSlot.timeRange.startsAt', descending: true)
          .orderBy('savedAt', descending: true),
    );
  }
}
