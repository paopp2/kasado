import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_state.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/ui/admin/stat_manager/components/game_teams_setup_dialog.dart';
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
                ElevatedButton(
                  child: const Text('3'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    fixedSize: const Size(75, 75),
                    shape: const CircleBorder(),
                  ),
                ),
                ElevatedButton(
                  child: const Text('3'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    fixedSize: const Size(75, 75),
                    shape: const CircleBorder(),
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  child: const Text('OREB'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    fixedSize: const Size(75, 75),
                    shape: const CircleBorder(),
                  ),
                ),
                ElevatedButton(
                  child: const Text('DREB'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    fixedSize: const Size(75, 75),
                    shape: const CircleBorder(),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  child: const Text('2'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    fixedSize: const Size(75, 75),
                    shape: const CircleBorder(),
                  ),
                ),
                ElevatedButton(
                  child: const Text('2'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    fixedSize: const Size(75, 75),
                    shape: const CircleBorder(),
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  child: const Text('STL'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    fixedSize: const Size(75, 75),
                    shape: const CircleBorder(),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  child: const Text('1'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    fixedSize: const Size(75, 75),
                    shape: const CircleBorder(),
                  ),
                ),
                ElevatedButton(
                  child: const Text('1'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    fixedSize: const Size(75, 75),
                    shape: const CircleBorder(),
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
