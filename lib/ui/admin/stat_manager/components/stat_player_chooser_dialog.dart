import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_state.dart';

class StatPlayerChooserDialog extends HookConsumerWidget {
  const StatPlayerChooserDialog({
    Key? key,
    this.showOneAndShowHome,
  }) : super(key: key);

  final bool? showOneAndShowHome;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeTeamPlayers = ref.watch(homeTeamPlayersProvider);
    final awayTeamPlayers = ref.watch(awayTeamPlayersProvider);
    return Dialog(
      child: Column(
        children: [
          if (showOneAndShowHome == null || showOneAndShowHome == true) ...[
            const Text('HOME', textAlign: TextAlign.center),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, i) {
                  final homePlayer = homeTeamPlayers[i];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        homePlayer.photoUrl!,
                      ),
                    ),
                    title: Text(homePlayer.displayName!),
                    onTap: () => Navigator.pop(context, homePlayer),
                  );
                },
              ),
            ),
          ],
          const Divider(),
          if (showOneAndShowHome == null || showOneAndShowHome == false) ...[
            const Text('AWAY', textAlign: TextAlign.center),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, i) {
                  final awayPlayer = awayTeamPlayers[i];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        awayPlayer.photoUrl!,
                      ),
                    ),
                    title: Text(awayPlayer.displayName!),
                    onTap: () => Navigator.pop(context, awayPlayer),
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}
