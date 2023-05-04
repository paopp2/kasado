import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/app_router.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_controller.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_state.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/game_stats/game_stats.dart';
import 'package:kasado/ui/admin/stat_manager/components/timer_button.dart';
import 'package:kasado/ui/court_slot_details/tabs/box_score_tab/components/team_stat_table.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

class BoxScorePane extends HookConsumerWidget {
  const BoxScorePane({
    Key? key,
    required this.controller,
    required this.courtSlot,
    required this.constraints,
    required this.utils,
    required this.gameStats,
    this.isAdmin = false,
  }) : super(key: key);

  final GameStatController controller;
  final CourtSlot courtSlot;
  final BoxConstraints constraints;
  final KasadoUtils utils;
  final GameStats? gameStats;
  final bool isAdmin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedGameStatsStream = ref.watch(slotGameStatsStreamProvider(
        (gameStats == null)
            ? null
            : "${courtSlot.courtId}|${courtSlot.slotId}|${gameStats!.id}"));
    final utils = ref.watch(kasadoUtilsProvider);

    return selectedGameStatsStream.when(
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
                              style: TextStyle(color: Colors.blue.shade200),
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
                        if (gameStats.isLive) ...[
                          TimerButton(
                            controller: controller,
                            courtSlot: courtSlot,
                            gameStats: gameStats,
                            showMillis: false,
                            displayTimeOnly: true,
                          ),
                        ],
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'AWAY',
                              style: TextStyle(color: Colors.red.shade200),
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
                        if (isAdmin)
                          TextButton(
                            onPressed: () {},
                            onLongPress: () {},
                            child: const Text(
                              "DELETE",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: gameStats.map(
                      (_) => ListView(
                        children: [
                          TeamStatTable(
                            constraints: constraints,
                            statsList: gameStats.homeTeamStats.entries
                                .map((statEntry) => statEntry.value)
                                .toList()
                              ..sort((a, b) =>
                                  a.player.displayName!.toLowerCase().compareTo(
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
                              ..sort((a, b) =>
                                  a.player.displayName!.toLowerCase().compareTo(
                                        b.player.displayName!.toLowerCase(),
                                      )),
                            isHome: false,
                            utils: utils,
                          ),
                        ],
                      ),
                      scoreOnly: (_) => Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text("NO STATS AVAILABLE"),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: gameStats.homeTeamStats.values
                                    .map(
                                      (stats) => GestureDetector(
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            stats.player.photoUrl!,
                                          ),
                                          radius: 30,
                                        ),
                                        onTap: () => context.pushNamed(
                                          Routes.userProfileView,
                                          pathParameters: {
                                            'uid': stats.player.id
                                          },
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  "HOME PLAYERS",
                                  style: TextStyle(
                                    color: Colors.blue.shade200,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: gameStats.awayTeamStats.values
                                    .map(
                                      (stats) => GestureDetector(
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            stats.player.photoUrl!,
                                          ),
                                          radius: 30,
                                        ),
                                        onTap: () => context.pushNamed(
                                          Routes.userProfileView,
                                          pathParameters: {
                                            'uid': stats.player.id
                                          },
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  "AWAY PLAYERS",
                                  style: TextStyle(
                                    color: Colors.red.shade200,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
