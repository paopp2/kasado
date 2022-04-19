import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_controller.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_state.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/ui/admin/stat_manager/components/timer_button.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

class ScoreBoardView extends HookConsumerWidget {
  const ScoreBoardView({
    Key? key,
    required this.courtSlot,
  }) : super(key: key);

  final CourtSlot courtSlot;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(gameStatController);

    final slotStatsPath = ref.watch(slotGameStatsPathProvider);
    final gameStatsStream =
        ref.watch(slotGameStatsStreamProvider(slotStatsPath));

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: gameStatsStream.when(
            error: (e, _) => Text(e.toString()),
            loading: () => const LoadingWidget(),
            data: (gameStats) {
              return (gameStats == null)
                  ? const Center(child: Text('No game started yet'))
                  : Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                gameStats.homeScore.toString(),
                                style: TextStyle(
                                  color: Colors.blue.shade700,
                                  fontWeight: FontWeight.bold,
                                  fontSize: constraints.maxHeight * 0.65,
                                ),
                              ),
                              Text(
                                gameStats.awayScore.toString(),
                                style: TextStyle(
                                  color: Colors.red.shade700,
                                  fontWeight: FontWeight.bold,
                                  fontSize: constraints.maxHeight * 0.65,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: TimerButton(
                            controller: controller,
                            courtSlot: courtSlot,
                            gameStats: gameStats,
                            displayTimeOnly: true,
                            showMillis: false,
                            fontSize: constraints.maxHeight * 0.3,
                          ),
                        ),
                      ],
                    );
            },
          ),
        );
      },
    );
  }
}
