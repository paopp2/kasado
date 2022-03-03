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
    required bool isPositive,
  }) async {
    final notifMeta = await getNotifMeta(notifId: notifId);
    await firestoreHelper.setData(
      path: FirestorePath.docNotif(notifId),
      data: (isPositive)
          ? notifMeta.copyWith(yesCount: notifMeta.yesCount + 1).toJson()
          : notifMeta.copyWith(noCount: notifMeta.noCount + 1).toJson(),
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
      data: notif.copyWith(isRead: true).toJson(),
    );
  }

  Future<void> sendNotifToAll(Notif notif) async {
    final notifMeta = Notif.meta(id: notif.id, sentAt: notif.sentAt);
    await firestoreHelper.setData(
      path: FirestorePath.docNotif(notif.id),
      data: notifMeta.toJson(),
    );

    await firestoreHelper.setDataToAll(
      baseColPath: FirestorePath.colUserInfos(),
      endPath: FirestorePath.docNotif(notif.id),
      data: notif.toJson(),
    );
  }

  Future<void> deleteNotifForAll(String notifId) async {
    await firestoreHelper.deleteData(path: FirestorePath.docNotif(notifId));
    await firestoreHelper.deleteDataForAll(
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
