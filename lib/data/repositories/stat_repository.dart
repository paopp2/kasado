import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/helpers/firestore_helper.dart';
import 'package:kasado/data/helpers/firestore_path.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/game_stats/game_stats.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:kasado/model/stats/stats.dart';

final statRepositoryProvider = Provider.autoDispose(
  (ref) => StatRepository(
    firestoreHelper: FirestoreHelper.instance,
  ),
);

class StatRepository {
  StatRepository({
    required this.firestoreHelper,
  });

  final FirestoreHelper firestoreHelper;

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

  // TODO: Optimize and clean code IF and ONLY IF this clicks with users
  Future<void> incMvpCount(String userId) async {
    await firestoreHelper.setData(
      path: FirestorePath.docUserInfo(userId),
      data: {
        'overviewStats': {'mvpVoteCount': FieldValue.increment(1)}
      },
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
                  "threePA": FieldValue.increment(1),
                  if (wasMade) ...{"threePM": FieldValue.increment(1)}
                }
              : {
                  "twoPA": FieldValue.increment(1),
                  if (wasMade) ...{"twoPM": FieldValue.increment(1)}
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
      );
    }
  }

  Future<void> recordPlayerAssist({
    required KasadoUser playerWhoAssisted,
    required String gameStatsId,
    required CourtSlot courtSlot,
    required bool isHomePlayer,
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
          playerWhoAssisted.id: {"ast": FieldValue.increment(1)}
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
          playerWhoBlocked.id: {"blk": FieldValue.increment(1)}
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
          playerWhoStealed.id: {"stl": FieldValue.increment(1)}
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
            "ftA": FieldValue.increment(1),
            if (wasMade) ...{"ftM": FieldValue.increment(1)}
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
              ? {"dReb": FieldValue.increment(1)}
              : {"oReb": FieldValue.increment(1)},
        }
      },
      merge: true,
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
    // Batch setData to each of the userInfo.overviewStats
    await firestoreHelper.setBatchDataForDocInList(
      docIdList: gamePlayerIds,
      baseColPath: FirestorePath.colUserInfos(),
      dataFromId: (playerId) {
        final newStats = updatedGameStats[playerId]!;
        return {
          "overviewStats": {
            "totalThreePA": FieldValue.increment(newStats.threePA),
            "totalThreePM": FieldValue.increment(newStats.threePM),
            "totalTwoPA": FieldValue.increment(newStats.twoPA),
            "totalTwoPM": FieldValue.increment(newStats.twoPM),
            "totalFta": FieldValue.increment(newStats.ftA),
            "totalFtm": FieldValue.increment(newStats.ftM),
            "totalOReb": FieldValue.increment(newStats.oReb),
            "totalDReb": FieldValue.increment(newStats.dReb),
            "totalAst": FieldValue.increment(newStats.ast),
            "totalStl": FieldValue.increment(newStats.stl),
            "totalBlk": FieldValue.increment(newStats.blk),
            "totalWins": FieldValue.increment(newStats.hasWonGame! ? 1 : 0),
            "gamesPlayed": FieldValue.increment(1),
          }
        };
      },
      merge: true,
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
}
