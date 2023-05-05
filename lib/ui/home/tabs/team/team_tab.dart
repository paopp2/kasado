import 'package:badges/badges.dart' as badges;
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/app_router.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/home/states/team_tab_state.dart';
import 'package:kasado/logic/home/team_tab_model.dart';
import 'package:kasado/ui/home/tabs/team/components/team_build_dialog.dart';
import 'package:kasado/ui/shared/loading_widget.dart';
import 'package:kasado/ui/shared/stagger_list_tile_animation.dart';

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

    useEffect(() {
      ref.read(mixpanel)!.track("Viewed TeamTab");

      return;
    }, []);

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
                              team.teamName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            Expanded(
                              child: AnimationLimiter(
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

                                    return StaggerListTileAnimation(
                                      index: i,
                                      child: ListTile(
                                        leading: badges.Badge(
                                          badgeContent: const FaIcon(
                                            FontAwesomeIcons.crown,
                                            size: 8,
                                          ),
                                          badgeStyle: const BadgeStyle(
                                            badgeColor: Colors.amber,
                                          ),
                                          showBadge: isTeamCaptain,
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                              player.photoUrl!,
                                            ),
                                          ),
                                        ),
                                        title: Text(
                                          player.displayName!,
                                          style: const TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                        onTap: () => context.pushNamed(
                                          Routes.userProfileView,
                                          pathParameters: {'uid': player.id},
                                        ),
                                      ),
                                    );
                                  },
                                ),
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
                    backgroundColor: Colors.blue.shade200,
                    label: Text(
                      (userInfo.hasTeam)
                          ? (userInfo.isTeamCaptain)
                              ? 'Edit Team'
                              : 'Leave Team'
                          : 'Build a team',
                    ),
                    icon: Icon(
                      (userInfo.hasTeam)
                          ? (userInfo.isTeamCaptain)
                              ? Icons.edit
                              : Icons.logout
                          : Icons.group,
                    ),
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
                        : () => model.removeUserFromTeam(
                              team: team!,
                              player: userInfo.user,
                              teamHasReserved: userInfo.hasReserved,
                            ),
                  ),
                );
              },
            );
      },
    );
  }
}
