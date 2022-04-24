import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/repositories/court_repository.dart';

final courtsStreamProvider = StreamProvider.autoDispose(
  (ref) => ref.watch(courtRepositoryProvider).getCourtsStream(
    // TODO: Replace with real location
    centerLatLng: {
      'lat': 10.383033221412328,
      'lng': 123.97179477071731,
    },
  ),
);

final isLoadedProvider = StateProvider((ref) => false);
