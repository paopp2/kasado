import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/app_router.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_controller.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_state.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

class GameTeamsSetupPane extends HookConsumerWidget {
  const GameTeamsSetupPane({
    Key? key,
    required this.controller,
    required this.courtSlot,
  }) : super(key: key);

  final GameStatController controller;
  final CourtSlot courtSlot;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sortState = ref.watch(teamsPlayersSetupSortProvider);
    final playersToShow = controller.getPlayersToShow(
      courtSlot: courtSlot,
      sortState: sortState,
    );

    final homeTeamPlayers = courtSlot.stageHomeTeamPlayers ?? [];
    final awayTeamPlayers = courtSlot.stageAwayTeamPlayers ?? [];
    final isStartingGameState = useState(false);

    Future<void> _onStartGamePressed() async {
      isStartingGameState.value = true;
      await controller.initStatsForGame(
        context: context,
        courtSlot: courtSlot,
        awayTeamPlayers: awayTeamPlayers,
        homeTeamPlayers: homeTeamPlayers,
      );
      isStartingGameState.value = false;
    }

    return Column(
      children: [
        Container(
          color: Colors.blue.shade200,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 40,
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
                            backgroundImage: NetworkImage(player.photoUrl!),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ),
        Container(
          color: Colors.red.shade200,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 40,
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
                            backgroundImage: NetworkImage(player.photoUrl!),
                            radius: 20,
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ),
        const Divider(),
        TextButton(
          child: Text(
            (sortState == 0)
                ? "Queued Only"
                : (sortState == 1)
                    ? "All (Alphabetical)"
                    : "All (According to Games Played)",
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(10.0),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            primary: Colors.blueGrey,
          ),
          onPressed: controller.toggleToNextSortState,
        ),
        Expanded(
          child: Material(
            child: ListView.builder(
              itemCount: playersToShow.length,
              itemBuilder: (context, i) {
                final player = playersToShow[i];

                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ListTile(
                    tileColor: homeTeamPlayers.contains(player)
                        ? Colors.blue.shade100
                        : awayTeamPlayers.contains(player)
                            ? Colors.red.shade100
                            : null,
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(player.photoUrl!),
                    ),
                    title: Text(player.displayName!),
                    subtitle: Text(
                      "GP: ${courtSlot.slotInfoPerPlayer[player.id]?.timesPlayed ?? 0}",
                    ),
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
                  ),
                );
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              child: const Text('ENLARGE'),
              onPressed: () => context.pushNamed(
                Routes.scoreBoardView,
                params: {'courtId': courtSlot.courtId},
                extra: courtSlot,
              ),
            ),
            TextButton(
              child: const Text('RESET', style: TextStyle(color: Colors.red)),
              onPressed: () => controller.resetAllStageTeams(
                courtSlot: courtSlot,
              ),
            ),
            (isStartingGameState.value)
                ? const LoadingWidget()
                : TextButton(
                    child: const Text(
                      'START GAME',
                      style: TextStyle(color: Colors.green),
                    ),
                    onPressed: _onStartGamePressed,
                  ),
          ],
        ),
      ],
    );
  }
}
