import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/profile/user_profile_state.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/ui/shared/loading_widget.dart';
import 'package:kasado/ui/shared/profile_widgets/player_stat_tile.dart';

class CareerStatsListPane extends HookConsumerWidget {
  const CareerStatsListPane({
    Key? key,
    required this.constraints,
    required this.userId,
  }) : super(key: key);

  final BoxConstraints constraints;
  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userOverviewStatsStream =
        ref.watch(userOverviewStatsStreamProvider(userId));
    final utils = ref.watch(kasadoUtilsProvider);

    useEffect(() {
      ref.read(mixpanel)!.track("Viewed Career Stats");

      return;
    }, []);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 8,
      ),
      child: userOverviewStatsStream.when(
        error: (e, _) => Text(e.toString()),
        loading: () => const LoadingWidget(),
        data: (userStats) => (userStats == null)
            ? const Center(child: Text("No stats availabe"))
            : AnimationLimiter(
                child: ListView(
                  children: [
                    PlayerStatTile(
                      statDescription: "Plus-Minus",
                      statValue: userStats.avePlusMinus > 0
                          ? "+${utils.getDoubleFormat(userStats.avePlusMinus)}"
                          : utils.getDoubleFormat(userStats.avePlusMinus),
                      index: 0,
                      trailingTextColor: userStats.avePlusMinus < 0
                          ? Colors.red
                          : Colors.green,
                    ),
                    PlayerStatTile(
                      statDescription: "Standing",
                      statValue:
                          "${userStats.totalWins} - ${userStats.totalLosses}",
                      index: 1,
                    ),
                    PlayerStatTile(
                      statDescription: "Win %",
                      statValue: utils.getPercentageFormat(
                        userStats.winPercent,
                      ),
                      index: 2,
                    ),
                    PlayerStatTile(
                      statDescription: "Points Per Game",
                      statValue: utils.getDoubleFormat(
                        userStats.avePointsPerGame,
                      ),
                      index: 3,
                    ),
                    PlayerStatTile(
                      statDescription: "Assists Per Game",
                      statValue: utils.getDoubleFormat(
                        userStats.aveAssistsPerGame,
                      ),
                      index: 4,
                    ),
                    PlayerStatTile(
                      statDescription: "Rebounds Per Game",
                      statValue: utils.getDoubleFormat(
                        userStats.aveReboundsPerGame,
                      ),
                      index: 5,
                    ),
                    PlayerStatTile(
                      statDescription: "Blocks Per Game",
                      statValue: utils.getDoubleFormat(
                        userStats.aveBlocksPerGame,
                      ),
                      index: 6,
                    ),
                    PlayerStatTile(
                      statDescription: "Steals Per Game",
                      statValue: utils.getDoubleFormat(
                        userStats.aveStlPerGame,
                      ),
                      index: 7,
                    ),
                    PlayerStatTile(
                      statDescription: "Total Points",
                      statValue: userStats.totalPoints.toString(),
                      index: 8,
                    ),
                    PlayerStatTile(
                      statDescription: "Total Assists",
                      statValue: userStats.totalAst.toString(),
                      index: 9,
                    ),
                    PlayerStatTile(
                      statDescription: "Total Rebounds",
                      statValue: userStats.totalRebounds.toString(),
                      index: 10,
                    ),
                    PlayerStatTile(
                      statDescription: "Total Blocks",
                      statValue: userStats.totalBlk.toString(),
                      index: 11,
                    ),
                    PlayerStatTile(
                      statDescription: "Total Steals",
                      statValue: userStats.totalStl.toString(),
                      index: 12,
                    ),
                    PlayerStatTile(
                      statDescription: "Average FG%",
                      statValue:
                          utils.getPercentageFormat(userStats.aveFgPercent),
                      index: 13,
                    ),
                    PlayerStatTile(
                      statDescription: "Average 3PT%",
                      statValue: utils.getPercentageFormat(
                        userStats.aveThreePtPercent,
                      ),
                      index: 14,
                    ),
                    PlayerStatTile(
                      statDescription: "Average FT%",
                      statValue: utils.getPercentageFormat(
                        userStats.aveFtPercent,
                      ),
                      index: 15,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
