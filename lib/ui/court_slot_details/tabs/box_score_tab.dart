import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_state.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/game_stats/game_stats.dart';
import 'package:kasado/ui/court_slot_details/tabs/components/team_stat_table.dart';
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
    final utils = ref.watch(kasadoUtilsProvider);

    return Column(
      children: [
        Expanded(
          child: (selectedStatsState.value == null)
              ? const Center(child: Text('No stats available'))
              : ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "HOME : ${selectedStatsState.value!.homeScore}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TeamStatTable(
                      constraints: constraints,
                      statsList: selectedStatsState.value!.homeTeamStats.entries
                          .map((statEntry) => statEntry.value)
                          .toList(),
                      utils: utils,
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "AWAY : ${selectedStatsState.value!.awayScore}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TeamStatTable(
                      constraints: constraints,
                      statsList: selectedStatsState.value!.awayTeamStats.entries
                          .map((statEntry) => statEntry.value)
                          .toList(),
                      utils: utils,
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
