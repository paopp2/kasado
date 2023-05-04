import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/constants/enums/game_stat_entry_type.dart';
import 'package:kasado/constants/extensions/iterable_extensions.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/data/helpers/firestore_helper.dart';
import 'package:kasado/data/helpers/firestore_path.dart';
import 'package:kasado/data/repositories/court_slot_repository.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/game_stat_entry/game_stat_entry.dart';
import 'package:kasado/model/game_stats/game_stats.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:kasado/model/overview_stats/overview_stats.dart';
import 'package:kasado/model/stats/stats.dart';

final statRepositoryProvider = Provider.autoDispose(
  (ref) => StatRepository(
    firestoreHelper: FirestoreHelper.instance,
    courtSlotRepo: ref.watch(courtSlotRepositoryProvider),
    appMeta: ref.watch(appMetaFutureProvider.future),
  ),
);

class StatRepository {
  StatRepository({
    required this.firestoreHelper,
    required this.courtSlotRepo,
    required this.appMeta,
  });

  final FirestoreHelper firestoreHelper;
  final CourtSlotRepository courtSlotRepo;
  final Future<Map<String, dynamic>> appMeta;
  List<Map<String, dynamic>> localStatEntryJsonHistory = [];

  Future<void> pushGameStats({
    required CourtSlot courtSlot,
    required GameStats gameStats,
  }) async {
    await firestoreHelper.setData(
      path: FirestorePath.docGameStats(
        courtSlot.courtId,
        courtSlot.slotId,
        gameStats.id,
      ),
      data: gameStats.toJson(),
    );
  }

  Future<void> pauseOrPlayGameClock({
    required CourtSlot courtSlot,
    required GameStats gameStats,
    required bool isPaused,
  }) async {
    await firestoreHelper.setData(
      path: FirestorePath.docGameStats(
        courtSlot.courtId,
        courtSlot.slotId,
        gameStats.id,
      ),
      data: (isPaused)
          ? {
              'endsAt': DateTime.now()
                  .add(gameStats.remainingOnPaused!)
                  .toIso8601String(),
              'remainingMsOnPaused': null,
            }
          : {
              'remainingMsOnPaused':
                  gameStats.endsAt!.difference(DateTime.now()).inMilliseconds
            },
      merge: true,
    );
  }

  Future<void> setGameClock({
    required CourtSlot courtSlot,
    required GameStats gameStats,
    required Duration newRemainingTime,
  }) async {
    final newEndsAt = DateTime.now().add(newRemainingTime);
    await firestoreHelper.setData(
      path: FirestorePath.docGameStats(
        courtSlot.courtId,
        courtSlot.slotId,
        gameStats.id,
      ),
      data: {
        'endsAt': newEndsAt.toIso8601String(),
        'remainingMsOnPaused': newRemainingTime.inMilliseconds,
      },
      merge: true,
    );
  }

  Stream<List<GameStats>> getAllSlotGameStatsStream(
    String courtId,
    String slotId,
  ) {
    return firestoreHelper.collectionStream(
      path: FirestorePath.colGameStats(courtId, slotId),
      builder: (data, _) => GameStats.fromJson(data),
      queryBuilder: (query) => query.orderBy("recordedAt"),
    );
  }

  Stream<GameStats?> getSlotGameStatsStream(
    String courtId,
    String slotId,
    String statsId,
  ) {
    return firestoreHelper.documentStream(
      path: FirestorePath.docGameStats(courtId, slotId, statsId),
      builder: (data, _) => GameStats.fromJson(data),
    );
  }

  Future<void> _pushToStatHistory({
    required CourtSlot courtSlot,
    required String gameStatsId,
    required GameStatEntry gameStatEntry,
  }) async {
    final gameStatEntryAsJson =
        gameStatEntry.copyWith(savedAt: DateTime.now()).toJson();
    await firestoreHelper.setData(
      path: FirestorePath.docGameStats(
        courtSlot.courtId,
        courtSlot.slotId,
        gameStatsId,
      ),
      data: {
        'statEntryHistory': FieldValue.arrayUnion([gameStatEntryAsJson])
      },
      merge: true,
    );

    localStatEntryJsonHistory.add(gameStatEntryAsJson);
  }

