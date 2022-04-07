import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/leaderboards/leaderboards_state.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

class StatLeadersPane extends HookConsumerWidget {
  const StatLeadersPane({
    Key? key,
    required this.statDescription,
  }) : super(key: key);

  final String statDescription;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utils = ref.watch(kasadoUtilsProvider);
    final winRateLeadersStream = ref.watch(winRateLeadersStreamProvider);

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
          child: winRateLeadersStream.when(
            loading: () => const LoadingWidget(),
            error: (e, _) => Text(e.toString()),
            data: (userInfoList) {
              return ListView.builder(
                itemCount: userInfoList.length,
                itemBuilder: (context, i) {
                  final player = userInfoList[i].user;
                  final statValue = userInfoList[i].overviewStats.winPercent;

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
                              backgroundImage: NetworkImage(player.photoUrl!),
                            ),
                            title: Text(player.displayName!),
                            trailing: Text(
                              utils.getDoubleFormat(statValue),
                              style: const TextStyle(fontSize: 15),
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
