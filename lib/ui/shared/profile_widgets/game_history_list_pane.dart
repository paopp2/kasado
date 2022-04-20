import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/profile/user_profile_state.dart';
import 'package:kasado/logic/profile/user_profile_view_model.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

class GameHistoryListPane extends HookConsumerWidget {
  const GameHistoryListPane({
    Key? key,
    required this.model,
    required this.userId,
    required this.constraints,
  }) : super(key: key);

  final UserProfileViewModel model;
  final BoxConstraints constraints;
  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userGameStatsStream = ref.watch(userStatsStreamProvider(userId));
    final utils = ref.watch(kasadoUtilsProvider);

    return userGameStatsStream.when(
      error: (e, _) => Text(e.toString()),
      loading: () => const LoadingWidget(),
      data: (userGameStats) {
        return ListView.builder(
          itemCount: userGameStats.length,
          itemBuilder: (context, i) {
            final gameStats = userGameStats[i];
            final courtSlot = gameStats.courtSlot;
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                tileColor: gameStats.hasWonGame!
                    ? Colors.green.shade100
                    : Colors.red.shade100,
                title: Text(courtSlot.courtName),
                subtitle: Text(utils.getTimeRangeFormat(
                  courtSlot.timeRange,
                  showDate: true,
                )),
                trailing: SizedBox(
                  width: constraints.maxWidth * 0.25,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: model
                        .getSortedStatsAsMapEntries(gameStats)
                        .sublist(0, 3)
                        .map((statEntry) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            statEntry.value.toString(),
                            style: const TextStyle(fontSize: 15),
                          ),
                          Text(
                            statEntry.key,
                            style: const TextStyle(fontSize: 10),
                          )
                        ],
                      );
                    }).toList(),
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
