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
    final slotStatsPath =
        "${courtSlot.courtId}|${courtSlot.slotId}|${courtSlot.liveGameStatsId}";
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
                      child: ElevatedButton(
                        child: const Text(
                          'START GAME',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => showDialog(
                          context: context,
                          builder: (_) => GameTeamsSetupDialog(
                            players: players,
                            courtSlot: courtSlot,
                          ),
                        ),
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              child: const Text(
                                'END GAME',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: null, // To avoid accidental presses
                              onLongPress: () => controller.endGame(
                                courtSlot: courtSlot,
                                gameStats: gameStats,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                const Text('HOME'),
                                Text(
                                  gameStats.homeScore.toString(),
                                  style: const TextStyle(fontSize: 30),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text('AWAY'),
                                Text(
                                  gameStats.awayScore.toString(),
                                  style: const TextStyle(fontSize: 30),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
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
                        gameStats: gameStats!,
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
                        gameStats: gameStats!,
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
                        gameStats: gameStats!,
                        courtSlot: courtSlot,
                      ),
                    ),
                    StatButton(
                      color: Colors.green,
                      content: 'DREB',
                      onPressed: () => controller.onPlayerRebounded(
                        context: context,
                        isDefensive: true,
                        gameStats: gameStats!,
                        courtSlot: courtSlot,
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
                        gameStats: gameStats!,
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
                        gameStats: gameStats!,
                        courtSlot: courtSlot,
                      ),
                    ),
                    const Spacer(),
                    StatButton(
                      color: Colors.grey,
                      content: 'BLK',
                      onPressed: () => controller.onPlayerBlock(
                        context: context,
                        gameStats: gameStats!,
                        courtSlot: courtSlot,
                      ),
                    ),
                    StatButton(
                      color: Colors.blue,
                      content: 'STL',
                      onPressed: () => controller.onPlayerSteal(
                        context: context,
                        gameStats: gameStats!,
                        courtSlot: courtSlot,
                      ),
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
                        gameStats: gameStats!,
                        courtSlot: courtSlot,
                      ),
                    ),
                    StatButton(
                      color: Colors.red,
                      content: '1',
                      onPressed: () => controller.onPlayerShotFT(
                        context: context,
                        wasMade: false,
                        gameStats: gameStats!,
                        courtSlot: courtSlot,
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
