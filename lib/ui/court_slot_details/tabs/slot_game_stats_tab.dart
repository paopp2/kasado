import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_state.dart';
import 'package:kasado/model/column_data/column_data.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
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
    final allGameStatsStream = ref.watch(slotGamesStatsStreamProvider(
        '${courtSlot.courtId}|${courtSlot.slotId}'));

    return Column(
      children: [
        Expanded(
          child: ListView(
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
                return Row(
                  children: allGameStats
                      .asMap()
                      .entries
                      .map(
                        (gameStatEntry) => TextButton(
                          child: Text(
                            'G${gameStatEntry.key + 1}',
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {},
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
