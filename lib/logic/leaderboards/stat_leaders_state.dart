import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/constants/enums/stat_type.dart';
import 'package:kasado/data/repositories/stat_repository.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';

final statLeadersStreamProvider = StreamProvider.autoDispose
    .family<List<KasadoUserInfo>, StatType>((ref, statType) {
  final statRepo = ref.watch(statRepositoryProvider);

  final Stream<List<KasadoUserInfo>> statLeadersStream;
  switch (statType) {
    case StatType.effRating:
      statLeadersStream = statRepo.getEffRatingLeadersStream();
      break;
    case StatType.standing:
      statLeadersStream = statRepo.getStandingLeadersStream();
      break;
    case StatType.ptsPerGame:
      statLeadersStream = statRepo.getPpgLeadersStream();
      break;
    case StatType.astPerGame:
      statLeadersStream = statRepo.getApgLeadersStream();
      break;
    case StatType.rebPerGame:
      statLeadersStream = statRepo.getRpgLeadersStream();
      break;
    case StatType.blkPerGame:
      statLeadersStream = statRepo.getBpgLeadersStream();
      break;
    case StatType.stlPerGame:
      statLeadersStream = statRepo.getSpgLeadersStream();
      break;
    case StatType.fgPercent:
      statLeadersStream = statRepo.getFgPercentLeadersStream();
      break;
    case StatType.threePtPercent:
      statLeadersStream = statRepo.get3ptPercentLeadersStream();
      break;
    case StatType.threePtMade:
      statLeadersStream = statRepo.get3ptMadeLeadersStream();
      break;
  }

  // Exclude users that opted out of being part of stat leader rankings
  return statLeadersStream.map((userInfoList) => [...userInfoList]
    ..removeWhere((uInfo) => uInfo.overviewStats.isHiddenFromRankings));
});

final rankNumProvider = Provider.autoDispose.family<Map<String, int>, StatType>(
  (ref, statType) {
    final utils = ref.watch(kasadoUtilsProvider);

    final statLeadersList =
        ref.watch(statLeadersStreamProvider(statType)).value ?? [];
    final statLeadersValueSet = statLeadersList
        .map((uInfo) {
          // This is the exact same code block at StatLeadersViewModel.getStatValue.
          // This is duplicated here because referencing the statLeadersViewModel
          // provider here results to a circular dependency error given that this
          // provider (rankNumProvider) is also referenced in statLeadersViewModel
          // TODO: If possible, refactor to avoid this boilerplate
          final stats = uInfo.overviewStats;
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
        })
        .toSet() // Removes duplicates
        .toList() // Allows indexing
        .asMap(); // Sets index as key to corresponding value

    return statLeadersValueSet
        .map((rankIndex, statVal) => MapEntry(statVal, rankIndex + 1));
  },
);
