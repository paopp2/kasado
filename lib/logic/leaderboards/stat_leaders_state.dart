import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/constants/enums/stat_type.dart';
import 'package:kasado/constants/extensions/iterable_extensions.dart';
import 'package:kasado/data/repositories/stat_repository.dart';
import 'package:kasado/model/overview_stats/overview_stats.dart';

final statLeadersStreamProvider = StreamProvider.autoDispose
    .family<List<OverviewStats>, StatType>((ref, statType) {
  final statRepo = ref.watch(statRepositoryProvider);

  final Stream<List<OverviewStats>> statLeadersStream;
  switch (statType) {
    case StatType.mmr:
      statLeadersStream = statRepo.getMmrLeadersStream();
      break;
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
  return statLeadersStream.map((overviewStats) =>
      [...overviewStats].excludeWhere((oStats) => oStats.isHiddenFromRankings));
});

final rankNumProvider = Provider.autoDispose.family<Map<String, int>, StatType>(
  (ref, statType) {
    final statLeadersList =
        ref.watch(statLeadersStreamProvider(statType)).value ?? [];
    final statLeadersValueSet = statLeadersList
        .map((oStats) => oStats.getStatValueAsString(statType))
        .toSet() // Removes duplicates
        .toList() // Allows indexing
        .asMap(); // Sets index as key to corresponding value

    return statLeadersValueSet
        .map((rankIndex, statVal) => MapEntry(statVal, rankIndex + 1));
  },
);
