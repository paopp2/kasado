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
