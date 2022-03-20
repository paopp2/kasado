import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/repositories/stat_repository.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_state.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:kasado/model/game_stats/game_stats.dart';
import 'package:kasado/model/stats/stats.dart';
import 'package:uuid/uuid.dart';

final gameStatController = Provider.autoDispose(
  (ref) => GameStatController(
    read: ref.read,
    statRepo: ref.watch(statRepositoryProvider),
  ),
);

class GameStatController {
  GameStatController({
    required this.read,
    required this.statRepo,
  });
  final Reader read;
  final StatRepository statRepo;

  void addPlayerToHomeTeam(KasadoUser player) {
    read(homeTeamPlayersProvider.notifier)
        .update((state) => [...state, player]);
  }

  void addPlayerToAwayTeam(KasadoUser player) {
    read(awayTeamPlayersProvider.notifier)
        .update((state) => [...state, player]);
  }

  Future<void> initStatsForGame(CourtSlot courtSlot) async {
    final homeTeamPlayers = read(homeTeamPlayersProvider);
    final awayTeamPlayers = read(awayTeamPlayersProvider);
    final initializedGameStats = GameStats(
      id: const Uuid().v4(),
      homeTeamStats: {
        for (final player in homeTeamPlayers)
          player.id: Stats(player: player, courtSlot: courtSlot)
      },
      awayTeamStats: {
        for (final player in awayTeamPlayers)
          player.id: Stats(player: player, courtSlot: courtSlot)
      },
    );
    await statRepo.pushGameStats(
      courtSlot: courtSlot,
      gameStats: initializedGameStats,
    );
  }
}
