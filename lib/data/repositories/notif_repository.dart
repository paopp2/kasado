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

  Stream<List<Notif>> getUserNotifsStream({required String userId}) {
    return firestoreHelper.collectionStream(
      path: FirestorePath.colUserNotifs(userId),
      builder: (data, docId) => Notif.fromJson(data),
      queryBuilder: (query) =>
          query.orderBy('sentAt', descending: true).limit(10),
    );
  }
}
