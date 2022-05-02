import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_controller.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_state.dart';
import 'package:kasado/logic/court_slot_details/court_slot_details_state.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

class GameTeamsSetupDesktopPane extends HookConsumerWidget {
  const GameTeamsSetupDesktopPane({
    Key? key,
    required this.baseCourtSlot,
    required this.controller,
    required this.constraints,
  }) : super(key: key);

  final CourtSlot baseCourtSlot;
  final GameStatController controller;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sortState = ref.watch(teamsPlayersSetupSortProvider);

    final courtSlotStream = ref.watch(
      courtSlotStreamProvider(
        '${baseCourtSlot.courtId}|${baseCourtSlot.slotId}',
      ),
    );

    return courtSlotStream.when(
      error: (e, _) => Text(e.toString()),
      loading: () => const LoadingWidget(),
      data: (courtSlot) {
        if (courtSlot == null) return const SizedBox();

        final playersToShow = controller.getPlayersToShow(
          courtSlot: courtSlot,
          sortState: sortState,
        );

        final homeTeamPlayers = courtSlot.stageHomeTeamPlayers ?? [];
        final awayTeamPlayers = courtSlot.stageAwayTeamPlayers ?? [];

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'HOME',
                  style: TextStyle(
                    fontSize: constraints.maxHeight * 0.1,
                    color: Colors.blue.shade200,
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: constraints.maxWidth * 0.3,
                    child: ListView.builder(
                      itemCount: homeTeamPlayers.length,
                      itemBuilder: (context, i) {
                        final player = homeTeamPlayers[i];

                        return ListTile(
                          title: Text(player.displayName!),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(player.photoUrl!),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            const VerticalDivider(),
            Column(
              children: [
                Text(
                  'AWAY',
                  style: TextStyle(
                    color: Colors.red.shade200,
                    fontSize: constraints.maxHeight * 0.1,
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: constraints.maxWidth * 0.3,
                    child: ListView.builder(
                      itemCount: awayTeamPlayers.length,
                      itemBuilder: (context, i) {
                        final player = awayTeamPlayers[i];

                        return ListTile(
                          title: Text(player.displayName!),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(player.photoUrl!),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            const VerticalDivider(),
            Column(
              children: [
                TextButton(
                  child: Text(
                    (sortState == 0)
                        ? "Queued Only"
                        : (sortState == 1)
                            ? "All (Alphabetical)"
                            : "All (According to Games Played)",
                  ),
                  onPressed: controller.toggleToNextSortState,
                  style: TextButton.styleFrom(
                    primary: Colors.blue,
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: constraints.maxWidth * 0.3,
                    child: ListView.builder(
                      itemCount: playersToShow.length,
                      itemBuilder: (context, i) {
                        final player = playersToShow[i];

                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ListTile(
                            title: Text(player.displayName!),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                player.photoUrl!,
                              ),
                            ),
                            subtitle: Text(
                              "GP: ${courtSlot.slotInfoPerPlayer[player.id]?.timesPlayed ?? 0}",
                            ),
                            tileColor: homeTeamPlayers.contains(player)
                                ? Colors.blue.shade100
                                : awayTeamPlayers.contains(player)
                                    ? Colors.red.shade100
                                    : null,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
