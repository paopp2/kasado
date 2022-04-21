import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/repositories/court_slot_repository.dart';
import 'package:kasado/data/repositories/stat_repository.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_state.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:kasado/model/game_stats/game_stats.dart';
import 'package:kasado/model/stats/stats.dart';
import 'package:kasado/ui/admin/stat_manager/components/stat_player_chooser_dialog.dart';
import 'package:time/time.dart';
import 'package:uuid/uuid.dart';

final gameStatController = Provider.autoDispose(
  (ref) => GameStatController(
    read: ref.read,
    statRepo: ref.watch(statRepositoryProvider),
    courtSlotRepo: ref.watch(courtSlotRepositoryProvider),
  ),
);

class GameStatController {
  GameStatController({
    required this.read,
    required this.statRepo,
    required this.courtSlotRepo,
  });
  final Reader read;
  final StatRepository statRepo;
  final CourtSlotRepository courtSlotRepo;

  bool isHomePlayer(KasadoUser player) {
    return read(homeTeamPlayersProvider).contains(player);
  }

  bool isAwayPlayer(KasadoUser player) {
    return read(awayTeamPlayersProvider).contains(player);
  }

  void selectSlotGameStats(GameStats gameStats) {
    read(selectedGameStatsProvider.notifier).state = gameStats;
  }

  Future<void> onPlayerShot({
    required BuildContext context,
    required bool isThree, // isTwo otherwise
    required bool wasMade,
    required CourtSlot courtSlot,
    required GameStats gameStats,
    bool isCancel = false,
  }) async {
    final player = await showDialog(
      context: context,
      builder: (_) => const StatPlayerChooserDialog(),
    ) as KasadoUser?;
    if (player == null) return;

    final _isHomePlayer = isHomePlayer(player);

    KasadoUser? playerWhoAssisted;
    if (wasMade) {
      playerWhoAssisted = await showDialog(
        context: context,
        builder: (_) => StatPlayerChooserDialog(
          showOneAndShowHome: _isHomePlayer,
        ),
      ) as KasadoUser?;
    }

    await statRepo.recordPlayerShotAttempt(
      playerWhoScored: player,
      playerWhoAssisted: playerWhoAssisted,
      isThree: isThree,
      gameStatsId: gameStats.id,
      courtSlot: courtSlot,
      isHomePlayer: _isHomePlayer,
      wasMade: wasMade,
      isCancel: isCancel,
    );
  }

  Future<void> onPlayerShotFT({
    required BuildContext context,
    required bool wasMade,
    required GameStats gameStats,
    required CourtSlot courtSlot,
    bool isCancel = false,
  }) async {
    final player = await showDialog(
      context: context,
      builder: (_) => const StatPlayerChooserDialog(),
    ) as KasadoUser?;
    if (player == null) return;

    await statRepo.recordPlayerFT(
      shootingPlayer: player,
      gameStatsId: gameStats.id,
      courtSlot: courtSlot,
      isHomePlayer: isHomePlayer(player),
      wasMade: wasMade,
      isCancel: isCancel,
    );
  }

  Future<void> onPlayerRebounded({
    required BuildContext context,
    required bool isDefensive,
    required GameStats gameStats,
    required CourtSlot courtSlot,
    bool isCancel = false,
  }) async {
    final player = await showDialog(
      context: context,
      builder: (_) => const StatPlayerChooserDialog(),
    ) as KasadoUser?;
    if (player == null) return;

    await statRepo.recordPlayerRebound(
      reboundingPlayer: player,
      gameStatsId: gameStats.id,
      courtSlot: courtSlot,
      isHomePlayer: isHomePlayer(player),
      isDefensive: isDefensive,
      isCancel: isCancel,
    );
  }

  Future<void> onPlayerBlock({
    required BuildContext context,
    required GameStats gameStats,
    required CourtSlot courtSlot,
    bool isCancel = false,
  }) async {
    final player = await showDialog(
      context: context,
      builder: (_) => const StatPlayerChooserDialog(),
    ) as KasadoUser?;
    if (player == null) return;

    await statRepo.recordPlayerBlock(
      playerWhoBlocked: player,
      gameStatsId: gameStats.id,
      courtSlot: courtSlot,
      isHomePlayer: isHomePlayer(player),
      isCancel: isCancel,
    );
  }

