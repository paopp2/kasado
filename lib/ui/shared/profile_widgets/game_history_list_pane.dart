import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/profile/user_profile_state.dart';
import 'package:kasado/logic/profile/user_profile_view_model.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/ui/shared/loading_widget.dart';
import 'package:kasado/ui/shared/profile_widgets/user_game_box_score_dialog.dart';
import 'package:kasado/ui/shared/stagger_list_tile_animation.dart';

class GameHistoryListPane extends HookConsumerWidget {
  const GameHistoryListPane({
    Key? key,
    required this.model,
    required this.userId,
    required this.constraints,
  }) : super(key: key);

  final UserProfileViewModel model;
  final BoxConstraints constraints;
  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userGameStatsStream = ref.watch(userStatsStreamProvider(userId));
    final utils = ref.watch(kasadoUtilsProvider);

    useEffect(() {
      ref.read(mixpanel)!.track("Viewed Game History");

      return;
    }, []);

    return userGameStatsStream.when(
      error: (e, _) => Text(e.toString()),
      loading: () => const LoadingWidget(),
      data: (userStats) {
        return (userStats.isEmpty)
            ? const Center(child: Text("No games played yet"))
            : AnimationLimiter(
                child: ListView.builder(
                  itemCount: userStats.length,
                  itemBuilder: (context, i) {
                    final userGameStats = userStats[i];
                    final courtSlot = userGameStats.courtSlot;

                    return StaggerListTileAnimation(
                      index: i,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          tileColor: userGameStats.hasWonGame!
                              ? Colors.green.shade100
                              : Colors.red.shade100,
                          title: Text(courtSlot.courtName),
                          subtitle: Text(utils.getTimeRangeFormat(
                            courtSlot.timeRange,
                            showDate: true,
                          )),
                          trailing: SizedBox(
                            width: constraints.maxWidth * 0.25,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: userGameStats.noStats
                                  ? const [Spacer(), Text('NO STATS')]
                                  : model
                                      .getSortedStatsAsMapEntries(userGameStats)
                                      .sublist(0, 3)
                                      .map((statEntry) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            statEntry.value.toString(),
                                            style:
                                                const TextStyle(fontSize: 15),
                                          ),
                                          Text(
                                            statEntry.key,
                                            style:
                                                const TextStyle(fontSize: 10),
                                          )
                                        ],
                                      );
                                    }).toList(),
                            ),
                          ),
                          onTap: () => showDialog(
                            context: context,
                            builder: (_) => UserGameBoxScoreDialog(
                              constraints: constraints,
                              userGameStats: userGameStats,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
      },
    );
  }
}
