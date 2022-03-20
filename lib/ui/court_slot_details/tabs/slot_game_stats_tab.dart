import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_state.dart';
import 'package:kasado/model/column_data/column_data.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/game_stats/game_stats.dart';
import 'package:kasado/ui/shared/kasado_table.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

class SlotGameStatsTab extends HookConsumerWidget {
  const SlotGameStatsTab({
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
    final selectedGameStatsState = useState<GameStats?>(null);

    return Column(
      children: [
        Expanded(
          child: (selectedGameStatsState.value == null)
              ? const Text('Hello po')
              : ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        selectedGameStatsState.value!.id,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    KasadoTable<String>(
                      height: constraints.maxHeight * 0.5,
                      width: constraints.maxWidth,
                      frozenColumnCount: 1,
                      dataAsList: const [
                        "Hello",
                        "Po",
                        "Hello",
                        "Po",
                        "Hello",
                      ],
                      columnDataList: [
                        ColumnData(
                          columnName: "Name",
                          dataValueCallback: (val) => val,
                          valueToStringCallback: (val, valu) => valu,
                        ),
                        ColumnData(
                          columnName: "Name 2",
                          dataValueCallback: (val) => val,
                          valueToStringCallback: (val, valu) => valu,
                        ),
                        ColumnData(
                          columnName: "Name 3",
                          dataValueCallback: (val) => val,
                          valueToStringCallback: (val, valu) => valu,
                        ),
                        ColumnData(
                          columnName: "Name 4",
                          dataValueCallback: (val) => val,
                          valueToStringCallback: (val, valu) => valu,
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
                    KasadoTable<String>(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      frozenColumnCount: 1,
                      dataAsList: const [
                        "Hello",
                        "Po",
                        "Hello",
                        "Po",
                        "Hello",
                      ],
                      columnDataList: [
                        ColumnData(
                          columnName: "Name",
                          dataValueCallback: (val) => val,
                          valueToStringCallback: (val, valu) => valu,
                        ),
                        ColumnData(
                          columnName: "Name 2",
                          dataValueCallback: (val) => val,
                          valueToStringCallback: (val, valu) => valu,
                        ),
                        ColumnData(
                          columnName: "Name 3",
                          dataValueCallback: (val) => val,
                          valueToStringCallback: (val, valu) => valu,
                        ),
                        ColumnData(
                          columnName: "Name 4",
                          dataValueCallback: (val) => val,
                          valueToStringCallback: (val, valu) => valu,
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
                    (selectedGameStatsState.value == null)) {
                  // If gameStats is not empty and no game stats had been
                  // selected yet, show the stats of the first game by default.
                  // Update asynchronously to avoid UI rebuild errors or "clashes"
                  Future.delayed(Duration.zero, () {
                    selectedGameStatsState.value = allGameStats.first;
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
                              color: (selectedGameStatsState.value ==
                                      gameStatEntry.value)
                                  ? Colors.green
                                  : null,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () => (selectedGameStatsState.value =
                              gameStatEntry.value),
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