  Future<void> onPlayerSteal({
    required BuildContext context,
    required GameStats gameStats,
    required CourtSlot courtSlot,
    bool isCancel = false,
  }) async {
    final player = await showDialog(
      context: context,
      builder: (_) => const StatPlayerChooserDialog(),
    ) as KasadoUser?;
    if (player == null) return;

    await statRepo.recordPlayerSteal(
      playerWhoStealed: player,
      gameStatsId: gameStats.id,
      courtSlot: courtSlot,
      isHomePlayer: isHomePlayer(player),
      isCancel: isCancel,
    );
  }

  Future<void> cancelGame({
    required CourtSlot courtSlot,
    required GameStats gameStats,
  }) async {
    await courtSlotRepo.setCourtSlotLiveGameStatsId(
      courtSlot: courtSlot,
      gameStatsId: null,
    );

    await statRepo.cancelGame(courtSlot: courtSlot, gameStats: gameStats);
  }

  Future<void> endGame({
    required CourtSlot courtSlot,
    required GameStats gameStats,
  }) async {
    await courtSlotRepo.setCourtSlotLiveGameStatsId(
      courtSlot: courtSlot,
      gameStatsId: null,
    );

    await statRepo.concludeGameStats(
      gameStats: gameStats,
      courtSlot: courtSlot,
    );
  }

  Future<void> initStatsForGame({
    required BuildContext context,
    required CourtSlot courtSlot,
    required List<KasadoUser> homeTeamPlayers,
    required List<KasadoUser> awayTeamPlayers,
  }) async {
    if (homeTeamPlayers.length != 5 || awayTeamPlayers.length != 5) {
      Fluttertoast.showToast(msg: "Incorrect number of players");

      return;
    }

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
      isLive: true,
      remainingMsOnPaused: 15.minutes.inMilliseconds,
      endsAt: DateTime.now() + 15.minutes,
    );
    await statRepo.pushGameStats(
      courtSlot: courtSlot,
      gameStats: initializedGameStats,
    );

    // Set the courtSlot.liveGameStatsId to refer to just pushed gameStats
    await courtSlotRepo.setCourtSlotLiveGameStatsId(
      courtSlot: courtSlot,
      gameStatsId: gameStatId,
    );
  }

  Future<void> updateTeamStage({
    required CourtSlot courtSlot,
    required KasadoUser player,
    required bool isHome,
    required bool isPlayerAdd,
  }) async {
    final currentTeamPlayers = (isHome)
        ? courtSlot.stageHomeTeamPlayers ?? []
        : courtSlot.stageAwayTeamPlayers ?? [];

    final List<KasadoUser> updatedTeamPlayers;
    if (isPlayerAdd) {
      if ((courtSlot.stageHomeTeamPlayers ?? []).contains(player) ||
          (courtSlot.stageAwayTeamPlayers ?? []).contains(player)) {
        Fluttertoast.showToast(msg: "Player already added to a team");

        return;
      }
      if (currentTeamPlayers.length == 5) {
        Fluttertoast.showToast(msg: "Team already has 5 players");

        return;
      }
      updatedTeamPlayers = [...currentTeamPlayers, player];
    } else {
      updatedTeamPlayers = currentTeamPlayers..remove(player);
    }
    await courtSlotRepo.updateStageTeamPlayers(
      courtId: courtSlot.courtId,
      slotId: courtSlot.slotId,
      teamPlayers: updatedTeamPlayers,
      isHome: isHome,
    );
  }

  Future<void> resetAllStageTeams({required CourtSlot courtSlot}) async {
    await courtSlotRepo.updateStageTeamPlayers(
      courtId: courtSlot.courtId,
      slotId: courtSlot.slotId,
      teamPlayers: [],
      isHome: true,
    );
    await courtSlotRepo.updateStageTeamPlayers(
      courtId: courtSlot.courtId,
      slotId: courtSlot.slotId,
      teamPlayers: [],
      isHome: false,
    );
  }

  Future<void> pauseOrPlayGameClock({
    required CourtSlot courtSlot,
    required GameStats gameStats,
    required bool isPaused,
  }) async {
    await statRepo.pauseOrPlayGameClock(
      courtSlot: courtSlot,
      gameStats: gameStats,
      isPaused: isPaused,
    );
  }
}
