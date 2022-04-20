import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_controller.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_state.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/ui/court_slot_details/tabs/box_score_tab/components/box_score_pane.dart';
import 'package:kasado/ui/court_slot_details/tabs/box_score_tab/components/slot_game_selector_row.dart';

class BoxScoreTab extends HookConsumerWidget {
  const BoxScoreTab({
    Key? key,
    required this.constraints,
    required this.courtSlot,
  }) : super(key: key);

  final BoxConstraints constraints;
  final CourtSlot courtSlot;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(gameStatController);
    final selectedGameStats = ref.watch(selectedGameStatsProvider);
    final utils = ref.watch(kasadoUtilsProvider);

    useEffect(() {
      ref.read(mixpanel)!.track("Viewed BoxScoreTab", properties: {
        "courtSlotTimeRange": utils.getTimeRangeFormat(
          courtSlot.timeRange,
          showDate: true,
        ),
      });
      return;
    }, []);

    return Column(
      children: [
        Expanded(
          child: BoxScorePane(
            controller: controller,
            courtSlot: courtSlot,
            constraints: constraints,
            utils: utils,
            selectedGameStats: selectedGameStats,
          ),
        ),
        const Divider(),
        SlotGameSelectorRow(
          controller: controller,
          courtSlot: courtSlot,
          selectedGameStats: selectedGameStats,
        ),
      ],
    );
  }
}
