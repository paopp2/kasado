import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/home/states/team_tab_state.dart';
import 'package:kasado/logic/home/team_tab_model.dart';
import 'package:kasado/ui/home/tabs/team/components/team_invite_dialog.dart';
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
                      ? ListView.builder(
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
                              title: Text(player.displayName!),
                            );
                          },
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
                              ? 'Delete Team'
                              : 'Leave Team'
                          : 'Build a team',
                    ),
                    icon: const Icon(Icons.group),
                    onPressed: (userInfo.hasTeam && userInfo.isTeamCaptain)
                        ? () => model.dissolveTeam(
                              team: team!,
                              hasReserved: userInfo.hasReserved,
                            )
                        : () => showDialog(
                              context: context,
                              builder: (_) => TeamInviteDialog(
                                constraints: constraints,
                                model: model,
                              ),
                            ),
                  ),
                );
              },
            );
      },
    );
  }
}
