import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/repositories/stat_repository.dart';
import 'package:kasado/model/game_stats/game_stats.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';

/// For combinedPathIds, follow the following format: "[courtId]|[slotId]"
///
/// Reason: For consistent hashcode as per the Riverpod's .family documentation
final allSlotGamesStatsStreamProvider = StreamProvider.autoDispose
    .family<List<GameStats>, String>((ref, combinedPathIds) {
  final List<String> pathIdList = combinedPathIds.split('|');
  return ref
      .watch(statRepositoryProvider)
      .getAllSlotGameStatsStream(pathIdList[0], pathIdList[1]);
});

/// For combinedPathIds, follow the following format: "[courtId]|[slotId]|[statsId]"
///
/// Reason: For consistent hashcode as per the Riverpod's .family documentation
final slotGameStatsStreamProvider =
    StreamProvider.autoDispose.family<GameStats?, String?>(
  (ref, combinedPathIds) {
    if (combinedPathIds == null) return Stream.value(null);
    final List<String> pathIdList = combinedPathIds.split('|');
    return ref
        .watch(statRepositoryProvider)
        .getSlotGameStatsStream(pathIdList[0], pathIdList[1], pathIdList[2]);
  },
);

// If a game is started at StatsController, this will be set to :
// "[courtId]|[slotId]|[statsId]" (null if no game currently occurring)
final slotGameStatsPathProvider = StateProvider.autoDispose<String?>((ref) {
  ref.maintainState = true;
  return null;
});

final homeTeamPlayersProvider =
    StateProvider.autoDispose<List<KasadoUser>>((ref) => []);

final awayTeamPlayersProvider =
    StateProvider.autoDispose<List<KasadoUser>>((ref) => []);