  Future<void> cancelLastStatEntry({
    required CourtSlot courtSlot,
    required String gameStatsId,
  }) async {
    if (localStatEntryJsonHistory.isEmpty) return;

    final lastStatEntryJson = localStatEntryJsonHistory.removeLast();
    await invokeGameStatEntryCancel(
      courtSlot: courtSlot,
      gameStatsId: gameStatsId,
      statEntry: GameStatEntry.fromJson(lastStatEntryJson),
    );

    await firestoreHelper.setData(
      path: FirestorePath.docGameStats(
        courtSlot.courtId,
        courtSlot.slotId,
        gameStatsId,
      ),
      data: {
        'statEntryHistory': FieldValue.arrayRemove([lastStatEntryJson])
      },
      merge: true,
    );
  }

  // ignore: long-method
  Future<void> invokeGameStatEntryCancel({
    required CourtSlot courtSlot,
    required String gameStatsId,
    required GameStatEntry statEntry,
  }) async {
    final player = statEntry.player;
    final isHomePlayer = statEntry.isHome;
    final statMeta = statEntry.statMeta;

    switch (statEntry.statType) {
      case GameStatEntryType.shotAttempt:
        return recordPlayerShotAttempt(
          gameStatsId: gameStatsId,
          courtSlot: courtSlot,
          playerWhoScored: player,
          isHomePlayer: isHomePlayer,
          playerWhoAssisted: KasadoUser.fromJson(
            statMeta!['playerWhoAssisted'],
          ),
          isThree: statMeta['isThree'],
          wasMade: statMeta['wasMade'],
          isCancel: true,
        );
      case GameStatEntryType.block:
        return recordPlayerBlock(
          playerWhoBlocked: player,
          gameStatsId: gameStatsId,
          courtSlot: courtSlot,
          isHomePlayer: isHomePlayer,
          isCancel: true,
        );
      case GameStatEntryType.steal:
        return recordPlayerSteal(
          playerWhoStealed: player,
          gameStatsId: gameStatsId,
          courtSlot: courtSlot,
          isHomePlayer: isHomePlayer,
          isCancel: true,
        );
      case GameStatEntryType.ftAttempt:
        return recordPlayerFT(
          shootingPlayer: player,
          gameStatsId: gameStatsId,
          courtSlot: courtSlot,
          isHomePlayer: isHomePlayer,
          wasMade: statMeta!['wasMade'],
          isCancel: true,
        );
      case GameStatEntryType.turnover:
        return recordPlayerTurnover(
          playerWhoTurnovered: player,
          gameStatsId: gameStatsId,
          courtSlot: courtSlot,
          isHomePlayer: isHomePlayer,
          isCancel: true,
        );
      case GameStatEntryType.rebound:
        return recordPlayerRebound(
          reboundingPlayer: player,
          gameStatsId: gameStatsId,
          courtSlot: courtSlot,
          isHomePlayer: isHomePlayer,
          isDefensive: statMeta!['isDefensive'],
          isCancel: true,
        );
    }
  }

  Future<void> addTeamPoints({
    required int pts,
    required bool isHome,
    required CourtSlot courtSlot,
    required String gameStatsId,
  }) async {
    final fieldPrefix = (isHome) ? 'homeTeamScore' : 'awayTeamScore';
    await firestoreHelper.setData(
      path: FirestorePath.docGameStats(
        courtSlot.courtId,
        courtSlot.slotId,
        gameStatsId,
      ),
      data: {fieldPrefix: FieldValue.increment(pts)},
      merge: true,
    );
  }

  Future<void> recordPlayerShotAttempt({
    required KasadoUser playerWhoScored,
    required KasadoUser? playerWhoAssisted,
    required bool isThree, // isTwo if otherwise
    required String gameStatsId,
    required CourtSlot courtSlot,
    required bool isHomePlayer,
    required bool wasMade,
    required bool isCancel,
  }) async {
    final fieldPrefix = (isHomePlayer) ? 'homeTeamStats' : 'awayTeamStats';

    await firestoreHelper.setData(
      path: FirestorePath.docGameStats(
        courtSlot.courtId,
        courtSlot.slotId,
        gameStatsId,
      ),
      data: {
        fieldPrefix: {
          playerWhoScored.id: (isThree)
              ? {
                  "threePA": FieldValue.increment((isCancel) ? -1 : 1),
                  if (wasMade) ...{
                    "threePM": FieldValue.increment((isCancel) ? -1 : 1)
                  }
                }
              : {
                  "twoPA": FieldValue.increment((isCancel) ? -1 : 1),
                  if (wasMade) ...{
                    "twoPM": FieldValue.increment((isCancel) ? -1 : 1)
                  }
                }
        }
      },
      merge: true,
    );

    if (playerWhoAssisted != null) {
      recordPlayerAssist(
        playerWhoAssisted: playerWhoAssisted,
        gameStatsId: gameStatsId,
        courtSlot: courtSlot,
        isHomePlayer: isHomePlayer,
        isCancel: isCancel,
      );
    }

    if (isCancel) return;
    await _pushToStatHistory(
      courtSlot: courtSlot,
      gameStatsId: gameStatsId,
      gameStatEntry: GameStatEntry(
        player: playerWhoScored,
        statType: GameStatEntryType.shotAttempt,
        isHome: isHomePlayer,
        statMeta: {
          'isThree': isThree,
          'wasMade': wasMade,
          'playerWhoAssisted': playerWhoAssisted?.toJson(),
        },
      ),
    );
  }

