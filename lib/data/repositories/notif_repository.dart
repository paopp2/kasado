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
    notif as NotifInfo;
    await firestoreHelper.setData(
      path: FirestorePath.docNotif(notif.id),
      data: notif.toJson(),
    );

    final notifRef = Notif.ref(id: notif.id);
    await firestoreHelper.setDataToAll(
      baseColPath: FirestorePath.colUserInfos(),
      endPath: FirestorePath.docNotif(notif.id),
      data: notifRef.toJson(),
    );
  }
}
