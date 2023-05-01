import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/constants/extensions/iterable_extensions.dart';
import 'package:kasado/data/repositories/court_slot_repository.dart';
import 'package:kasado/data/repositories/stat_repository.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_state.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:kasado/model/game_stats/game_stats.dart';
import 'package:kasado/model/stats/stats.dart';
import 'package:kasado/ui/admin/stat_manager/stats_controller/player_chooser_dialog.dart';
import 'package:time/time.dart';
import 'package:uuid/uuid.dart';

final gameStatController = Provider.autoDispose(
  (ref) => GameStatController(
    ref: ref,
    statRepo: ref.watch(statRepositoryProvider),
    courtSlotRepo: ref.watch(courtSlotRepositoryProvider),
  ),
);

class GameStatController {
  GameStatController({
    required this.ref,
    required this.statRepo,
    required this.courtSlotRepo,
  });
  final Ref ref;
  final StatRepository statRepo;
  final CourtSlotRepository courtSlotRepo;

  bool isHomePlayer(KasadoUser player) {
    return ref.read(homeTeamPlayersProvider).contains(player);
  }

  bool isAwayPlayer(KasadoUser player) {
    return ref.read(awayTeamPlayersProvider).contains(player);
  }

  void selectSlotGameStats(GameStats gameStats) {
    ref.read(selectedGameStatsProvider.notifier).state = gameStats;
  }

  Future<void> onUndoLastAction({
    required CourtSlot courtSlot,
    required String gameStatsId,
  }) async {
    await statRepo.cancelLastStatEntry(
      courtSlot: courtSlot,
      gameStatsId: gameStatsId,
    );
    Fluttertoast.showToast(msg: "Cancelled last input");
  }

  Future<void> onTeamShot({
    required CourtSlot courtSlot,
    required GameStats gameStats,
    required int pts,
    required bool isHome,
  }) async {
    await statRepo.addTeamPoints(
      pts: pts,
      isHome: isHome,
      courtSlot: courtSlot,
      gameStatsId: gameStats.id,
    );
  }

