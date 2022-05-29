import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/helpers/firestore_helper.dart';
import 'package:kasado/data/helpers/firestore_path.dart';
import 'package:kasado/data/repositories/court_slot_repository.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/game_stats/game_stats.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';
import 'package:kasado/model/stats/stats.dart';
import 'package:time/time.dart';

final statRepositoryProvider = Provider.autoDispose(
  (ref) => StatRepository(
    firestoreHelper: FirestoreHelper.instance,
    courtSlotRepo: ref.watch(courtSlotRepositoryProvider),
  ),
);

class StatRepository {
  StatRepository({
    required this.firestoreHelper,
    required this.courtSlotRepo,
  });

  final FirestoreHelper firestoreHelper;
  final CourtSlotRepository courtSlotRepo;

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

  Future<void> addMinusGameClock({
    required CourtSlot courtSlot,
    required GameStats gameStats,
    required bool isAdd,
  }) async {
    final remainingMins = gameStats.remainingOnPaused!.inMinutes;
    final newRemaningTime =
        (isAdd ? (remainingMins + 1) : (remainingMins - 1)).minutes;
    final newEndsAt = DateTime.now().add(newRemaningTime);
    await firestoreHelper.setData(
      path: FirestorePath.docGameStats(
        courtSlot.courtId,
        courtSlot.slotId,
        gameStats.id,
      ),
      data: {
        'endsAt': newEndsAt.toIso8601String(),
        'remainingMsOnPaused': newRemaningTime.inMilliseconds,
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

    final gamePlayerIds = [
      ...gameStats.homeTeamStats.keys,
      ...gameStats.awayTeamStats.keys,
    ];
    // assert(gamePlayerIds.length == 10); // Game players can only be 10

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
    final Map<String, Stats> updatedGameStats = {
      ...updatedHomeTeamStats,
      ...updatedAwayTeamStats,
    };

    // Update each player's overviewStats based on the updated gameStats
    await updatePlayersOverviewStats(
      gamePlayerIds: gamePlayerIds,
      gameStats: updatedGameStats,
    );

    // Increase gamesPlayed count for players at this game
    await courtSlotRepo.incGamesPlayedForPlayers(
      courtSlot: courtSlot,
      gamePlayers: updatedGameStats.values.map((s) => s.player).toList(),
    );

    // Save each of the player's stats to their corresponding userInfos
    await firestoreHelper.setBatchData(
      baseColPath: FirestorePath.colUserInfos(),
      endPath: FirestorePath.docPartialUserStats(gameStats.id),
      dataFromId: (playerId) => updatedGameStats[playerId]!.toJson(),
      queryBuilder: (query) =>
          query.where('id', whereIn: updatedGameStats.keys.toList()),
    );
  }

  /// Batch update data to each of the userInfo.overviewStats
  Future<void> updatePlayersOverviewStats({
    required List<String> gamePlayerIds,
    required Map<String, Stats> gameStats,
  }) async {
    await firestoreHelper.setBatchDataForDocInList(
      docIdList: gamePlayerIds,
      baseColPath: FirestorePath.colUserInfos(),
      dataFromId: (playerId) {
        final playerStats = gameStats[playerId]!;

        return {
          "overviewStats": {
            "totalThreePA": FieldValue.increment(playerStats.threePA),
            "totalThreePM": FieldValue.increment(playerStats.threePM),
            "totalTwoPA": FieldValue.increment(playerStats.twoPA),
            "totalTwoPM": FieldValue.increment(playerStats.twoPM),
            "totalFta": FieldValue.increment(playerStats.ftA),
            "totalFtm": FieldValue.increment(playerStats.ftM),
            "totalOReb": FieldValue.increment(playerStats.oReb),
            "totalDReb": FieldValue.increment(playerStats.dReb),
            "totalAst": FieldValue.increment(playerStats.ast),
            "totalStl": FieldValue.increment(playerStats.stl),
            "totalBlk": FieldValue.increment(playerStats.blk),
            "totalTO": FieldValue.increment(playerStats.turnover),
            "totalWins": FieldValue.increment(playerStats.hasWonGame! ? 1 : 0),
            "gamesPlayed": FieldValue.increment(1),
          }
        };
      },
      merge: true,
    );
  }

  Stream<List<KasadoUserInfo>> getEffRatingLeadersStream() {
    return firestoreHelper
        .collectionStream(
          path: FirestorePath.colUserInfos(),
          builder: (data, _) => KasadoUserInfo.fromJson(data),
          queryBuilder: (query) => query
              .orderBy('overviewStats.effRating', descending: true)
              .limit(100),
        )
        .map((userInfoList) => userInfoList
          ..removeWhere((user) => user.overviewStats.gamesPlayed == 0));
  }

  Stream<List<KasadoUserInfo>> getStandingLeadersStream() {
    return firestoreHelper
        .collectionStream(
          path: FirestorePath.colUserInfos(),
          builder: (data, _) => KasadoUserInfo.fromJson(data),
          queryBuilder: (query) => query
              .orderBy('overviewStats.winLossDifference', descending: true)
              .orderBy('overviewStats.winPercent', descending: true)
              .orderBy('overviewStats.gamesPlayed', descending: true)
              .limit(100),
        )
        .map((userInfoList) => userInfoList
          ..removeWhere((user) => user.overviewStats.gamesPlayed == 0));
  }

  Stream<List<KasadoUserInfo>> getPpgLeadersStream() {
    return firestoreHelper
        .collectionStream(
          path: FirestorePath.colUserInfos(),
          builder: (data, _) => KasadoUserInfo.fromJson(data),
          queryBuilder: (query) => query
              .orderBy('overviewStats.avePointsPerGame', descending: true)
              .limit(100),
        )
        .map((userInfoList) => userInfoList
          ..removeWhere((user) =>
              user.overviewStats.avePointsPerGame.isNaN ||
              user.overviewStats.avePointsPerGame == 0));
  }

  Stream<List<KasadoUserInfo>> getApgLeadersStream() {
    return firestoreHelper
        .collectionStream(
          path: FirestorePath.colUserInfos(),
          builder: (data, _) => KasadoUserInfo.fromJson(data),
          queryBuilder: (query) => query
              .orderBy('overviewStats.aveAssistsPerGame', descending: true)
              .limit(100),
        )
        .map((userInfoList) => userInfoList
          ..removeWhere((user) =>
              user.overviewStats.aveAssistsPerGame.isNaN ||
              user.overviewStats.aveAssistsPerGame == 0));
  }

  Stream<List<KasadoUserInfo>> getRpgLeadersStream() {
    return firestoreHelper
        .collectionStream(
          path: FirestorePath.colUserInfos(),
          builder: (data, _) => KasadoUserInfo.fromJson(data),
          queryBuilder: (query) => query
              .orderBy('overviewStats.aveReboundsPerGame', descending: true)
              .limit(100),
        )
        .map((userInfoList) => userInfoList
          ..removeWhere((user) =>
              user.overviewStats.aveReboundsPerGame.isNaN ||
              user.overviewStats.aveReboundsPerGame == 0));
  }

  Stream<List<KasadoUserInfo>> getSpgLeadersStream() {
    return firestoreHelper
        .collectionStream(
          path: FirestorePath.colUserInfos(),
          builder: (data, _) => KasadoUserInfo.fromJson(data),
          queryBuilder: (query) => query
              .orderBy('overviewStats.aveStlPerGame', descending: true)
              .limit(100),
        )
        .map((userInfoList) => userInfoList
          ..removeWhere((user) =>
              user.overviewStats.aveStlPerGame.isNaN ||
              user.overviewStats.aveStlPerGame == 0));
  }

  Stream<List<KasadoUserInfo>> getBpgLeadersStream() {
    return firestoreHelper
        .collectionStream(
          path: FirestorePath.colUserInfos(),
          builder: (data, _) => KasadoUserInfo.fromJson(data),
          queryBuilder: (query) => query
              .orderBy('overviewStats.aveBlocksPerGame', descending: true)
              .limit(100),
        )
        .map((userInfoList) => userInfoList
          ..removeWhere((user) =>
              user.overviewStats.aveBlocksPerGame.isNaN ||
              user.overviewStats.aveBlocksPerGame == 0));
  }

  Stream<List<KasadoUserInfo>> getFgPercentLeadersStream() {
    return firestoreHelper
        .collectionStream(
          path: FirestorePath.colUserInfos(),
          builder: (data, _) => KasadoUserInfo.fromJson(data),
          queryBuilder: (query) => query
              .orderBy('overviewStats.aveFgPercent', descending: true)
              .limit(100),
        )
        .map((userInfoList) => userInfoList
          ..removeWhere((user) =>
              user.overviewStats.aveFgPercent.isNaN ||
              user.overviewStats.aveFgPercent == 0));
  }

  Stream<List<KasadoUserInfo>> get3ptPercentLeadersStream() {
    return firestoreHelper
        .collectionStream(
          path: FirestorePath.colUserInfos(),
          builder: (data, _) => KasadoUserInfo.fromJson(data),
          queryBuilder: (query) => query
              .orderBy('overviewStats.aveThreePtPercent', descending: true)
              .limit(100),
        )
        .map((userInfoList) => userInfoList
          ..removeWhere((user) =>
              user.overviewStats.aveThreePtPercent.isNaN ||
              user.overviewStats.aveThreePtPercent == 0));
  }

  Stream<List<KasadoUserInfo>> get3ptMadeLeadersStream() {
    return firestoreHelper
        .collectionStream(
          path: FirestorePath.colUserInfos(),
          builder: (data, _) => KasadoUserInfo.fromJson(data),
          queryBuilder: (query) => query
              .orderBy('overviewStats.totalThreePM', descending: true)
              .limit(100),
        )
        .map((userInfoList) => userInfoList
          ..removeWhere((user) => user.overviewStats.totalThreePM == 0));
  }
}
