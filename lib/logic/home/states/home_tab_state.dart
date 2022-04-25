import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/repositories/court_repository.dart';
import 'package:kasado/model/kasado_location/kasado_location.dart';

final selectedCenterLocProvider = StateProvider<KasadoLocation?>(
  (ref) => null,
);

final isLocationRetrievedProvider = StateProvider((ref) => false);

final courtsStreamProvider = StreamProvider.autoDispose(
  (ref) {
    final isLocationRetrieved = ref.watch(isLocationRetrievedProvider);

    return (isLocationRetrieved)
        ? ref.watch(courtRepositoryProvider).getCourtsStream(
              centerLoc: ref.watch(selectedCenterLocProvider),
            )
        : const Stream.empty();
  },
);

final isLoadedProvider = StateProvider((ref) => false);