  Future<void> onPlayerShot({
    required BuildContext context,
    required bool isThree, // isTwo otherwise
    required bool wasMade,
    required CourtSlot courtSlot,
    required GameStats gameStats,
  }) async {
    final player = await showDialog(
      context: context,
      builder: (_) => const PlayerChooserDialog(),
    ) as KasadoUser?;
    if (player == null) return;

    final _isHomePlayer = isHomePlayer(player);

    KasadoUser? playerWhoAssisted;
    if (wasMade) {
      playerWhoAssisted = await showDialog(
        context: context,
        builder: (_) => PlayerChooserDialog(
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
      isCancel: false,
    );
  }

  Future<void> onPlayerShotFT({
    required BuildContext context,
    required bool wasMade,
    required GameStats gameStats,
    required CourtSlot courtSlot,
  }) async {
    final player = await showDialog(
      context: context,
      builder: (_) => const PlayerChooserDialog(),
    ) as KasadoUser?;
    if (player == null) return;

    await statRepo.recordPlayerFT(
      shootingPlayer: player,
      gameStatsId: gameStats.id,
      courtSlot: courtSlot,
      isHomePlayer: isHomePlayer(player),
      wasMade: wasMade,
      isCancel: false,
    );
  }

  Future<void> onPlayerRebounded({
    required BuildContext context,
    required bool isDefensive,
    required GameStats gameStats,
    required CourtSlot courtSlot,
  }) async {
    final player = await showDialog(
      context: context,
      builder: (_) => const PlayerChooserDialog(),
    ) as KasadoUser?;
    if (player == null) return;

    await statRepo.recordPlayerRebound(
      reboundingPlayer: player,
      gameStatsId: gameStats.id,
      courtSlot: courtSlot,
      isHomePlayer: isHomePlayer(player),
      isDefensive: isDefensive,
      isCancel: false,
    );
  }

  Future<void> onPlayerBlock({
    required BuildContext context,
    required GameStats gameStats,
    required CourtSlot courtSlot,
  }) async {
    final player = await showDialog(
      context: context,
      builder: (_) => const PlayerChooserDialog(),
    ) as KasadoUser?;
    if (player == null) return;

    await statRepo.recordPlayerBlock(
      playerWhoBlocked: player,
      gameStatsId: gameStats.id,
      courtSlot: courtSlot,
      isHomePlayer: isHomePlayer(player),
      isCancel: false,
    );
  }

  Future<void> onPlayerSteal({
    required BuildContext context,
    required GameStats gameStats,
    required CourtSlot courtSlot,
  }) async {
    final player = await showDialog(
      context: context,
      builder: (_) => const PlayerChooserDialog(),
    ) as KasadoUser?;
    if (player == null) return;

    await statRepo.recordPlayerSteal(
      playerWhoStealed: player,
      gameStatsId: gameStats.id,
      courtSlot: courtSlot,
      isHomePlayer: isHomePlayer(player),
      isCancel: false,
    );
  }

  Future<void> onPlayerTurnover({
    required BuildContext context,
    required GameStats gameStats,
    required CourtSlot courtSlot,
  }) async {
    final player = await showDialog(
      context: context,
      builder: (_) => const PlayerChooserDialog(),
    ) as KasadoUser?;
    if (player == null) return;

    await statRepo.recordPlayerTurnover(
      playerWhoTurnovered: player,
      gameStatsId: gameStats.id,
      courtSlot: courtSlot,
      isHomePlayer: isHomePlayer(player),
      isCancel: false,
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

    // Decrement games played by 1 (reset to original)
    await courtSlotRepo.addGamesPlayedForPlayers(
      delta: -1,
      courtSlot: courtSlot,
      gamePlayerIds: [
        ...gameStats.awayTeamStats.keys,
        ...gameStats.homeTeamStats.keys,
      ],
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
    bool scoreOnly = false,
  }) async {
    if (homeTeamPlayers.length != 5 || awayTeamPlayers.length != 5) {
      Fluttertoast.showToast(msg: "Incorrect number of players");

      return;
    }

    final gameStatId = const Uuid().v4();
    final homeTeamStats = {
      for (final player in homeTeamPlayers)
        player.id: Stats(player: player, courtSlot: courtSlot)
    };
    final awayTeamStats = {
      for (final player in awayTeamPlayers)
        player.id: Stats(player: player, courtSlot: courtSlot)
    };

    final initializedGameStats = scoreOnly
        ? GameStats.scoreOnly(
            id: gameStatId,
            recordedAt: DateTime.now(),
            homeTeamStats: homeTeamStats,
            awayTeamStats: awayTeamStats,
            isLive: true,
            remainingMsOnPaused: 15.minutes.inMilliseconds,
            endsAt: DateTime.now() + 15.minutes,
          )
        : GameStats(
            id: gameStatId,
            recordedAt: DateTime.now(),
            homeTeamStats: homeTeamStats,
            awayTeamStats: awayTeamStats,
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

    await courtSlotRepo.addGamesPlayedForPlayers(
      courtSlot: courtSlot,
      gamePlayerIds: [
        ...homeTeamPlayers,
        ...awayTeamPlayers,
      ].map((player) => player.id).toList(),
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
      updatedTeamPlayers = currentTeamPlayers.exclude(player);
    }
    await courtSlotRepo.updateStageTeamPlayers(
      courtId: courtSlot.courtId,
      slotId: courtSlot.slotId,
      teamPlayers: updatedTeamPlayers,
      isHome: isHome,
    );
  }

  Future<void> tradeToOtherTeam({
    required CourtSlot courtSlot,
    required KasadoUser playerToTrade,
    required BuildContext context,
  }) async {
    final homePlayers = [...courtSlot.stageHomeTeamPlayers!];
    final awayPlayers = [...courtSlot.stageAwayTeamPlayers!];

    if (homePlayers.length != 5 || awayPlayers.length != 5) {
      Fluttertoast.showToast(msg: "Lacking players");

      return;
    }

    final isPlayerFromHome = homePlayers.contains(playerToTrade);
    final playerOrigTeam = isPlayerFromHome ? homePlayers : awayPlayers;
    final playerFutureTeam = isPlayerFromHome ? awayPlayers : homePlayers;

    // Player from other team to trade with
    final otherPlayerToTrade = await showDialog(
      context: context,
      builder: (_) => PlayerChooserDialog(
        // Only show the players at the other team
        showOneAndShowHome: !isPlayerFromHome,
        homeTeamPlayersOverride: homePlayers,
        awayTeamPlayersOverride: awayPlayers,
      ),
    ) as KasadoUser?;
    if (otherPlayerToTrade == null) return;

    // Remove player from original team
    playerOrigTeam.remove(playerToTrade);

    // Remove otherPlayer from future team
    playerFutureTeam.remove(otherPlayerToTrade);

    // Add player to future team
    playerFutureTeam.add(playerToTrade);

    // Add otherPlayer to orig team
    playerOrigTeam.add(otherPlayerToTrade);

    // Update stage HOME team players
    await courtSlotRepo.updateStageTeamPlayers(
      courtId: courtSlot.courtId,
      slotId: courtSlot.slotId,
      isHome: true, // HOME
      teamPlayers: isPlayerFromHome ? playerOrigTeam : playerFutureTeam,
    );

    // Update stage AWAY team players
    await courtSlotRepo.updateStageTeamPlayers(
      courtId: courtSlot.courtId,
      slotId: courtSlot.slotId,
      isHome: false, // AWAY
      teamPlayers: isPlayerFromHome ? playerFutureTeam : playerOrigTeam,
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

  Future<void> setGameClock({
    required BuildContext context,
    required CourtSlot courtSlot,
    required GameStats gameStats,
    required bool isPaused,
  }) async {
    if (isPaused) {
      final remainingOnPaused = gameStats.remainingOnPaused!;
      final newRemainingTime = await showDurationPicker(
        context: context,
        initialTime: remainingOnPaused,
        baseUnit: BaseUnit.second,
      );
      if (newRemainingTime == null) return;

      await statRepo.setGameClock(
        courtSlot: courtSlot,
        gameStats: gameStats,
        newRemainingTime: newRemainingTime,
      );
    } else {
      Fluttertoast.showToast(msg: "Pause before setting a new time");
    }
  }

  void toggleToNextSortState() {
    final sortState = ref.read(teamsPlayersSetupSortProvider);
    ref.read(teamsPlayersSetupSortProvider.notifier).update(
          (s) => (sortState < 3) ? s + 1 : 0,
        );
  }

  /// Get players to show when setting up teams for a new game
  List<KasadoUser> getPlayersToShow({
    required CourtSlot courtSlot,
    required int sortState,
  }) {
    final playersMap = {
      for (final player in courtSlot.players) player.id: player,
    };

    // Using spreads to create new final instances, not just references to the original.
    // This avoids messing up the original arrangement of courtSlot.players when sorting
    final queuedPlayers = [
      ...courtSlot.playerIdQueue.map((pid) => playersMap[pid]!).toList(),
    ];
    final allPlayers = [...courtSlot.players];

    // If sortState == 0, show players added to queue only
    if (sortState == 0) return queuedPlayers;

    // If sortState == 1, show players staged to home & away teams
    if (sortState == 1) {
      return [
        ...courtSlot.stageHomeTeamPlayers!,
        ...courtSlot.stageAwayTeamPlayers!,
      ];
    }

    allPlayers.sort((a, b) {
      return (sortState == 2)
          // If sortState == 2, show players alphabetically
          ? a.displayName!.toLowerCase().compareTo(b.displayName!.toLowerCase())
          // If sortState == 3, show players according to games played
          : (courtSlot.slotInfoPerPlayer[a.id]?.timesPlayed ?? 0)
              .compareTo(courtSlot.slotInfoPerPlayer[b.id]?.timesPlayed ?? 0);
    });

    return allPlayers;
  }
}
