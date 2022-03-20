import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_state.dart';
import 'package:kasado/model/column_data/column_data.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/game_stats/game_stats.dart';
import 'package:kasado/model/stats/stats.dart';
import 'package:kasado/ui/shared/kasado_table.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

class BoxScoreTab extends HookConsumerWidget {
  const BoxScoreTab({
    Key? key,
    required this.constraints,
    required this.courtSlot,
  }) : super(key: key);

  final BoxConstraints constraints;
  final CourtSlot courtSlot;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allGameStatsStream = ref.watch(allSlotGamesStatsStreamProvider(
        '${courtSlot.courtId}|${courtSlot.slotId}'));
    final selectedStatsState = useState<GameStats?>(null);

    return Column(
      children: [
        Expanded(
          child: (selectedStatsState.value == null)
              ? const Center(child: Text('No stats available'))
              : ListView(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "HOME",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    KasadoTable<Stats>(
                      height: constraints.maxHeight * 0.5,
                      width: constraints.maxWidth,
                      frozenColumnCount: 1,
                      dataAsList: selectedStatsState
                          .value!.homeTeamStats.entries
                          .map((statEntry) => statEntry.value)
                          .toList(),
                      columnDataList: [
                        ColumnData(
                          columnName: "Player",
                          // Value not required as this column will only show the user's CircleAvatar
                          dataValueCallback: (stats) => '',
                          valueToStringCallback: (playerPhoto, stats) =>
                              playerPhoto as String,
                          isImage: true,
                        ),
                        ColumnData(
                          columnName: "Name",
                          dataValueCallback: (stats) =>
                              stats.player.displayName,
                          valueToStringCallback: (playerName, stats) =>
                              playerName as String,
                        ),
                        ColumnData(
                          columnName: "PTS",
                          dataValueCallback: (stats) => stats.points,
                          valueToStringCallback: (points, stats) =>
                              points.toString(),
                        ),
                        ColumnData(
                          columnName: "REB",
                          dataValueCallback: (stats) => stats.rebounds,
                          valueToStringCallback: (rebounds, stats) =>
                              rebounds.toString(),
                        ),
                        ColumnData(
                          columnName: "AST",
                          dataValueCallback: (stats) => stats.ast,
                          valueToStringCallback: (assists, stats) =>
                              assists.toString(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "AWAY",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    KasadoTable<Stats>(
                      height: constraints.maxHeight * 0.5,
                      width: constraints.maxWidth,
                      frozenColumnCount: 1,
                      dataAsList: selectedStatsState
                          .value!.awayTeamStats.entries
                          .map((statEntry) => statEntry.value)
                          .toList(),
                      columnDataList: [
                        ColumnData(
                          columnName: "Player",
                          // Value not required as this column will only show the user's CircleAvatar
                          dataValueCallback: (stats) => '',
                          valueToStringCallback: (playerPhoto, stats) =>
                              playerPhoto as String,
                          isImage: true,
                        ),
                        ColumnData(
                          columnName: "Name",
                          dataValueCallback: (stats) =>
                              stats.player.displayName,
                          valueToStringCallback: (playerName, stats) =>
                              playerName as String,
                        ),
                        ColumnData(
                          columnName: "PTS",
                          dataValueCallback: (stats) => stats.points,
                          valueToStringCallback: (points, stats) =>
                              points.toString(),
                        ),
                        ColumnData(
                          columnName: "REB",
                          dataValueCallback: (stats) => stats.rebounds,
                          valueToStringCallback: (rebounds, stats) =>
                              rebounds.toString(),
                        ),
                        ColumnData(
                          columnName: "AST",
                          dataValueCallback: (stats) => stats.ast,
                          valueToStringCallback: (assists, stats) =>
                              assists.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
        const Divider(),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: allGameStatsStream.when(
              error: (e, _) => Text(e.toString()),
              loading: () => const LoadingWidget(),
              data: (allGameStats) {
                if (allGameStats.isNotEmpty &&
                    (selectedStatsState.value == null)) {
                  // If gameStats is not empty and no game stats had been
                  // selected yet, show the stats of the first game by default.
                  // Update asynchronously to avoid UI rebuild errors or "clashes"
                  Future.delayed(Duration.zero, () {
                    selectedStatsState.value = allGameStats.first;
                  });
                }
                return Row(
                  children: allGameStats
                      .asMap()
                      .entries
                      .map(
                        (gameStatEntry) => TextButton(
                          child: Text(
                            'G${gameStatEntry.key + 1}',
                            style: TextStyle(
                              color: (selectedStatsState.value ==
                                      gameStatEntry.value)
                                  ? Colors.green
                                  : null,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () =>
                              (selectedStatsState.value = gameStatEntry.value),
                        ),
                      )
                      .toList(),
                );
              }),
        ),
      ],
    );
  }
}
