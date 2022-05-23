import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/constants/enums/stat_type.dart';
import 'package:kasado/logic/leaderboards/stat_leaders_state.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/logic/shared/view_model.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';

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

  /// Gets the rank number of a user. If having the same rank as the user
  /// preceding, rank number is not shown
  String getRankNumAsString({
    required StatType statType,
    required KasadoUserInfo? precedingUserInfo,
    required KasadoUserInfo userInfo,
  }) {
    final precedingStats = precedingUserInfo?.overviewStats;
    final stats = userInfo.overviewStats;
    final rankNum =
        read(rankNumProvider(statType))[stats.getStatValueAsString(statType)];
    final isSameRankWithPreceding = (precedingStats == null)
        ? false
        : rankNum ==
            read(rankNumProvider(statType))[
                precedingStats.getStatValueAsString(statType)];

    return (isSameRankWithPreceding) ? '' : rankNum.toString();
  }
}
