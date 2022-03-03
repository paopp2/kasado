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
