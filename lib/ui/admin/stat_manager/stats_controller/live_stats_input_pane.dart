import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kasado/app_router.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_controller.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/game_stats/game_stats.dart';
import 'package:kasado/ui/admin/stat_manager/stats_controller/stat_button.dart';
import 'package:kasado/ui/admin/stat_manager/components/timer_button.dart';

class LiveStatsInputPane extends StatelessWidget {
  const LiveStatsInputPane({
    Key? key,
    required this.controller,
    required this.courtSlot,
    required this.gameStats,
  }) : super(key: key);

  final GameStatController controller;
  final CourtSlot courtSlot;
  final GameStats gameStats;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      'ENLARGE',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => context.pushNamed(
                      Routes.scoreBoardView,
                      pathParameters: {'courtId': courtSlot.courtId},
                      extra: courtSlot,
                    ),
                  ),
                  ElevatedButton(
                    child: const Text(
                      'CANCEL',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: null, // To avoid accidental presses
                    onLongPress: () => controller.cancelGame(
                      courtSlot: courtSlot,
                      gameStats: gameStats,
                    ),
                  ),
                  ElevatedButton(
                    child: const Text(
                      'END',
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
              TimerButton(
                controller: controller,
                courtSlot: courtSlot,
                gameStats: gameStats,
                showMillis: true,
              ),
            ],
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                // TODO: Refactor to minimize boilerplate for StatButtons
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
                  onLongPressed: () => controller.onPlayerShot(
                    context: context,
                    isThree: true,
                    wasMade: true,
                    gameStats: gameStats,
                    courtSlot: courtSlot,
                    isCancel: true,
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
                  onLongPressed: () => controller.onPlayerShot(
                    context: context,
                    isThree: true,
                    wasMade: false,
                    gameStats: gameStats,
                    courtSlot: courtSlot,
                    isCancel: true,
                  ),
                ),
                const Spacer(),
                StatButton(
                  color: Colors.purple,
                  content: 'OREB',
                  onPressed: () => controller.onPlayerRebounded(
                    context: context,
                    isDefensive: false,
                    gameStats: gameStats,
                    courtSlot: courtSlot,
                  ),
                  onLongPressed: () => controller.onPlayerRebounded(
                    context: context,
                    isDefensive: false,
                    gameStats: gameStats,
                    courtSlot: courtSlot,
                    isCancel: true,
                  ),
                ),
                StatButton(
                  color: Colors.deepPurple,
                  content: 'DREB',
                  onPressed: () => controller.onPlayerRebounded(
                    context: context,
                    isDefensive: true,
                    gameStats: gameStats,
                    courtSlot: courtSlot,
                  ),
                  onLongPressed: () => controller.onPlayerRebounded(
                    context: context,
                    isDefensive: true,
                    gameStats: gameStats,
                    courtSlot: courtSlot,
                    isCancel: true,
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
                  onLongPressed: () => controller.onPlayerShot(
                    context: context,
                    isThree: false,
                    wasMade: true,
                    gameStats: gameStats,
                    courtSlot: courtSlot,
                    isCancel: true,
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
                  onLongPressed: () => controller.onPlayerShot(
                    context: context,
                    isThree: false,
                    wasMade: false,
                    gameStats: gameStats,
                    courtSlot: courtSlot,
                    isCancel: true,
                  ),
                ),
                const Spacer(),
                StatButton(
                  color: Colors.black,
                  content: 'BLK',
                  onPressed: () => controller.onPlayerBlock(
                    context: context,
                    gameStats: gameStats,
                    courtSlot: courtSlot,
                  ),
                  onLongPressed: () => controller.onPlayerBlock(
                    context: context,
                    gameStats: gameStats,
                    courtSlot: courtSlot,
                    isCancel: true,
                  ),
                ),
                StatButton(
                  color: Colors.brown,
                  content: 'STL',
                  onPressed: () => controller.onPlayerSteal(
                    context: context,
                    gameStats: gameStats,
                    courtSlot: courtSlot,
                  ),
                  onLongPressed: () => controller.onPlayerSteal(
                    context: context,
                    gameStats: gameStats,
                    courtSlot: courtSlot,
                    isCancel: true,
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
                  onLongPressed: () => controller.onPlayerShotFT(
                    context: context,
                    wasMade: true,
                    gameStats: gameStats,
                    courtSlot: courtSlot,
                    isCancel: true,
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
                  onLongPressed: () => controller.onPlayerShotFT(
                    context: context,
                    wasMade: false,
                    gameStats: gameStats,
                    courtSlot: courtSlot,
                    isCancel: true,
                  ),
                ),
                const Spacer(),
                InkWell(
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Icon(
                      Icons.restart_alt,
                      size: 40,
                      color: Colors.red,
                    ),
                  ),
                  onLongPress: () => controller.onUndoLastAction(
                    courtSlot: courtSlot,
                    gameStatsId: gameStats.id,
                  ),
                ),
                StatButton(
                  color: Colors.grey,
                  content: 'TO',
                  onPressed: () => controller.onPlayerTurnover(
                    context: context,
                    gameStats: gameStats,
                    courtSlot: courtSlot,
                  ),
                  onLongPressed: () => controller.onPlayerTurnover(
                    context: context,
                    gameStats: gameStats,
                    courtSlot: courtSlot,
                    isCancel: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
