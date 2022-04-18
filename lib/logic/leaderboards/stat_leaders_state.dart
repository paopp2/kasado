import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/constants/enums.dart';
import 'package:kasado/data/repositories/stat_repository.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';

final statLeadersStreamProvider = StreamProvider.autoDispose
    .family<List<KasadoUserInfo>, StatType>((ref, statType) {
  final statRepo = ref.watch(statRepositoryProvider);
  switch (statType) {
    case StatType.standing:
      return statRepo.getStandingLeadersStream();
    case StatType.ptsPerGame:
      return statRepo.getPpgLeadersStream();
    case StatType.astPerGame:
      return statRepo.getApgLeadersStream();
    case StatType.rebPerGame:
      return statRepo.getRpgLeadersStream();
    case StatType.blkPerGame:
      return statRepo.getBpgLeadersStream();
    case StatType.stlPerGame:
      return statRepo.getSpgLeadersStream();
    case StatType.fgPercent:
      return statRepo.getFgPercentLeadersStream();
    case StatType.threePtPercent:
      return statRepo.get3ptPercentLeadersStream();
    case StatType.threePtMade:
      return statRepo.get3ptMadeLeadersStream();
  }
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
