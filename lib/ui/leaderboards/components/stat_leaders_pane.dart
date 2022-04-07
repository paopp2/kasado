import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/app_router.dart';
import 'package:kasado/logic/leaderboards/leaderboards_state.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/stats/stats.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

class StatLeadersPane extends HookConsumerWidget {
  const StatLeadersPane({
    Key? key,
    required this.statDescription,
    required this.statType,
  }) : super(key: key);

  final String statDescription;
  final StatType statType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utils = ref.watch(kasadoUtilsProvider);
    final statLeadersStream = ref.watch(statLeadersStreamProvider(statType));

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
                  : ListView.builder(
                      itemCount: userInfoList.length,
                      itemBuilder: (context, i) {
                        final userInfo = userInfoList[i];
                        final player = userInfo.user;
                        final stats = userInfo.overviewStats;
                        final double statValue;
                        switch (statType) {
                          case StatType.winRate:
                            statValue = stats.winPercent;
                            break;
                          case StatType.ptsPerGame:
                            statValue = stats.avePointsPerGame;
                            break;
                          case StatType.astPerGame:
                            statValue = stats.aveAssistsPerGame;
                            break;
                          case StatType.rebPerGame:
                            statValue = stats.aveReboundsPerGame;
                            break;
                        }

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
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(player.photoUrl!),
                                  ),
                                  title: Text(player.displayName!),
                                  trailing: Text(
                                    utils.getDoubleFormat(statValue),
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
                    );
            },
          ),
        ),
      ],
    );
  }
}
