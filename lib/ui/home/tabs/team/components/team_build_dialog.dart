import 'package:badges/badges.dart' as badges;
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/home/states/team_tab_state.dart';
import 'package:kasado/logic/home/team_tab_model.dart';
import 'package:kasado/model/team/team.dart';
import 'package:kasado/ui/shared/data_entry_field.dart';
import 'package:kasado/ui/shared/loading_widget.dart';
import 'package:kasado/ui/shared/user_search/user_search_pane.dart';

class TeamBuildDialog extends HookConsumerWidget {
  const TeamBuildDialog({
    Key? key,
    required this.constraints,
    required this.model,
    required this.team,
  }) : super(key: key);

  final BoxConstraints constraints;
  final TeamTabModel model;
  final Team? team;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isEdit = team != null;
    final currentUserInfo = ref.watch(currentUserInfoProvider).value!;
    final teamPlayersList = ref.watch(teamPlayersListProvider);
    final teamNameState = useState(team?.teamName ?? '');
    final isLoadingState = useState(false);

    useEffect(() {
      // ignore: prefer-extracting-callbacks
      Future.delayed(Duration.zero, () {
        if (team != null) {
          ref.read(teamPlayersListProvider.notifier).state = team!.players;
        }
      });

      return;
    }, []);

    Future<void> _onDissolveTeamPressed() async {
      isLoadingState.value = true;
      await model.dissolveTeam(
        hasReserved: currentUserInfo.hasReserved,
        team: team!,
        context: context,
      );
      isLoadingState.value = false;
    }

    Future<void> _onBuildUpdateTeamPressed() async {
      isLoadingState.value = true;
      await model.pushTeam(
        context: context,
        teamName: teamNameState.value,
        team: team,
        hasReserved: currentUserInfo.hasReserved,
      );
      isLoadingState.value = false;
    }

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Column(
            children: [
              DataEntryField(
                hint: 'Team Name',
                initialValue: team?.teamName,
                onChanged: (input) => teamNameState.value = input,
                validator: null,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: teamPlayersList.map(
                    (player) {
                      final isCurrentUser = player.id == currentUserInfo.id;

                      return GestureDetector(
                        onTap: (isCurrentUser)
                            ? null
                            : () => model.removeUserFromTeamBuild(player),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 20.0,
                          ),
                          child: badges.Badge(
                            badgeStyle: const BadgeStyle(
                              padding: EdgeInsets.all(2.0),
                              badgeColor: Colors.grey,
                            ),
                            badgeContent: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 12,
                            ),
                            showBadge: !isCurrentUser,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                player.photoUrl!,
                              ),
                              radius: 25,
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              Text('${teamPlayersList.length} / ${Team.maxPlayerCount}'),
            ],
          ),
          Expanded(
            child: UserSearchPane(
              key: UniqueKey(),
              onUserTapped: (userInfo) => model.addUserToTeam(
                userInfo: userInfo,
                teamId: team?.id,
              ),
              trailingFromInfo: (userInfo) =>
                  teamPlayersList.contains(userInfo.user)
                      ? const Icon(Icons.check, color: Colors.green)
                      : null,
            ),
          ),
          (isLoadingState.value)
              ? const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: LoadingWidget(),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (isEdit) ...[
                      TextButton(
                        child: const Text(
                          'DISSOLVE TEAM',
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: _onDissolveTeamPressed,
                      ),
                    ],
                    TextButton(
                      child: Text(
                        (isEdit) ? 'UPDATE TEAM' : 'BUILD TEAM',
                        style: const TextStyle(color: Colors.green),
                      ),
                      onPressed: _onBuildUpdateTeamPressed,
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
