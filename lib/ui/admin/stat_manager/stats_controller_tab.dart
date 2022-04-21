import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_controller.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_state.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/ui/admin/stat_manager/components/game_teams_setup_pane.dart';
import 'package:kasado/ui/admin/stat_manager/components/live_stats_input_pane.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

class StatsControllerTab extends HookConsumerWidget {
  const StatsControllerTab({
    Key? key,
    required this.constraints,
    required this.courtSlot,
  }) : super(key: key);

  final BoxConstraints constraints;
  final CourtSlot courtSlot;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(gameStatController);

    // Update provider asynchronously to avoid UI rebuild errors or "clashes"
    // ignore: prefer-extracting-callbacks
    Future.delayed(Duration.zero, () {
      ref.read(slotGameStatsPathProvider.notifier).update((s) {
        if (courtSlot.liveGameStatsId == null) return null;

        return "${courtSlot.courtId}|${courtSlot.slotId}|${courtSlot.liveGameStatsId}";
      });
    });

    final slotStatsPath = ref.watch(slotGameStatsPathProvider);
    final gameStatsStream =
        ref.watch(slotGameStatsStreamProvider(slotStatsPath));

    return gameStatsStream.when(
      error: (e, _) => Text(e.toString()),
      loading: () => const LoadingWidget(),
      data: (gameStats) {
        return (gameStats == null)
            ? GameTeamsSetupPane(
                controller: controller,
                courtSlot: courtSlot,
              )
            : LiveStatsInputPane(
                controller: controller,
                courtSlot: courtSlot,
                gameStats: gameStats,
              );
      },
    );
  }
}