  Future<void> recordPlayerAssist({
    required KasadoUser playerWhoAssisted,
    required String gameStatsId,
    required CourtSlot courtSlot,
    required bool isHomePlayer,
    required bool isCancel,
  }) async {
    final fieldPrefix = (isHomePlayer) ? 'homeTeamStats' : 'awayTeamStats';
    await firestoreHelper.setData(
      path: FirestorePath.docGameStats(
        courtSlot.courtId,
        courtSlot.slotId,
        gameStatsId,
      ),
      data: {
        fieldPrefix: {
          playerWhoAssisted.id: {
            "ast": FieldValue.increment((isCancel) ? -1 : 1)
          }
        }
      },
      merge: true,
    );
  }

  Future<void> recordPlayerBlock({
    required KasadoUser playerWhoBlocked,
    required String gameStatsId,
    required CourtSlot courtSlot,
    required bool isHomePlayer,
    required bool isCancel,
  }) async {
    final fieldPrefix = (isHomePlayer) ? 'homeTeamStats' : 'awayTeamStats';
    await firestoreHelper.setData(
      path: FirestorePath.docGameStats(
        courtSlot.courtId,
        courtSlot.slotId,
        gameStatsId,
      ),
      data: {
        fieldPrefix: {
          playerWhoBlocked.id: {
            "blk": FieldValue.increment((isCancel) ? -1 : 1)
          }
        }
      },
      merge: true,
    );

    if (isCancel) return;
    await _pushToStatHistory(
      courtSlot: courtSlot,
      gameStatsId: gameStatsId,
      gameStatEntry: GameStatEntry(
        player: playerWhoBlocked,
        statType: GameStatEntryType.block,
        isHome: isHomePlayer,
      ),
    );
  }

  Future<void> recordPlayerSteal({
    required KasadoUser playerWhoStealed,
    required String gameStatsId,
    required CourtSlot courtSlot,
    required bool isHomePlayer,
    required bool isCancel,
  }) async {
    final fieldPrefix = (isHomePlayer) ? 'homeTeamStats' : 'awayTeamStats';
    await firestoreHelper.setData(
      path: FirestorePath.docGameStats(
        courtSlot.courtId,
        courtSlot.slotId,
        gameStatsId,
      ),
      data: {
        fieldPrefix: {
          playerWhoStealed.id: {
            "stl": FieldValue.increment((isCancel) ? -1 : 1)
          }
        }
      },
      merge: true,
    );

    if (isCancel) return;
    await _pushToStatHistory(
      courtSlot: courtSlot,
      gameStatsId: gameStatsId,
      gameStatEntry: GameStatEntry(
        player: playerWhoStealed,
        statType: GameStatEntryType.steal,
        isHome: isHomePlayer,
      ),
    );
  }

  Future<void> recordPlayerFT({
    required KasadoUser shootingPlayer,
    required String gameStatsId,
    required CourtSlot courtSlot,
    required bool isHomePlayer,
    required bool wasMade,
    required bool isCancel,
  }) async {
    final fieldPrefix = (isHomePlayer) ? 'homeTeamStats' : 'awayTeamStats';
    await firestoreHelper.setData(
      path: FirestorePath.docGameStats(
        courtSlot.courtId,
        courtSlot.slotId,
        gameStatsId,
      ),
      data: {
        fieldPrefix: {
          shootingPlayer.id: {
            "ftA": FieldValue.increment((isCancel) ? -1 : 1),
            if (wasMade) ...{"ftM": FieldValue.increment((isCancel) ? -1 : 1)}
          }
        }
      },
      merge: true,
    );

    if (isCancel) return;
    await _pushToStatHistory(
      courtSlot: courtSlot,
      gameStatsId: gameStatsId,
      gameStatEntry: GameStatEntry(
        player: shootingPlayer,
        statType: GameStatEntryType.ftAttempt,
        isHome: isHomePlayer,
        statMeta: {'wasMade': wasMade},
      ),
    );
  }

