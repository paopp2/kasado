import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_controller.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_state.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/stats/stats.dart';
import 'package:kasado/ui/court_slot_details/tabs/box_score_tab/components/box_score_pane.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

class UserGameBoxScoreDialog extends HookConsumerWidget {
  const UserGameBoxScoreDialog({
    Key? key,
    required this.constraints,
    required this.userGameStats,
  }) : super(key: key);

  final BoxConstraints constraints;
  final Stats userGameStats;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(gameStatController);
    final utils = ref.watch(kasadoUtilsProvider);
    final courtSlot = userGameStats.courtSlot;
    final gameStatsStream = ref.watch(slotGameStatsStreamProvider(
        "${courtSlot.courtId}|${courtSlot.slotId}|${userGameStats.id!}"));

    useEffect(() {
      ref.read(mixpanel)!.track(
        "Viewed UserGameBoxScoreDialog",
        properties: {
          "courtName": courtSlot.courtName,
          "courtSlotTimeRange": utils.getTimeRangeFormat(
            courtSlot.timeRange,
            showDate: true,
          ),
        },
      );

      return;
    }, []);

    return SizedBox(
      height: constraints.maxHeight * 0.8,
      child: Dialog(
        insetPadding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                courtSlot.courtName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                utils.getTimeRangeFormat(
                  courtSlot.timeRange,
                  showDate: true,
                ),
              ),
              const SizedBox(height: 10),
              const Divider(),
              Expanded(
                child: gameStatsStream.when(
                  error: (e, _) => Text(e.toString()),
                  loading: () => const LoadingWidget(),
                  data: (gameStats) => Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: BoxScorePane(
                      controller: controller,
                      courtSlot: courtSlot,
                      constraints: constraints,
                      utils: utils,
                      gameStats: gameStats,
                    ),
                  ),
                ),
              ),
              TextButton(
                child: const Text(
                  "CLOSE",
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
