import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_controller.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_state.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
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
    final players = courtSlot.players
      ..sort((a, b) => a.displayName!.compareTo(b.displayName!));

    final homeTeamPlayers = courtSlot.stageHomeTeamPlayers ?? [];
    final awayTeamPlayers = courtSlot.stageAwayTeamPlayers ?? [];

    // Update provider asynchronously to avoid UI rebuild errors or "clashes"
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
            ? Column(
                children: [
                  Container(
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: homeTeamPlayers
                            .map((player) => GestureDetector(
                                  onTap: () => controller.updateTeamStage(
                                    courtSlot: courtSlot,
                                    player: player,
                                    isHome: true,
                                    isPlayerAdd: false,
                                  ),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(player.photoUrl!),
                                    radius: 20,
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: awayTeamPlayers
                            .map((player) => GestureDetector(
                                  onTap: () => controller.updateTeamStage(
                                    courtSlot: courtSlot,
                                    player: player,
                                    isHome: false,
                                    isPlayerAdd: false,
                                  ),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(player.photoUrl!),
                                    radius: 20,
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                  const Divider(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: players.length,
                      itemBuilder: (context, i) {
                        final player = players[i];
                        return ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(player.photoUrl!),
                          ),
                          title: Text(player.displayName!),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.arrow_left,
                                  color: Colors.blue,
                                ),
                                onPressed: () => controller.updateTeamStage(
                                  courtSlot: courtSlot,
                                  player: player,
                                  isHome: true,
                                  isPlayerAdd: true,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.arrow_right,
                                  color: Colors.red,
                                ),
                                onPressed: () => controller.updateTeamStage(
                                  courtSlot: courtSlot,
                                  player: player,
                                  isHome: false,
                                  isPlayerAdd: true,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () => controller.initStatsForGame(
                      context: context,
                      courtSlot: courtSlot,
                      awayTeamPlayers: awayTeamPlayers,
                      homeTeamPlayers: homeTeamPlayers,
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  Expanded(
                    child: Column(
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
                              gameStats: gameStats,
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
                              gameStats: gameStats,
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
                              gameStats: gameStats,
                              courtSlot: courtSlot,
                            ),
                          ),
                          StatButton(
                            color: Colors.green,
                            content: 'DREB',
                            onPressed: () => controller.onPlayerRebounded(
                              context: context,
                              isDefensive: true,
                              gameStats: gameStats,
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
                              gameStats: gameStats,
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
                              gameStats: gameStats,
                              courtSlot: courtSlot,
                            ),
                          ),
                          const Spacer(),
                          StatButton(
                            color: Colors.grey,
                            content: 'BLK',
                            onPressed: () => controller.onPlayerBlock(
                              context: context,
                              gameStats: gameStats,
                              courtSlot: courtSlot,
                            ),
                          ),
                          StatButton(
                            color: Colors.blue,
                            content: 'STL',
                            onPressed: () => controller.onPlayerSteal(
                              context: context,
                              gameStats: gameStats,
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
                              gameStats: gameStats,
                              courtSlot: courtSlot,
                            ),
                          ),
                          StatButton(
                            color: Colors.red,
                            content: '1',
                            onPressed: () => controller.onPlayerShotFT(
                              context: context,
                              wasMade: false,
                              gameStats: gameStats,
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
