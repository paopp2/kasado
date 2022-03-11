import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/home/states/team_tab_state.dart';
import 'package:kasado/logic/home/team_tab_model.dart';
import 'package:kasado/ui/home/tabs/team/components/team_build_dialog.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

class TeamTab extends HookConsumerWidget {
  const TeamTab({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(teamTabModel);
    final currentUserInfoStream = ref.watch(currentUserInfoProvider);

    return currentUserInfoStream.when(
      error: (e, _) => Text(e.toString()),
      loading: () => const LoadingWidget(),
      data: (userInfo) {
        return ref.watch(teamStreamProvider(userInfo!.teamId)).when(
              error: (e, _) => Text(e.toString()),
              loading: () => const LoadingWidget(),
              data: (team) {
                return Scaffold(
                  body: (team != null) // User has team
                      ? Column(
                          children: [
                            Text(
                              "TEAM ${team.teamCaptain.displayName!.split(' ').first.toUpperCase()}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 20,
                                ),
                                itemCount: team.players.length,
                                itemBuilder: (context, i) {
                                  final player = team.players[i];
                                  final isTeamCaptain =
                                      player.id == team.teamCaptain.id;
                                  return ListTile(
                                    leading: Badge(
                                      badgeContent: const FaIcon(
                                        FontAwesomeIcons.crown,
                                        size: 8,
                                      ),
                                      badgeColor: Colors.amber,
                                      showBadge: isTeamCaptain,
                                      child: CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(player.photoUrl!),
                                      ),
                                    ),
                                    title: Text(
                                      player.displayName!,
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        )
                      : const Center(
                          child: Text(
                            'You currently do not have a team',
                          ),
                        ),
                  floatingActionButton: FloatingActionButton.extended(
                    label: Text(
                      (userInfo.hasTeam)
                          ? (userInfo.isTeamCaptain)
                              ? 'Edit Team'
                              : 'Leave Team'
                          : 'Build a team',
                    ),
                    icon: const Icon(Icons.group),
                    // If user has no team, user can build a team
                    // Or if user is team captain, user can edit team
                    onPressed: (!userInfo.hasTeam || userInfo.isTeamCaptain)
                        ? () => showDialog(
                              context: context,
                              builder: (_) => TeamBuildDialog(
                                constraints: constraints,
                                model: model,
                                team: team,
                              ),
                            )
                        : () {
                            // Leave team
                          },
                  ),
                );
              },
            );
      },
    );
  }
}
