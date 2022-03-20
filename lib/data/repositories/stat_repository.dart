import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/helpers/firestore_helper.dart';
import 'package:kasado/data/helpers/firestore_path.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/game_stats/game_stats.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';

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

  Future<void> recordPlayerShotAttempt({
    required KasadoUser playerWhoScored,
    required KasadoUser? playerWhoAssisted,
    required KasadoUser? playerWhoBlocked,
    required bool isThree, // isTwo if otherwise
    required GameStats baseGameStats,
    required CourtSlot courtSlot,
    required bool isHomePlayer,
    required bool wasMade,
  }) async {
    final fieldPrefix = (isHomePlayer) ? 'homeTeamStats' : 'awayTeamStats';

    final playerBaseStats = (isHomePlayer)
        ? baseGameStats.homeTeamStats[playerWhoScored.id]!
        : baseGameStats.awayTeamStats[playerWhoScored.id]!;

    await firestoreHelper.setData(
      path: FirestorePath.docGameStats(
        courtSlot.courtId,
        courtSlot.slotId,
        baseGameStats.id,
      ),
      data: {
        fieldPrefix: {
          playerWhoScored.id: (isThree)
              ? {
                  "threePA": playerBaseStats.threePA + 1,
                  if (wasMade) ...{"threePM": playerBaseStats.threePM + 1}
                }
              : {
                  "twoPA": playerBaseStats.twoPA + 1,
                  if (wasMade) ...{"twoPM": playerBaseStats.twoPM + 1}
                }
        }
      },
      merge: true,
    );

    if (playerWhoAssisted != null) {
      recordPlayerAssist(
        playerWhoAssisted: playerWhoAssisted,
        baseGameStats: baseGameStats,
        courtSlot: courtSlot,
        isHomePlayer: isHomePlayer,
      );
    }

    if (playerWhoBlocked != null) {
      recordPlayerBlock(
        playerWhoBlocked: playerWhoBlocked,
        baseGameStats: baseGameStats,
        courtSlot: courtSlot,
        isHomePlayer: !isHomePlayer, // Blocker can only be from the other team
      );
    }
  }

  Future<void> recordPlayerAssist({
    required KasadoUser playerWhoAssisted,
    required GameStats baseGameStats,
    required CourtSlot courtSlot,
    required bool isHomePlayer,
  }) async {
    final fieldPrefix = (isHomePlayer) ? 'homeTeamStats' : 'awayTeamStats';

    final playerBaseStats = (isHomePlayer)
        ? baseGameStats.homeTeamStats[playerWhoAssisted.id]!
        : baseGameStats.awayTeamStats[playerWhoAssisted.id]!;

    await firestoreHelper.setData(
      path: FirestorePath.docGameStats(
        courtSlot.courtId,
        courtSlot.slotId,
        baseGameStats.id,
      ),
      data: {
        fieldPrefix: {
          playerWhoAssisted.id: {"ast": playerBaseStats.ast + 1}
        }
      },
      merge: true,
    );
  }

  Future<void> recordPlayerBlock({
    required KasadoUser playerWhoBlocked,
    required GameStats baseGameStats,
    required CourtSlot courtSlot,
    required bool isHomePlayer,
  }) async {
    final fieldPrefix = (isHomePlayer) ? 'homeTeamStats' : 'awayTeamStats';

    final playerBaseStats = (isHomePlayer)
        ? baseGameStats.homeTeamStats[playerWhoBlocked.id]!
        : baseGameStats.awayTeamStats[playerWhoBlocked.id]!;

    await firestoreHelper.setData(
      path: FirestorePath.docGameStats(
        courtSlot.courtId,
        courtSlot.slotId,
        baseGameStats.id,
      ),
      data: {
        fieldPrefix: {
          playerWhoBlocked.id: {"blk": playerBaseStats.blk + 1}
        }
      },
      merge: true,
    );
  }

  Future<void> recordPlayerSteal({
    required KasadoUser playerWhoStealed,
    required GameStats baseGameStats,
    required CourtSlot courtSlot,
    required bool isHomePlayer,
  }) async {
    final fieldPrefix = (isHomePlayer) ? 'homeTeamStats' : 'awayTeamStats';

    final playerBaseStats = (isHomePlayer)
        ? baseGameStats.homeTeamStats[playerWhoStealed.id]!
        : baseGameStats.awayTeamStats[playerWhoStealed.id]!;

    await firestoreHelper.setData(
      path: FirestorePath.docGameStats(
        courtSlot.courtId,
        courtSlot.slotId,
        baseGameStats.id,
      ),
      data: {
        fieldPrefix: {
          playerWhoStealed.id: {"stl": playerBaseStats.stl + 1}
        }
      },
      merge: true,
    );
  }

  Future<void> recordPlayerFT({
    required KasadoUser shootingPlayer,
    required GameStats baseGameStats,
    required CourtSlot courtSlot,
    required bool isHomePlayer,
    required bool wasMade,
  }) async {
    final fieldPrefix = (isHomePlayer) ? 'homeTeamStats' : 'awayTeamStats';

    final playerBaseStats = (isHomePlayer)
        ? baseGameStats.homeTeamStats[shootingPlayer.id]!
        : baseGameStats.awayTeamStats[shootingPlayer.id]!;

    await firestoreHelper.setData(
      path: FirestorePath.docGameStats(
        courtSlot.courtId,
        courtSlot.slotId,
        baseGameStats.id,
      ),
      data: {
        fieldPrefix: {
          shootingPlayer.id: {
            "ftA": playerBaseStats.ftA + 1,
            if (wasMade) ...{"ftM": playerBaseStats.ftM + 1}
          }
        }
      },
      merge: true,
    );
  }

  Future<void> recordPlayerRebound({
    required KasadoUser reboundingPlayer,
    required GameStats baseGameStats,
    required CourtSlot courtSlot,
    required bool isHomePlayer,
    required bool isDefensive,
  }) async {
    final fieldPrefix = (isHomePlayer) ? 'homeTeamStats' : 'awayTeamStats';

    final playerBaseStats = (isHomePlayer)
        ? baseGameStats.homeTeamStats[reboundingPlayer.id]!
        : baseGameStats.awayTeamStats[reboundingPlayer.id]!;

    await firestoreHelper.setData(
      path: FirestorePath.docGameStats(
        courtSlot.courtId,
        courtSlot.slotId,
        baseGameStats.id,
      ),
      data: {
        fieldPrefix: {
          reboundingPlayer.id: (isDefensive)
              ? {"dReb": playerBaseStats.dReb + 1}
              : {"oReb": playerBaseStats.oReb + 1},
        }
      },
      merge: true,
    );
  }
}
