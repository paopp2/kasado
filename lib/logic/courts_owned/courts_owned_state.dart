import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/data/repositories/court_repository.dart';

final selectedSchedChipIndicesProvider = StateProvider.autoDispose<List<int>>(
  (ref) {
    ref.maintainState = true;
    return [];
  },
);

final selectedDayChipIndicesProvider = StateProvider.autoDispose<List<int>>(
  (ref) {
    ref.maintainState = true;
    return [];
  },
);

final courtsOwnedListProvider = StreamProvider.autoDispose(
  (ref) {
    final currentUser = ref.watch(currentUserProvider);
    return ref
        .watch(courtRepositoryProvider)
        .getCourtsStream(admin: currentUser);
  },
);
