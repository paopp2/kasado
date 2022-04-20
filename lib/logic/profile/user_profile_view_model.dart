import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/shared/view_model.dart';
import 'package:kasado/model/stats/stats.dart';

final userProfileViewModel = Provider.autoDispose(
  (ref) => UserProfileViewModel(
    read: ref.read,
  ),
);

class UserProfileViewModel extends ViewModel {
  UserProfileViewModel({
    required Reader read,
  }) : super(read);

  @override
  void initState([Map<String, Object?>? params]) {
    FirebaseAnalytics.instance.logEvent(
      name: 'user_profile_view',
      parameters: {
        'user_id': read(currentUserProvider)?.toJson().toString(),
        'viewed_user_id': params!['viewed_user_id'],
      },
    );
  }

  List<MapEntry> getSortedStatsAsMapEntries(Stats stats) {
    final statsMap = {
      'PTS': stats.points,
      'AST': stats.ast,
      'REB': stats.rebounds,
      'STL': stats.stl,
      'BLK': stats.blk,
    };
    final statsMapEntries = statsMap.entries.toList();
    return statsMapEntries..sort((a, b) => (b.value.compareTo(a.value)));
  }
}
