import 'package:flutter/material.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/overview_stats/overview_stats.dart';
import 'package:kasado/ui/shared/profile_widgets/player_stat_tile.dart';

class CareerStatsListPane extends StatelessWidget {
  const CareerStatsListPane({
    Key? key,
    required this.userStats,
    required this.utils,
  }) : super(key: key);

  final OverviewStats userStats;
  final KasadoUtils utils;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 8,
      ),
      child: ListView(
        children: [
          PlayerStatTile(
            statDescription: "Standing",
            statValue: "${userStats.totalWins} - ${userStats.totalLosses}",
          ),
          PlayerStatTile(
            statDescription: "Win %",
            statValue: utils.getPercentageFormat(
              userStats.winPercent,
            ),
          ),
          PlayerStatTile(
            statDescription: "Points Per Game",
            statValue: utils.getDoubleFormat(
              userStats.avePointsPerGame,
            ),
          ),
          PlayerStatTile(
            statDescription: "Assists Per Game",
            statValue: utils.getDoubleFormat(
              userStats.aveAssistsPerGame,
            ),
          ),
          PlayerStatTile(
            statDescription: "Rebounds Per Game",
            statValue: utils.getDoubleFormat(
              userStats.aveReboundsPerGame,
            ),
          ),
          PlayerStatTile(
            statDescription: "Blocks Per Game",
            statValue: utils.getDoubleFormat(
              userStats.aveBlocksPerGame,
            ),
          ),
          PlayerStatTile(
            statDescription: "Steals Per Game",
            statValue: utils.getDoubleFormat(
              userStats.aveStlPerGame,
            ),
          ),
          PlayerStatTile(
            statDescription: "Total Points",
            statValue: userStats.totalPoints.toString(),
          ),
          PlayerStatTile(
            statDescription: "Total Assists",
            statValue: userStats.totalAst.toString(),
          ),
          PlayerStatTile(
            statDescription: "Total Rebounds",
            statValue: userStats.totalRebounds.toString(),
          ),
          PlayerStatTile(
            statDescription: "Total Blocks",
            statValue: userStats.totalBlk.toString(),
          ),
          PlayerStatTile(
            statDescription: "Total Steals",
            statValue: userStats.totalStl.toString(),
          ),
          PlayerStatTile(
            statDescription: "Average FG%",
            statValue: utils.getPercentageFormat(userStats.aveFgPercent),
          ),
          PlayerStatTile(
            statDescription: "Average 3PT%",
            statValue: utils.getPercentageFormat(
              userStats.aveThreePtPercent,
            ),
          ),
          PlayerStatTile(
            statDescription: "Average FT%",
            statValue: utils.getPercentageFormat(
              userStats.aveFtPercent,
            ),
          ),
        ],
      ),
    );
  }
}