  Future<void> recordPlayerRebound({
    required KasadoUser reboundingPlayer,
    required String gameStatsId,
    required CourtSlot courtSlot,
    required bool isHomePlayer,
    required bool isDefensive,
    required bool isCancel,
  }) async {
    final fieldPrefix = (isHomePlayer) ? 'homeTeamStats' : 'awayTeamStats';
    await firestoreHelper.setData(
      path: FirestorePath.docGameStats(
        courtSlot.courtId,
        courtSlot.slotId,
        gameStatsId,
      ),
      data: {
        fieldPrefix: {
          reboundingPlayer.id: (isDefensive)
              ? {"dReb": FieldValue.increment((isCancel) ? -1 : 1)}
              : {"oReb": FieldValue.increment((isCancel) ? -1 : 1)},
        }
      },
      merge: true,
    );

    if (isCancel) return;
    await _pushToStatHistory(
      courtSlot: courtSlot,
      gameStatsId: gameStatsId,
      gameStatEntry: GameStatEntry(
        player: reboundingPlayer,
        statType: GameStatEntryType.rebound,
        isHome: isHomePlayer,
        statMeta: {'isDefensive': isDefensive},
      ),
    );
  }

  Future<void> recordPlayerTurnover({
    required KasadoUser playerWhoTurnovered,
    required String gameStatsId,
    required CourtSlot courtSlot,
    required bool isHomePlayer,
    required bool isCancel,
  }) async {
    final fieldPrefix = (isHomePlayer) ? 'homeTeamStats' : 'awayTeamStats';
    await firestoreHelper.setData(
      path: FirestorePath.docGameStats(
        courtSlot.courtId,
        courtSlot.slotId,
        gameStatsId,
      ),
      data: {
        fieldPrefix: {
          playerWhoTurnovered.id: {
            "turnover": FieldValue.increment((isCancel) ? -1 : 1)
          }
        }
      },
      merge: true,
    );

    if (isCancel) return;
    await _pushToStatHistory(
      courtSlot: courtSlot,
      gameStatsId: gameStatsId,
      gameStatEntry: GameStatEntry(
        player: playerWhoTurnovered,
        statType: GameStatEntryType.turnover,
        isHome: isHomePlayer,
      ),
    );
  }

  Future<void> cancelGame({
    required CourtSlot courtSlot,
    required GameStats gameStats,
  }) async {
    await firestoreHelper.deleteData(
      path: FirestorePath.docGameStats(
        courtSlot.courtId,
        courtSlot.slotId,
        gameStats.id,
      ),
    );

    // Reset localStatEntryHistory
    localStatEntryJsonHistory = [];
  }

  /// Finalize game stats and publish each player's individual stats to their corresponding userInfos
  Future<void> concludeGameStats({
    required CourtSlot courtSlot,
    required GameStats gameStats,
  }) async {
    // Set gameStats.isLive to false
    await firestoreHelper.setData(
      path: FirestorePath.docGameStats(
        courtSlot.courtId,
        courtSlot.slotId,
        gameStats.id,
      ),
      data: {'isLive': false},
      merge: true,
    );

    final updatedPlayerStats = _getFinalizedPlayerStats(
      gameStats,
      savedAt: DateTime.now(),
    );

    // Update each player's overviewStats based on the updated gameStats
    await updatePlayersOverviewStats(
      gameStats: gameStats,
      gamePlayerStats: updatedPlayerStats,
    );

    // Save each of the player's stats to their corresponding userInfos
    await firestoreHelper.setBatchData(
      baseColPath: FirestorePath.colUserInfos(),
      endPath: FirestorePath.docPartialUserStats(gameStats.id),
      dataFromId: (playerId) => updatedPlayerStats[playerId]!.toJson(),
      queryBuilder: (query) =>
          query.where('id', whereIn: updatedPlayerStats.keys.toList()),
    );

    // Reset localStatEntryHistory
    localStatEntryJsonHistory = [];
  }

