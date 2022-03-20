import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/helpers/firestore_helper.dart';
import 'package:kasado/data/helpers/firestore_path.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/game_stats/game_stats.dart';

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

  Stream<List<GameStats>> getSlotGameStatsStream(
    String courtId,
    String slotId,
  ) {
    return firestoreHelper.collectionStream(
      path: FirestorePath.colGameStats(courtId, slotId),
      builder: (data, _) => GameStats.fromJson(data),
    );
  }
}
