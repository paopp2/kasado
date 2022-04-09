import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/app_router.dart';
import 'package:kasado/constants/enums.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/leaderboards/stat_leaders_state.dart';
import 'package:kasado/logic/leaderboards/stat_leaders_view_model.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

class StatLeadersPane extends HookConsumerWidget {
  const StatLeadersPane({
    Key? key,
    required this.model,
    required this.statDescription,
    required this.statType,
  }) : super(key: key);

  final StatLeadersViewModel model;
  final String statDescription;
  final StatType statType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);
    final statLeadersStream = ref.watch(statLeadersStreamProvider(statType));

    useEffect(() {
      ref.read(mixpanel)!.track("Viewed ${statType.toString()} Leaders Tab");
      return;
    }, []);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            statDescription,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: statLeadersStream.when(
            loading: () => const LoadingWidget(),
            error: (e, _) => Text(e.toString()),
            data: (userInfoList) {
              return (userInfoList.isEmpty)
                  ? const Center(child: Text('No data available'))
                  : Material(
                      child: ListView.builder(
                        itemCount: userInfoList.length,
                        itemBuilder: (context, i) {
                          final userInfo = userInfoList[i];
                          final player = userInfo.user;

                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 30,
                                  child: Text(
                                    '${i + 1}',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    tileColor: (player.id == currentUser?.id)
                                        ? Colors.green.shade50
                                        : null,
                                    leading: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(player.photoUrl!),
                                    ),
                                    title: Text(player.displayName!),
                                    trailing: Text(
                                      model.getStatValue(
                                        stats: userInfo.overviewStats,
                                        statType: statType,
                                      ),
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                    onTap: () => context.pushNamed(
                                      Routes.userProfileView,
                                      params: {'uid': player.id},
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
            },
          ),
        ),
      ],
    );
  }
}
