import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/overview_stats/overview_stats.dart';
import 'package:kasado/ui/shared/profile_widgets/player_stat_tile.dart';

class CareerStatsListPane extends HookConsumerWidget {
  const CareerStatsListPane({
    Key? key,
    required this.userStats,
    required this.utils,
  }) : super(key: key);

  final OverviewStats userStats;
  final KasadoUtils utils;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      ref.read(mixpanel)!.track("Viewed Career Stats");

      return;
    }, []);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 8,
      ),
      child: AnimationLimiter(
        child: ListView(
          children: [
            PlayerStatTile(
              statDescription: "Standing",
              statValue: "${userStats.totalWins} - ${userStats.totalLosses}",
              index: 0,
            ),
            PlayerStatTile(
              statDescription: "Win %",
              statValue: utils.getPercentageFormat(
                userStats.winPercent,
              ),
              index: 1,
            ),
            PlayerStatTile(
              statDescription: "Points Per Game",
              statValue: utils.getDoubleFormat(
                userStats.avePointsPerGame,
              ),
              index: 2,
            ),
            PlayerStatTile(
              statDescription: "Assists Per Game",
              statValue: utils.getDoubleFormat(
                userStats.aveAssistsPerGame,
              ),
              index: 3,
            ),
            PlayerStatTile(
              statDescription: "Rebounds Per Game",
              statValue: utils.getDoubleFormat(
                userStats.aveReboundsPerGame,
              ),
              index: 4,
            ),
            PlayerStatTile(
              statDescription: "Blocks Per Game",
              statValue: utils.getDoubleFormat(
                userStats.aveBlocksPerGame,
              ),
              index: 5,
            ),
            PlayerStatTile(
              statDescription: "Steals Per Game",
              statValue: utils.getDoubleFormat(
                userStats.aveStlPerGame,
              ),
              index: 6,
            ),
            PlayerStatTile(
              statDescription: "Total Points",
              statValue: userStats.totalPoints.toString(),
              index: 7,
            ),
            PlayerStatTile(
              statDescription: "Total Assists",
              statValue: userStats.totalAst.toString(),
              index: 8,
            ),
            PlayerStatTile(
              statDescription: "Total Rebounds",
              statValue: userStats.totalRebounds.toString(),
              index: 9,
            ),
            PlayerStatTile(
              statDescription: "Total Blocks",
              statValue: userStats.totalBlk.toString(),
              index: 10,
            ),
            PlayerStatTile(
              statDescription: "Total Steals",
              statValue: userStats.totalStl.toString(),
              index: 11,
            ),
            PlayerStatTile(
              statDescription: "Average FG%",
              statValue: utils.getPercentageFormat(userStats.aveFgPercent),
              index: 12,
            ),
            PlayerStatTile(
              statDescription: "Average 3PT%",
              statValue: utils.getPercentageFormat(
                userStats.aveThreePtPercent,
              ),
              index: 13,
            ),
            PlayerStatTile(
              statDescription: "Average FT%",
              statValue: utils.getPercentageFormat(
                userStats.aveFtPercent,
              ),
              index: 14,
            ),
          ],
        ),
      ),
    );
  }
}
