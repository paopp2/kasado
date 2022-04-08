import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/constants/enums.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/logic/shared/view_model.dart';
import 'package:kasado/model/overview_stats/overview_stats.dart';

final leaderboardsViewModel = Provider.autoDispose(
  (ref) => LeaderboardsViewModel(
    read: ref.read,
    utils: ref.watch(kasadoUtilsProvider),
  ),
);

class LeaderboardsViewModel extends ViewModel {
  LeaderboardsViewModel({
    required Reader read,
    required this.utils,
  }) : super(read);

  final KasadoUtils utils;

  String getStatValue({
    required OverviewStats stats,
    required StatType statType,
  }) {
    final double statValue;
    switch (statType) {
      case StatType.winRate:
        statValue = stats.winPercent;
        break;
      case StatType.ptsPerGame:
        statValue = stats.avePointsPerGame;
        break;
      case StatType.astPerGame:
        statValue = stats.aveAssistsPerGame;
        break;
      case StatType.rebPerGame:
        statValue = stats.aveReboundsPerGame;
        break;
      case StatType.blkPerGame:
        statValue = stats.aveBlocksPerGame;
        break;
      case StatType.stlPerGame:
        statValue = stats.aveStlPerGame;
        break;
      case StatType.fgPercent:
        statValue = stats.aveFgPercent;
        break;
      case StatType.threePtPercent:
        statValue = stats.aveThreePtPercent;
        break;
      case StatType.threePtMade:
        statValue = stats.totalThreePM.toDouble();
        break;
    }

    return (statType == StatType.threePtMade)
        ? statValue.toStringAsFixed(0) // No decimals
        : utils.getDoubleFormat(statValue);
  }
}
