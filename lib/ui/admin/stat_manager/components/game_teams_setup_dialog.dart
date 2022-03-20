import 'package:flutter/material.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';

class GameTeamsSetupDialog extends StatelessWidget {
  const GameTeamsSetupDialog({
    Key? key,
    required this.players,
  }) : super(key: key);

  final List<KasadoUser> players;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          Container(
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  CircleAvatar(radius: 20),
                  CircleAvatar(radius: 20),
                  CircleAvatar(radius: 20),
                  CircleAvatar(radius: 20),
                  CircleAvatar(radius: 20),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  CircleAvatar(radius: 20),
                  CircleAvatar(radius: 20),
                  CircleAvatar(radius: 20),
                  CircleAvatar(radius: 20),
                  CircleAvatar(radius: 20),
                ],
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
                        onPressed: () {
                          // Add to HOME Team
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_right,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          // Add to AWAY Team
                        },
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          TextButton(
            child: const Text('OK'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
