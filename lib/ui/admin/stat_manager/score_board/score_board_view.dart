import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_controller.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_state.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/ui/admin/stat_manager/score_board/game_teams_setup_desktop_pane.dart';
import 'package:kasado/ui/admin/stat_manager/score_board/score_board_pane.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

class ScoreBoardView extends HookConsumerWidget {
  const ScoreBoardView({
    Key? key,
    required this.baseCourtSlot,
  }) : super(key: key);

  final CourtSlot baseCourtSlot;

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
                  ? GameTeamsSetupDesktopPane(
                      constraints: constraints,
                      baseCourtSlot: baseCourtSlot,
                      controller: controller,
                    )
                  : ScoreBoardPane(
                      controller: controller,
                      baseCourtSlot: baseCourtSlot,
                      constraints: constraints,
                      gameStats: gameStats,
                    );
            },
          ),
        );
      },
    );
  }
}
