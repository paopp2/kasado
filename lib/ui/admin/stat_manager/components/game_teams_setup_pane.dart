import 'package:flutter/material.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_controller.dart';
import 'package:kasado/model/court_slot/court_slot.dart';

class GameTeamsSetupPane extends StatelessWidget {
  const GameTeamsSetupPane({
    Key? key,
    required this.controller,
    required this.courtSlot,
  }) : super(key: key);

  final GameStatController controller;
  final CourtSlot courtSlot;

  @override
  Widget build(BuildContext context) {
    final players = courtSlot.players
      ..sort((a, b) => a.displayName!.compareTo(b.displayName!));
    final homeTeamPlayers = courtSlot.stageHomeTeamPlayers ?? [];
    final awayTeamPlayers = courtSlot.stageAwayTeamPlayers ?? [];

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
        Expanded(
          child: Material(
            child: ListView.builder(
              itemCount: players.length,
              itemBuilder: (context, i) {
                final player = players[i];
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
              child: const Text('RESET', style: TextStyle(color: Colors.red)),
              onPressed: () => controller.resetAllStageTeams(
                courtSlot: courtSlot,
              ),
            ),
            TextButton(
              child: const Text(
                'START GAME',
                style: TextStyle(color: Colors.green),
              ),
              onPressed: () => controller.initStatsForGame(
                context: context,
                courtSlot: courtSlot,
                awayTeamPlayers: awayTeamPlayers,
                homeTeamPlayers: homeTeamPlayers,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
