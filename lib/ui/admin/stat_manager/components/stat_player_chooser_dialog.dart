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
          const Text('HOME', textAlign: TextAlign.center),
          Expanded(
            child: Visibility(
              visible:
                  (showOneAndShowHome == null || showOneAndShowHome == true),
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
          ),
          const Text('AWAY', textAlign: TextAlign.center),
          Expanded(
            child: Visibility(
              visible:
                  (showOneAndShowHome == null || showOneAndShowHome == false),
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
          ),
          Visibility(
            visible: showOneAndShowHome != null,
            child: TextButton(
              child: const Text('NONE'),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}