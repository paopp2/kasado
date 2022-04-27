import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/constants/enums/stat_type.dart';
import 'package:kasado/logic/leaderboards/stat_leaders_state.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/logic/shared/view_model.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';
import 'package:kasado/model/overview_stats/overview_stats.dart';

final statLeadersViewModel = Provider.autoDispose(
  (ref) => StatLeadersViewModel(
    read: ref.read,
    utils: ref.watch(kasadoUtilsProvider),
  ),
);

class StatLeadersViewModel extends ViewModel {
  StatLeadersViewModel({
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
      case StatType.effRating:
        statValue = stats.effRating;
        break;
      case StatType.standing:
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

    return (statType == StatType.standing)
        ? '${stats.totalWins} - ${stats.totalLosses}'
        : (statType == StatType.threePtMade)
            ? statValue.toStringAsFixed(0) // No decimals
            : utils.getDoubleFormat(statValue);
  }

  /// Gets the rank number of a user. If having the same rank as the user
  /// preceding, rank number is not shown again
  String getRankNumAsString({
    required StatType statType,
    required KasadoUserInfo? precedingUserInfo,
    required KasadoUserInfo userInfo,
  }) {
    final rankNum = read(rankNumProvider(statType))[getStatValue(
      stats: userInfo.overviewStats,
      statType: statType,
    )];
    final isSameRankWithPreceding = (precedingUserInfo == null)
        ? false
        : rankNum ==
            read(rankNumProvider(statType))[getStatValue(
              stats: precedingUserInfo.overviewStats,
              statType: statType,
            )];

    return (isSameRankWithPreceding) ? '' : rankNum.toString();
  }
}
