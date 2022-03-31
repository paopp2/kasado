import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_controller.dart';
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
    final homeTeamPlayers = useState<List<KasadoUser>>([]);
    final awayTeamPlayers = useState<List<KasadoUser>>([]);

    void _addPlayerToHomeTeam(KasadoUser player) {
      final currentHomeTeamPlayers = homeTeamPlayers.value;
      homeTeamPlayers.value = [...currentHomeTeamPlayers, player];
    }

    void _removePlayerFromHomeTeam(KasadoUser player) {
      final currentHomeTeamPlayers = homeTeamPlayers.value;
      homeTeamPlayers.value = [...currentHomeTeamPlayers]..remove(player);
    }

    void _addPlayerToAwayTeam(KasadoUser player) {
      final currentAwayTeamPlayers = awayTeamPlayers.value;
      awayTeamPlayers.value = [...currentAwayTeamPlayers, player];
    }

    void _removePlayerFromAwayTeam(KasadoUser player) {
      final currentAwayTeamPlayers = awayTeamPlayers.value;
      awayTeamPlayers.value = [...currentAwayTeamPlayers]..remove(player);
    }

    return Dialog(
      child: Column(
        children: [
          Container(
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: homeTeamPlayers.value
                    .map((player) => GestureDetector(
                          onTap: () => _removePlayerFromHomeTeam(player),
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
                children: awayTeamPlayers.value
                    .map((player) => GestureDetector(
                          onTap: () => _removePlayerFromAwayTeam(player),
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
                        onPressed: () => _addPlayerToHomeTeam(player),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_right,
                          color: Colors.red,
                        ),
                        onPressed: () => _addPlayerToAwayTeam(player),
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
              awayTeamPlayers: awayTeamPlayers.value,
              homeTeamPlayers: homeTeamPlayers.value,
            ),
          ),
        ],
      ),
    );
  }
}
