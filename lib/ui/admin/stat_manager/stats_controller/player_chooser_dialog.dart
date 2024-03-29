import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_state.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';

/// Used to choose a player in the context wherein the player to belongs to a team
///
/// Eg. Used in game teams setup and in selecting a player for a stat input
class PlayerChooserDialog extends HookConsumerWidget {
  const PlayerChooserDialog({
    Key? key,
    this.showOneAndShowHome,
    this.homeTeamPlayersOverride,
    this.awayTeamPlayersOverride,
  }) : super(key: key);

  final bool? showOneAndShowHome;
  final List<KasadoUser>? homeTeamPlayersOverride;
  final List<KasadoUser>? awayTeamPlayersOverride;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<KasadoUser> homeTeamPlayers =
        homeTeamPlayersOverride ?? ref.watch(homeTeamPlayersProvider);
    final List<KasadoUser> awayTeamPlayers =
        awayTeamPlayersOverride ?? ref.watch(awayTeamPlayersProvider);

    return Dialog(
      child: Column(
        children: [
          Expanded(
            child: Visibility(
              visible:
                  (showOneAndShowHome == null || showOneAndShowHome == true),
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, i) {
                  final homePlayer = homeTeamPlayers[i];

                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ListTile(
                      tileColor: Colors.blue.shade50,
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          homePlayer.photoUrl!,
                        ),
                      ),
                      title: Text(homePlayer.displayName!),
                      onTap: () => Navigator.pop(context, homePlayer),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Visibility(
              visible:
                  (showOneAndShowHome == null || showOneAndShowHome == false),
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, i) {
                  final awayPlayer = awayTeamPlayers[i];

                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ListTile(
                      tileColor: Colors.red.shade50,
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          awayPlayer.photoUrl!,
                        ),
                      ),
                      title: Text(awayPlayer.displayName!),
                      onTap: () => Navigator.pop(context, awayPlayer),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text(
                  'NONE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                  ),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
