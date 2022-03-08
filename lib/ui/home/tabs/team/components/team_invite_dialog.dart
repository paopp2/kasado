import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/home/states/team_tab_state.dart';
import 'package:kasado/logic/home/team_tab_model.dart';
import 'package:kasado/ui/shared/user_search/user_search_pane.dart';

class TeamInviteDialog extends HookConsumerWidget {
  const TeamInviteDialog({
    Key? key,
    required this.constraints,
    required this.model,
  }) : super(key: key);

  final BoxConstraints constraints;
  final TeamTabModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserInfo = ref.watch(currentUserInfoProvider).value!;
    final teamUserInfoList = ref.watch(teamUserInfoListProvider);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: teamUserInfoList.map(
                    (userInfo) {
                      final isCurrentUser = userInfo.id == currentUserInfo.id;
                      return GestureDetector(
                        onTap: (isCurrentUser)
                            ? null
                            : () => model.removeUserInfoFromTeam(userInfo),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 20.0,
                          ),
                          child: Badge(
                            padding: const EdgeInsets.all(2.0),
                            badgeColor: Colors.grey,
                            badgeContent: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 12,
                            ),
                            showBadge: !isCurrentUser,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                userInfo.user.photoUrl!,
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
              Text('${teamUserInfoList.length} / 10'),
            ],
          ),
          Expanded(
            child: UserSearchPane(
              key: UniqueKey(),
              onUserTapped: model.addUserInfoToTeam,
              trailingFromInfo: (userInfo) =>
                  teamUserInfoList.contains(userInfo)
                      ? const Icon(Icons.check, color: Colors.green)
                      : null,
            ),
          ),
          TextButton(
            child: const Text(
              'BUILD TEAM',
              style: TextStyle(color: Colors.green),
            ),
            onPressed: model.pushTeam,
          ),
        ],
      ),
    );
  }
}
