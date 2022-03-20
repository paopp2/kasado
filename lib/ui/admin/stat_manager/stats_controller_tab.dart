import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_controller.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_state.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/ui/admin/stat_manager/components/game_teams_setup_dialog.dart';
import 'package:kasado/ui/admin/stat_manager/components/stat_button.dart';
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
    final players = courtSlot.players;
    final slotStatsPath = ref.watch(slotGameStatsPathProvider);
    final gameStatsStream =
        ref.watch(slotGameStatsStreamProvider(slotStatsPath));

    return gameStatsStream.when(
      error: (e, _) => Text(e.toString()),
      loading: () => const LoadingWidget(),
      data: (gameStats) {
        return Column(
          children: [
            Expanded(
              child: (gameStats == null)
                  ? Center(
                      child: TextButton(
                        child: const Text('START GAME'),
                        onPressed: () => showDialog(
                          context: context,
                          builder: (_) => GameTeamsSetupDialog(
                            players: players,
                            courtSlot: courtSlot,
                          ),
                        ),
                      ),
                    )
                  : const Center(child: Text('Game started')),
            ),
            Column(
              children: [
                Row(
                  children: [
                    StatButton(
                      color: Colors.green,
                      content: '3',
                      onPressed: () => controller.onPlayerShot(
                        context: context,
                        isThree: true,
                        wasMade: true,
                        baseGameStats: gameStats!,
                        courtSlot: courtSlot,
                      ),
                    ),
                    StatButton(
                      color: Colors.red,
                      content: '3',
                      onPressed: () => controller.onPlayerShot(
                        context: context,
                        isThree: true,
                        wasMade: false,
                        baseGameStats: gameStats!,
                        courtSlot: courtSlot,
                      ),
                    ),
                    const Spacer(),
                    StatButton(
                      color: Colors.red,
                      content: 'OREB',
                      onPressed: () => controller.onPlayerRebounded(
                        context: context,
                        isDefensive: false,
                      ),
                    ),
                    StatButton(
                      color: Colors.green,
                      content: 'DREB',
                      onPressed: () => controller.onPlayerRebounded(
                        context: context,
                        isDefensive: true,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    StatButton(
                      color: Colors.green,
                      content: '2',
                      onPressed: () => controller.onPlayerShot(
                        context: context,
                        isThree: false,
                        wasMade: true,
                        baseGameStats: gameStats!,
                        courtSlot: courtSlot,
                      ),
                    ),
                    StatButton(
                      color: Colors.red,
                      content: '2',
                      onPressed: () => controller.onPlayerShot(
                        context: context,
                        isThree: false,
                        wasMade: false,
                        baseGameStats: gameStats!,
                        courtSlot: courtSlot,
                      ),
                    ),
                    const Spacer(),
                    StatButton(
                      color: Colors.red,
                      content: 'STL',
                      onPressed: () =>
                          controller.onPlayerSteal(context: context),
                    ),
                  ],
                ),
                Row(
                  children: [
                    StatButton(
                      color: Colors.green,
                      content: '1',
                      onPressed: () => controller.onPlayerShotFT(
                        context: context,
                        wasMade: true,
                      ),
                    ),
                    StatButton(
                      color: Colors.red,
                      content: '1',
                      onPressed: () => controller.onPlayerShotFT(
                        context: context,
                        wasMade: false,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
