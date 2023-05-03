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
import 'package:kasado/ui/profile/components/edit_profile_dialog.dart';
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
    final userBio = userInfo?.user.userBio;
    final isCurrentUser = currentUser.id == user?.id;
    final isSuperAdmin =
        ref.watch(currentUserInfoProvider).value?.isSuperAdmin ?? false;
    // TODO: Fix how this works
    const overviewStats = null;
    // final overviewStats = userInfo?.overviewStats;
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
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 42,
                          backgroundColor: Colors.blueGrey,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(user.photoUrl!),
                            radius: 40,
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                    SizedBox(
                      width: constraints.maxWidth * 0.5,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
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
                              style: const TextStyle(color: Colors.grey),
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
                                  padding: const EdgeInsets.only(top: 8),
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
                        children: [
                          Text(
                            (userBio?.heightFt != null &&
                                    userBio?.heightIn != null)
                                ? "${userBio!.heightFt!.toStringAsFixed(0)}'${userBio.heightIn!.toStringAsFixed(0)}"
                                : "-",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const Text(
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
                        children: [
                          Text(
                            (userBio?.weight != null)
                                ? userBio!.weight!.toStringAsFixed(0)
                                : "-",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const Text(
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
                        children: [
                          Text(
                            userBio?.positionAsString(
                                  showDashWhenEmpty: true,
                                ) ??
                                '-',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const Text(
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        if (overviewStats == null)
                          const Center(child: Text("No stats availabe"))
                        else
                          CareerStatsListPane(
                            userStats: overviewStats,
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
              onPressed: () => model.openEditProfileDialog(
                context: context,
                userBio: userBio,
                dialog: EditProfileDialog(model: model),
              ),
            )
          : null,
    );
  }
}
