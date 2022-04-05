import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_controller.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_state.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/ui/court_slot_details/tabs/box_score_tab/components/slot_game_selector_row.dart';
import 'package:kasado/ui/court_slot_details/tabs/box_score_tab/components/team_stat_table.dart';
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
    final controller = ref.watch(gameStatController);
    final selectedGameStats = ref.watch(selectedGameStatsProvider);
    final selectedGameStatsStream = ref.watch(slotGameStatsStreamProvider(
        (selectedGameStats == null)
            ? null
            : "${courtSlot.courtId}|${courtSlot.slotId}|${selectedGameStats.id}"));
    final utils = ref.watch(kasadoUtilsProvider);

    return Column(
      children: [
        Expanded(
          child: selectedGameStatsStream.when(
            error: (e, _) => Text(e.toString()),
            loading: () => const LoadingWidget(),
            data: (gameStats) {
              return (gameStats == null)
                  ? const Center(child: Text('No stats available'))
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'HOME',
                                    style:
                                        TextStyle(color: Colors.blue.shade200),
                                  ),
                                  Text(
                                    gameStats.homeScore.toString(),
                                    style: TextStyle(
                                      color: Colors.blue.shade200,
                                      fontSize: 50,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'AWAY',
                                    style:
                                        TextStyle(color: Colors.red.shade200),
                                  ),
                                  Text(
                                    gameStats.awayScore.toString(),
                                    style: TextStyle(
                                      color: Colors.red.shade200,
                                      fontSize: 50,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            children: [
                              TeamStatTable(
                                constraints: constraints,
                                statsList: gameStats.homeTeamStats.entries
                                    .map((statEntry) => statEntry.value)
                                    .toList()
                                  ..sort((a, b) => a.player.displayName!
                                      .toLowerCase()
                                      .compareTo(
                                        b.player.displayName!.toLowerCase(),
                                      )),
                                isHome: true,
                                utils: utils,
                              ),
                              const SizedBox(height: 25),
                              TeamStatTable(
                                constraints: constraints,
                                statsList: gameStats.awayTeamStats.entries
                                    .map((statEntry) => statEntry.value)
                                    .toList()
                                  ..sort((a, b) => a.player.displayName!
                                      .toLowerCase()
                                      .compareTo(
                                        b.player.displayName!.toLowerCase(),
                                      )),
                                isHome: false,
                                utils: utils,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
            },
          ),
        ),
        const Divider(),
        SlotGameSelectorRow(
          controller: controller,
          courtSlot: courtSlot,
          selectedGameStats: selectedGameStats,
        ),
      ],
    );
  }
}
