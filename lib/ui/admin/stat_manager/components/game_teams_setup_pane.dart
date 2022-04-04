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
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                          radius: 20,
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
        Container(
          color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
        const Divider(),
        Expanded(
          child: ListView.builder(
            itemCount: players.length,
            itemBuilder: (context, i) {
              final player = players[i];
              return ListTile(
                leading: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(player.photoUrl!),
                ),
                title: Text(player.displayName!),
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
              );
            },
          ),
        ),
        TextButton(
          child: const Text('OK'),
          onPressed: () => controller.initStatsForGame(
            context: context,
            courtSlot: courtSlot,
            awayTeamPlayers: awayTeamPlayers,
            homeTeamPlayers: homeTeamPlayers,
          ),
        ),
      ],
    );
  }
}
