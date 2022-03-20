import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/repositories/stat_repository.dart';
import 'package:kasado/model/game_stats/game_stats.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';

/// For combinedPathIds, follow the following format: "[courtId]|[slotId]"
///
/// Reason: For consistent hashcode as per the Riverpod's .family documentation
final slotGamesStatsStreamProvider = StreamProvider.autoDispose
    .family<List<GameStats>, String>((ref, combinedPathIds) {
  final List<String> pathIdList = combinedPathIds.split('|');
  return ref
      .watch(statRepositoryProvider)
      .getSlotGameStatsStream(pathIdList[0], pathIdList[1]);
});

final homeTeamPlayersProvider =
    StateProvider.autoDispose<List<KasadoUser>>((ref) => []);

final awayTeamPlayersProvider =
    StateProvider.autoDispose<List<KasadoUser>>((ref) => []);
