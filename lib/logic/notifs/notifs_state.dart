import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/repositories/notif_repository.dart';
import 'package:kasado/model/notif/notif.dart';

final isYesNoEnabledProvider = StateProvider.autoDispose((ref) => false);

final userNotifsStreamProvider =
    StreamProvider.autoDispose.family<List<Notif>, String>(
  (ref, userId) {
    final notifRepo = ref.watch(notifRepositoryProvider);
    return notifRepo.getUserNotifsStream(userId: userId);
  },
);

final notifMetaStreamProvider =
    StreamProvider.autoDispose.family<NotifMeta?, String>((ref, notifId) {
  final notifRepo = ref.watch(notifRepositoryProvider);
  return notifRepo.getNotifMetaStream(notifId: notifId);
});

final notifYesCountStreamProvider =
    StreamProvider.autoDispose.family<int, String>(
  (ref, notifId) {
    return ref
        .watch(notifMetaStreamProvider(notifId).stream)
        .map((notif) => notif?.yesCount ?? 0);
  },
);

final notifNoCountStreamProvider =
    StreamProvider.autoDispose.family<int, String>(
  (ref, notifId) {
    return ref
        .watch(notifMetaStreamProvider(notifId).stream)
        .map((notif) => notif?.noCount ?? 0);
  },
);

final unreadUserNotifCountStream =
    StreamProvider.autoDispose.family<int, String>(
  (ref, userId) {
    return ref.watch(userNotifsStreamProvider(userId).stream).map((notifList) {
      return notifList.where((notif) {
        notif as NotifObject;
        return !notif.isRead;
      }).length;
    });
  },
);
