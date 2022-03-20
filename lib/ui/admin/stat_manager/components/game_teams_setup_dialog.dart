import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_controller.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_state.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';

class GameTeamsSetupDialog extends HookConsumerWidget {
  const GameTeamsSetupDialog({
    Key? key,
    required this.players,
    required this.courtSlot,
  }) : super(key: key);

  final List<KasadoUser> players;
  final CourtSlot courtSlot;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(gameStatController);
    final homeTeamPlayers = ref.watch(homeTeamPlayersProvider);
    final awayTeamPlayers = ref.watch(awayTeamPlayersProvider);

    return Dialog(
      child: Column(
        children: [
          Container(
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: homeTeamPlayers
                    .map((player) => CircleAvatar(
                          backgroundImage: NetworkImage(player.photoUrl!),
                          radius: 20,
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
                    .map((player) => CircleAvatar(
                          backgroundImage: NetworkImage(player.photoUrl!),
                          radius: 20,
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
                        onPressed: () => controller.addPlayerToHomeTeam(player),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_right,
                          color: Colors.red,
                        ),
                        onPressed: () => controller.addPlayerToAwayTeam(player),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          TextButton(
            child: const Text('OK'),
            onPressed: () => controller.initStatsForGame(courtSlot),
          ),
        ],
      ),
    );
  }
}
