import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';
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
    final currentUser = ref.watch(currentUserProvider)!;
    final utils = ref.watch(kasadoUtilsProvider);
    final user = userInfo?.user;
    final isCurrentUser = currentUser.id == user?.id;
    final isSuperAdmin =
        ref.watch(currentUserInfoProvider).value?.isSuperAdmin ?? false;
    final userStats = userInfo?.overviewStats;
    final tabController = useTabController(initialLength: 2);

    return (user == null)
        ? const Center(child: Text('No user info'))
        : Column(
            children: [
              const SizedBox(height: 10),
              CircleAvatar(
                backgroundImage: NetworkImage(user.photoUrl!),
                radius: 40,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 8.0,
                ),
                child: AutoSizeText(
                  user.displayName!,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                ),
              ),
              Text(user.email!),
              Visibility(
                visible: isCurrentUser || isSuperAdmin,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'PONDO: ${userInfo?.pondo} Php',
                      style: const TextStyle(fontSize: 15),
                    ),
                    TextButton(
                      child: const Text(
                        'ADD',
                        style: TextStyle(color: Colors.green),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => const PondoInfoDialog(),
                        );
                      },
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
                child: (userStats == null)
                    ? const Center(child: Text('No stats available'))
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            CareerStatsListPane(
                              userStats: userStats,
                              utils: utils,
                            ),
                            const GameHistoryListPane(),
                          ],
                        ),
                      ),
              ),
            ],
          );
  }
}
