import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/helpers/firestore_helper.dart';
import 'package:kasado/data/helpers/firestore_path.dart';
import 'package:kasado/model/notif/notif.dart';

final notifRepositoryProvider = Provider.autoDispose(
  (ref) => NotifRepository(firestoreHelper: FirestoreHelper.instance),
);

class NotifRepository {
  NotifRepository({required this.firestoreHelper});
  final FirestoreHelper firestoreHelper;

  Future<void> setUserFeedback({
    required String notifId,
    required bool isLike,
    required bool isAdd,
  }) async {
    final notif = await getNotifMeta(notifId: notifId);
    await firestoreHelper.setData(
      path: FirestorePath.docNotif(notifId),
      data: (isLike)
          ? {'yesCount': (isAdd) ? notif.yesCount + 1 : notif.yesCount - 1}
          : {'noCount': (isAdd) ? notif.noCount + 1 : notif.noCount - 1},
      merge: true,
    );
  }

  Future<void> setUnreadUserNotifsAsRead({required String userId}) async {
    final notifs = await getUnreadUserNotifs(userId: userId);
    for (final notif in notifs) {
      setUserNotifAsRead(userId: userId, notif: notif);
    }
  }

  Future<void> setUserNotifAsRead({
    required String userId,
    required Notif notif,
  }) async {
    notif as NotifObject;
    await firestoreHelper.setData(
      path: FirestorePath.docUserNotif(userId, notif.id),
      data: {'isRead': true},
      merge: true,
    );
  }

  Future<void> setUserNotifFeedbackState({
    required String userId,
    required NotifObject notif,
    required bool? hasLiked,
  }) async {
    await firestoreHelper.setData(
      path: FirestorePath.docUserNotif(userId, notif.id),
      data: {'hasLiked': hasLiked},
      merge: true,
    );
  }

  Future<void> sendNotifToAll({
    required Notif notif,
    bool needsFeedback = false,
  }) async {
    final notifMeta = Notif.meta(
      id: notif.id,
      title: notif.title,
      sentAt: notif.sentAt,
      needsFeedback: needsFeedback,
    );
    await firestoreHelper.setData(
      path: FirestorePath.docNotif(notif.id),
      data: notifMeta.toJson(),
    );

    await firestoreHelper.setBatchData(
      baseColPath: FirestorePath.colUserInfos(),
      endPath: FirestorePath.docNotif(notif.id),
      data: notif.toJson(),
    );
  }

  Future<void> deleteNotifForAll(String notifId) async {
    await firestoreHelper.deleteData(path: FirestorePath.docNotif(notifId));
    await firestoreHelper.batchDelete(
      baseColPath: FirestorePath.colUserInfos(),
      endPath: FirestorePath.docNotif(notifId),
    );
  }

  Future<NotifMeta> getNotifMeta({required String notifId}) async {
    return (await firestoreHelper.getData(
      path: FirestorePath.docNotif(notifId),
      builder: (data, docId) => NotifMeta.fromJson(data),
    ));
  }

  Stream<NotifMeta?> getNotifMetaStream({required String notifId}) {
    return firestoreHelper.documentStream(
      path: FirestorePath.docNotif(notifId),
      builder: (data, docId) => NotifMeta.fromJson(data),
    );
  }

  Stream<Notif?> getUserNotifStream({
    required String userId,
    required String notifId,
  }) {
    return firestoreHelper.documentStream(
      path: FirestorePath.docUserNotif(userId, notifId),
      builder: (data, docId) => Notif.fromJson(data),
    );
  }

  Future<List<Notif>> getUnreadUserNotifs({required String userId}) async {
    return firestoreHelper.collectionToList(
      path: FirestorePath.colUserNotifs(userId),
      builder: (data, docId) => Notif.fromJson(data),
      queryBuilder: (query) => query.where('isRead', isEqualTo: false),
    );
  }

  Stream<List<Notif>> getUserNotifsStream({required String userId}) {
    return firestoreHelper.collectionStream(
      path: FirestorePath.colUserNotifs(userId),
      builder: (data, docId) => Notif.fromJson(data),
      queryBuilder: (query) => query.orderBy('sentAt', descending: true),
    );
  }
}
