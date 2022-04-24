import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/repositories/court_repository.dart';

final courtsStreamProvider = StreamProvider.autoDispose(
  (ref) => ref.watch(courtRepositoryProvider).getCourtsStream(),
);

final isLoadedProvider = StateProvider((ref) => false);
