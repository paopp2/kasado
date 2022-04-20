import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_controller.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_state.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/game_stats/game_stats.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

class SlotGameSelectorRow extends HookConsumerWidget {
  const SlotGameSelectorRow({
    Key? key,
    required this.controller,
    required this.courtSlot,
    required this.selectedGameStats,
  }) : super(key: key);

  final GameStatController controller;
  final CourtSlot courtSlot;
  final GameStats? selectedGameStats;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allGameStatsStream = ref.watch(allSlotGamesStatsStreamProvider(
        '${courtSlot.courtId}|${courtSlot.slotId}'));
    final utils = ref.watch(kasadoUtilsProvider);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: allGameStatsStream.when(
        error: (e, _) => Text(e.toString()),
        loading: () => const LoadingWidget(),
        data: (allGameStats) {
          if (allGameStats.isNotEmpty && (selectedGameStats == null)) {
            // If gameStats is not empty and no game stats had been
            // selected yet, show the stats of the first game by default.
            // Update asynchronously to avoid UI rebuild errors or "clashes"
            Future.delayed(Duration.zero, () {
              controller.selectSlotGameStats(allGameStats.first);
            });
          }
          return Row(
            children: allGameStats
                .asMap()
                .entries
                .map(
                  (gameStatEntry) => TextButton(
                    child: Badge(
                      badgeColor: Colors.green,
                      showBadge: gameStatEntry.value.isLive,
                      child: Text(
                        'G${gameStatEntry.key + 1}',
                        style: TextStyle(
                          color:
                              (selectedGameStats?.id == gameStatEntry.value.id)
                                  ? Colors.green
                                  : Colors.grey.shade400,
                          fontWeight:
                              (selectedGameStats?.id == gameStatEntry.value.id)
                                  ? FontWeight.bold
                                  : null,
                        ),
                      ),
                    ),
                    onPressed: () {
                      ref.read(mixpanel)!.track(
                        "Selected a slot game",
                        properties: {
                          "slotNum": gameStatEntry.key,
                          "courtSlotTimeRange": utils.getTimeRangeFormat(
                            courtSlot.timeRange,
                            showDate: true,
                          )
                        },
                      );
                      controller.selectSlotGameStats(gameStatEntry.value);
                    },
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
