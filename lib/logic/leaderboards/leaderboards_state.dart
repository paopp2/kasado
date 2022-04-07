import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/repositories/stat_repository.dart';

final winRateLeadersStreamProvider = StreamProvider.autoDispose((ref) {
  final statRepo = ref.watch(statRepositoryProvider);
  return statRepo.getWinRateLeadersStream();
});
