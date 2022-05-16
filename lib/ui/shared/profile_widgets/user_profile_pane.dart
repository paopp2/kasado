import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/profile/user_profile_view_model.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';
import 'package:kasado/ui/admin/player_manager/pondo_input_dialog.dart';
import 'package:kasado/ui/home/components/pondo_info_dialog.dart';
import 'package:kasado/ui/shared/profile_widgets/career_stats_list_pane.dart';
import 'package:kasado/ui/shared/profile_widgets/game_history_list_pane.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class UserProfilePane extends HookConsumerWidget {
  const UserProfilePane({
    Key? key,
    required this.userInfo,
    required this.constraints,
  }) : super(key: key);

  final KasadoUserInfo? userInfo;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(userProfileViewModel);
    final currentUser = ref.watch(currentUserProvider)!;
    final utils = ref.watch(kasadoUtilsProvider);
    final user = userInfo?.user;
    final isCurrentUser = currentUser.id == user?.id;
    final isSuperAdmin =
        ref.watch(currentUserInfoProvider).value?.isSuperAdmin ?? false;
    final userCareerStats = userInfo?.overviewStats;
    final tabController = useTabController(initialLength: 2);

    void _onAddPondoLongPressed() => showDialog(
          context: context,
          builder: (_) => PondoInputDialog(
            model: model,
            userInfo: userInfo!,
          ),
        );

    return Scaffold(
      body: (user == null)
          ? const Center(child: Text('No user info'))
          : Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(user.photoUrl!),
                      radius: 40,
                    ),
                    SizedBox(
                      width: constraints.maxWidth * 0.5,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            AutoSizeText(
                              user.displayName!,
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                            ),
                            AutoSizeText(
                              user.email!,
                              textAlign: TextAlign.left,
                              maxLines: 1,
                            ),
                            Visibility(
                              visible: isCurrentUser || isSuperAdmin,
                              child: GestureDetector(
                                onTap: () => showDialog(
                                  context: context,
                                  builder: (_) => const PondoInfoDialog(),
                                ),
                                onLongPress: (isSuperAdmin)
                                    ? _onAddPondoLongPressed
                                    : null,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8.0,
                                  ),
                                  child: Text(
                                    '${userInfo?.pondo} Php',
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(),
                SizedBox(
                  height: constraints.maxHeight * 0.075,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "5'11",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Height",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "82",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Weight",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "PF / C",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Position",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    controller: tabController,
                    tabs: const [
                      Tab(text: "CAREER STATS"),
                      Tab(text: "GAME HISTORY"),
                    ],
                    indicator: MaterialIndicator(),
                  ),
                ),
                Expanded(
                  child: (userCareerStats == null)
                      ? const Center(child: Text('No stats available'))
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TabBarView(
                            controller: tabController,
                            children: [
                              CareerStatsListPane(
                                userStats: userCareerStats,
                                utils: utils,
                              ),
                              GameHistoryListPane(
                                model: model,
                                userId: user.id,
                                constraints: constraints,
                              ),
                            ],
                          ),
                        ),
                ),
              ],
            ),
      floatingActionButton: isCurrentUser
          ? FloatingActionButton.extended(
              label: const Text("Edit Profile"),
              icon: const Icon(Icons.edit),
              backgroundColor: Colors.blueGrey,
              foregroundColor: Colors.white,
              onPressed: () => print("Allow editing of profile"),
            )
          : null,
    );
  }
}
