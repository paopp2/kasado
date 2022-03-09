import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/helpers/firestore_helper.dart';
import 'package:kasado/data/helpers/firestore_path.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';

final userInfoRepositoryProvider = Provider.autoDispose(
  (ref) => UserInfoRepository(firestoreHelper: FirestoreHelper.instance),
);

class UserInfoRepository {
  UserInfoRepository({required this.firestoreHelper});
  final FirestoreHelper firestoreHelper;

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
        data: KasadoUserInfo(id: user.id, user: user).toJson(),
      );
    }
  }

  Future<KasadoUserInfo?> getUserInfo(String userId) async {
    return await firestoreHelper.getData(
      path: FirestorePath.docUserInfo(userId),
      builder: (data, docId) => KasadoUserInfo.fromJson(data),
    );
  }

  Future<List<KasadoUserInfo>> getUserInfoList(List<String> userIdList) async {
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

  Future<void> reserveUserAt({
    required String userId,
    required CourtSlot? reservedAt,
  }) async {
    await firestoreHelper.setData(
      path: FirestorePath.docUserInfo(userId),
      data: {'reservedAt': reservedAt?.toJson()},
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
    await firestoreHelper.setData(
      path: FirestorePath.docUserInfo(currentUserInfo.id),
      data: {
        'pondo': (isAdd)
            ? (currentUserInfo.pondo + pondo)
            : (currentUserInfo.pondo - pondo),
      },
      merge: true,
    );
  }

  Stream<List<KasadoUser>> getCourtAdmins(Court court) {
    final courtAdminUserInfos = firestoreHelper.collectionStream(
      path: FirestorePath.colUserInfos(),
      builder: (data, docId) => KasadoUserInfo.fromJson(data),
      queryBuilder: (query) => query.where('id', whereIn: court.adminIds),
    );
    return courtAdminUserInfos.map((userInfoList) {
      return userInfoList.map((userInfo) => userInfo.user).toList();
    });
  }
}
