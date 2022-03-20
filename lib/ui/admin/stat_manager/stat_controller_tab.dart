import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_state.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/ui/admin/stat_manager/components/game_teams_setup_dialog.dart';
import 'package:kasado/ui/admin/stat_manager/components/stat_button.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

class StatControllerTab extends HookConsumerWidget {
  const StatControllerTab({
    Key? key,
    required this.constraints,
    required this.courtSlot,
  }) : super(key: key);

  final BoxConstraints constraints;
  final CourtSlot courtSlot;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final players = courtSlot.players;
    final slotStatsPath = ref.watch(slotGameStatsPathProvider);
    final gameSlotStream =
        ref.watch(slotGameStatsStreamProvider(slotStatsPath));

    return Column(
      children: [
        Expanded(
          child: gameSlotStream.when(
            error: (e, _) => Text(e.toString()),
            loading: () => const LoadingWidget(),
            data: (gameSlot) {
              return (gameSlot == null)
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
                  : const Center(
                      child: Text('Game started'),
                    );
            },
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                StatButton(
                  color: Colors.green,
                  content: '3',
                  onPressed: () {},
                ),
                StatButton(
                  color: Colors.red,
                  content: '3',
                  onPressed: () {},
                ),
                const Spacer(),
                StatButton(
                  color: Colors.red,
                  content: 'OREB',
                  onPressed: () {},
                ),
                StatButton(
                  color: Colors.green,
                  content: 'DREB',
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              children: [
                StatButton(
                  color: Colors.green,
                  content: '2',
                  onPressed: () {},
                ),
                StatButton(
                  color: Colors.red,
                  content: '2',
                  onPressed: () {},
                ),
                const Spacer(),
                StatButton(
                  color: Colors.red,
                  content: 'STL',
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              children: [
                StatButton(
                  color: Colors.green,
                  content: '1',
                  onPressed: () {},
                ),
                StatButton(
                  color: Colors.red,
                  content: '1',
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