  Map<String, Stats> _getFinalizedPlayerStats(
    GameStats gameStats, {
    DateTime? savedAt,
  }) {
    // For all players in homeTeamStats, set hasWonGame to isHomeWinner
    final Map<String, Stats> updatedHomeTeamStats = gameStats.homeTeamStats.map(
      (playerId, stats) => MapEntry(
        playerId,
        stats.copyWith(hasWonGame: gameStats.isHomeWinner),
      ),
    );

    // For all players in awayTeamStats, set hasWonGame to !isHomeWinner
    final Map<String, Stats> updatedAwayTeamStats = gameStats.awayTeamStats.map(
      (playerId, stats) => MapEntry(
        playerId,
        stats.copyWith(hasWonGame: !gameStats.isHomeWinner),
      ),
    );

    // Merge the stats of all game players to a single Map<playerId, Stats>
    return {...updatedHomeTeamStats, ...updatedAwayTeamStats}.map(
      (playerId, stats) => MapEntry(
        playerId,
        stats.copyWith(
          noStats: gameStats is GameStatsScoreOnly,
          savedAt: savedAt,
        ),
      ),
    );
  }

  Future<void> deleteGameStats({
    required CourtSlot courtSlot,
    required GameStats gameStats,
  }) async {
    final updatedPlayerStats = _getFinalizedPlayerStats(gameStats);

    await updatePlayersOverviewStats(
      gameStats: gameStats,
      gamePlayerStats: updatedPlayerStats,
      isCancel: true,
    );

    await firestoreHelper.batchDelete(
      baseColPath: FirestorePath.colUserInfos(),
      endPath: FirestorePath.docPartialUserStats(gameStats.id),
    );

    await firestoreHelper.deleteData(
      path: FirestorePath.docGameStats(
        courtSlot.courtId,
        courtSlot.slotId,
        gameStats.id,
      ),
    );
  }

  /// Batch update data to each of the userInfo.overviewStats
  // ignore: long-method
  Future<void> updatePlayersOverviewStats({
    required GameStats gameStats,
    required Map<String, Stats> gamePlayerStats,
    bool isCancel = false,
  }) async {
    final scoreOnly = gameStats is GameStatsScoreOnly;
    final gamePlayerIds = [
      ...gameStats.homeTeamStats.keys,
      ...gameStats.awayTeamStats.keys,
    ];
    final String currentSeasonId = (await appMeta)['seasonId'];

    await firestoreHelper.setBatchData(
      baseColPath: FirestorePath.colUserInfos(),
      endPath: FirestorePath.docPartialUserSeasonStats(currentSeasonId),
      dataFromId: (playerId) {
        final playerStats = gamePlayerStats[playerId]!;
        final mmrIncrement =
            playerStats.eff + (playerStats.hasWonGame! ? 10 : -10);
        final gamesPlayedField =
            scoreOnly ? 'gamesPlayedNoStats' : 'gamesPlayed';
        final scoreDifference =
            (gameStats.awayScore - gameStats.homeScore).abs();

        return {
          "mmr": FieldValue.increment(isCancel ? -mmrIncrement : mmrIncrement),
          "totalThreePA": FieldValue.increment(
            isCancel ? -playerStats.threePA : playerStats.threePA,
          ),
          "totalThreePM": FieldValue.increment(
            isCancel ? -playerStats.threePM : playerStats.threePM,
          ),
          "totalTwoPA": FieldValue.increment(
            isCancel ? -playerStats.twoPA : playerStats.twoPA,
          ),
          "totalTwoPM": FieldValue.increment(
            isCancel ? -playerStats.twoPM : playerStats.twoPM,
          ),
          "totalFta": FieldValue.increment(
            isCancel ? -playerStats.ftA : playerStats.ftA,
          ),
          "totalFtm": FieldValue.increment(
            isCancel ? -playerStats.ftM : playerStats.ftM,
          ),
          "totalOReb": FieldValue.increment(
            isCancel ? -playerStats.oReb : playerStats.oReb,
          ),
          "totalDReb": FieldValue.increment(
            isCancel ? -playerStats.dReb : playerStats.dReb,
          ),
          "totalAst": FieldValue.increment(
            isCancel ? -playerStats.ast : playerStats.ast,
          ),
          "totalStl": FieldValue.increment(
            isCancel ? -playerStats.stl : playerStats.stl,
          ),
          "totalBlk": FieldValue.increment(
            isCancel ? -playerStats.blk : playerStats.blk,
          ),
          "totalTO": FieldValue.increment(
            isCancel ? -playerStats.turnover : playerStats.turnover,
          ),
          "totalWins": FieldValue.increment(playerStats.hasWonGame!
              ? isCancel
                  ? -1
                  : 1
              : 0),
          "totalPlusMinus": FieldValue.increment(
            isCancel
                ? playerStats.hasWonGame!
                    ? -scoreDifference
                    : scoreDifference
                : playerStats.hasWonGame!
                    ? scoreDifference
                    : -scoreDifference,
          ),
          gamesPlayedField: FieldValue.increment(isCancel ? -1 : 1),
        };
      },
      merge: true,
      queryBuilder: (query) => query.where('id', whereIn: gamePlayerIds),
    );
  }

