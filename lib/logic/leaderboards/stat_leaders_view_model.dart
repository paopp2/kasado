import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/constants/enums/stat_type.dart';
import 'package:kasado/logic/leaderboards/stat_leaders_state.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/logic/shared/view_model.dart';
import 'package:kasado/model/overview_stats/overview_stats.dart';

final statLeadersViewModel = Provider.autoDispose(
  (ref) => StatLeadersViewModel(
    ref: ref,
    utils: ref.watch(kasadoUtilsProvider),
  ),
);

class StatLeadersViewModel extends ViewModel {
  StatLeadersViewModel({
    required Ref ref,
    required this.utils,
  }) : super(ref);

  final KasadoUtils utils;

  /// Gets the rank number of a user. If having the same rank as the user
  /// preceding, rank number is not shown
  String getRankNumAsString({
    required StatType statType,
    required OverviewStats? precedingStats,
    required OverviewStats overviewStats,
  }) {
    final rankNum = ref.read(rankNumProvider(statType))[
        overviewStats.getStatValueAsString(statType)];
    final isSameRankWithPreceding = (precedingStats == null)
        ? false
        : rankNum ==
            ref.read(rankNumProvider(statType))[
                precedingStats.getStatValueAsString(statType)];

    return (isSameRankWithPreceding) ? '' : rankNum.toString();
  }
}
