import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/repositories/stat_repository.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_state.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:kasado/model/game_stats/game_stats.dart';
import 'package:kasado/model/stats/stats.dart';
import 'package:kasado/ui/admin/stat_manager/components/stat_player_chooser_dialog.dart';
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

  void removePlayerFromHomeTeam(KasadoUser player) {
    read(homeTeamPlayersProvider.notifier)
        .update((state) => [...state]..remove(player));
  }

  void addPlayerToAwayTeam(KasadoUser player) {
    read(awayTeamPlayersProvider.notifier)
        .update((state) => [...state, player]);
  }

  void removePlayerFromAwayTeam(KasadoUser player) {
    read(awayTeamPlayersProvider.notifier)
        .update((state) => [...state]..remove(player));
  }

  bool isHomePlayer(KasadoUser player) {
    return read(homeTeamPlayersProvider).contains(player);
  }

  Future<void> onPlayerShot({
    required BuildContext context,
    required bool isThree, // isTwo otherwise
    required bool wasMade,
    required CourtSlot courtSlot,
    required GameStats baseGameStats,
  }) async {
    final player = await showDialog(
      context: context,
      builder: (_) => const StatPlayerChooserDialog(),
    ) as KasadoUser;

    final _isHomePlayer = isHomePlayer(player);

    KasadoUser? playerWhoAssisted; // If shot was made
    KasadoUser? playerWhoBlocked; // If shot was missed
    if (wasMade) {
      playerWhoAssisted = await showDialog(
        context: context,
        builder: (_) => StatPlayerChooserDialog(
          showOneAndShowHome: _isHomePlayer,
        ),
      ) as KasadoUser?;
    } else {
      playerWhoBlocked = await showDialog(
        context: context,
        builder: (_) => StatPlayerChooserDialog(
          showOneAndShowHome: !_isHomePlayer,
        ),
      ) as KasadoUser?;
    }

    await statRepo.recordPlayerShotAttempt(
      playerWhoScored: player,
      playerWhoAssisted: playerWhoAssisted,
      playerWhoBlocked: playerWhoBlocked,
      isThree: isThree,
      baseGameStats: baseGameStats,
      courtSlot: courtSlot,
      isHomePlayer: _isHomePlayer,
      wasMade: wasMade,
    );
  }

  Future<void> onPlayerShotFT({
    required BuildContext context,
    required bool wasMade,
    required GameStats baseGameStats,
    required CourtSlot courtSlot,
  }) async {
    final player = await showDialog(
      context: context,
      builder: (_) => const StatPlayerChooserDialog(),
    ) as KasadoUser;

    await statRepo.recordPlayerFT(
      shootingPlayer: player,
      baseGameStats: baseGameStats,
      courtSlot: courtSlot,
      isHomePlayer: isHomePlayer(player),
      wasMade: wasMade,
    );
  }

  Future<void> onPlayerRebounded(
      {required BuildContext context,
      required bool isDefensive,
      required GameStats baseGameStats,
      required CourtSlot courtSlot,
      required}) async {
    final player = await showDialog(
      context: context,
      builder: (_) => const StatPlayerChooserDialog(),
    ) as KasadoUser;

    await statRepo.recordPlayerRebound(
      reboundingPlayer: player,
      baseGameStats: baseGameStats,
      courtSlot: courtSlot,
      isHomePlayer: isHomePlayer(player),
      isDefensive: isDefensive,
    );
  }

  Future<void> onPlayerSteal({
    required BuildContext context,
    required GameStats baseGameStats,
    required CourtSlot courtSlot,
  }) async {
    final player = await showDialog(
      context: context,
      builder: (_) => const StatPlayerChooserDialog(),
    ) as KasadoUser;

    await statRepo.recordPlayerSteal(
      playerWhoStealed: player,
      baseGameStats: baseGameStats,
      courtSlot: courtSlot,
      isHomePlayer: isHomePlayer(player),
    );
  }

  Future<void> endGame({
    required CourtSlot courtSlot,
    required GameStats gameStats,
  }) async {
    // Set the slotGameStatsPathProvider to null (unlistens to the just ended game)
    read(slotGameStatsPathProvider.notifier).state = null;

    // Reset homeTeam and awayTeam players
    read(homeTeamPlayersProvider.notifier).state = [];
    read(awayTeamPlayersProvider.notifier).state = [];

    await statRepo.publishPlayerStats(gameStats);
  }

  Future<void> initStatsForGame(
    BuildContext context,
    CourtSlot courtSlot,
  ) async {
    final homeTeamPlayers = read(homeTeamPlayersProvider);
    final awayTeamPlayers = read(awayTeamPlayersProvider);
    final gameStatId = const Uuid().v4();
    final initializedGameStats = GameStats(
      id: gameStatId,
      recordedAt: DateTime.now(),
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
    // Set the slotGameStatsPathProvider to the just pushed game
    read(slotGameStatsPathProvider.notifier).state =
        "${courtSlot.courtId}|${courtSlot.slotId}|$gameStatId";
    Navigator.pop(context);
  }
}