  Stream<List<OverviewStats>> getMmrLeadersStream() {
    return _getOverviewStats(
      queryBuilder: (query) => query.orderBy('mmr', descending: true),
      statToValidate: (stats) => stats.totalGamesPlayed,
    );
  }

  Stream<List<OverviewStats>> getEffRatingLeadersStream() {
    return _getOverviewStats(
      queryBuilder: (query) => query.orderBy('effRating', descending: true),
      statToValidate: (stats) => stats.totalGamesPlayed,
    );
  }

  Stream<List<OverviewStats>> getStandingLeadersStream() {
    return _getOverviewStats(
      queryBuilder: (query) => query
          .orderBy('winLossDifference', descending: true)
          .orderBy('winPercent', descending: true)
          .orderBy('totalGamesPlayed', descending: true),
      statToValidate: (stats) => stats.totalGamesPlayed,
    );
  }

  Stream<List<OverviewStats>> getPpgLeadersStream() {
    return _getOverviewStats(
      queryBuilder: (query) => query.orderBy(
        'avePointsPerGame',
        descending: true,
      ),
      statToValidate: (stats) => stats.avePointsPerGame,
    );
  }

  Stream<List<OverviewStats>> getApgLeadersStream() {
    return _getOverviewStats(
      queryBuilder: (query) => query.orderBy(
        'aveAssistsPerGame',
        descending: true,
      ),
      statToValidate: (stats) => stats.aveAssistsPerGame,
    );
  }

  Stream<List<OverviewStats>> getRpgLeadersStream() {
    return _getOverviewStats(
      queryBuilder: (query) => query.orderBy(
        'aveReboundsPerGame',
        descending: true,
      ),
      statToValidate: (stats) => stats.aveReboundsPerGame,
    );
  }

  Stream<List<OverviewStats>> getSpgLeadersStream() {
    return _getOverviewStats(
      queryBuilder: (query) => query.orderBy('aveStlPerGame', descending: true),
      statToValidate: (stats) => stats.aveStlPerGame,
    );
  }

  Stream<List<OverviewStats>> getBpgLeadersStream() {
    return _getOverviewStats(
      queryBuilder: (query) => query.orderBy(
        'aveBlocksPerGame',
        descending: true,
      ),
      statToValidate: (stats) => stats.aveBlocksPerGame,
    );
  }

  Stream<List<OverviewStats>> getFgPercentLeadersStream() {
    return _getOverviewStats(
      queryBuilder: (query) => query.orderBy('aveFgPercent', descending: true),
      statToValidate: (stats) => stats.aveFgPercent,
    );
  }

  Stream<List<OverviewStats>> get3ptPercentLeadersStream() {
    return _getOverviewStats(
      queryBuilder: (query) => query.orderBy(
        'aveThreePtPercent',
        descending: true,
      ),
      statToValidate: (stats) => stats.aveThreePtPercent,
    );
  }

  Stream<List<OverviewStats>> get3ptMadeLeadersStream() {
    return _getOverviewStats(
      queryBuilder: (query) => query.orderBy('totalThreePM', descending: true),
      statToValidate: (stats) => stats.totalThreePM,
    );
  }

  Stream<List<OverviewStats>> _getOverviewStats({
    required Query<Object?> Function(Query<Object?>) queryBuilder,
    required num Function(OverviewStats) statToValidate,
    int limit = 100,
  }) async* {
    final currentSeasonId = (await appMeta)["seasonId"];
    yield* firestoreHelper
        .collectionStream(
          path: FirestorePath.colGroupUserSeasonStats(),
          builder: (data, _) => OverviewStats.fromJson(data),
          isCollectionGroup: true,
          queryBuilder: (query) => queryBuilder(
            query.where('seasonId', isEqualTo: currentSeasonId),
          ).limit(limit),
        )
        .map(
          (overviewStats) => overviewStats.excludeWhere(
            (oStats) =>
                statToValidate(oStats) == 0 ||
                statToValidate(oStats).isNaN ||
                statToValidate(oStats).isInfinite,
          ),
        );
  }
}
