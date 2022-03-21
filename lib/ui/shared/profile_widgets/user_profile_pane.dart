import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';
import 'package:kasado/ui/home/components/pondo_info_dialog.dart';
import 'package:kasado/ui/shared/profile_widgets/player_stat_tile.dart';

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

    return (user == null)
        ? const Text('No user info')
        : Column(
            children: [
              const SizedBox(height: 10),
              CircleAvatar(
                backgroundImage: NetworkImage(user.photoUrl!),
                radius: 50,
              ),
              const SizedBox(height: 10),
              Text(
                user.displayName!,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(user.email!),
              const SizedBox(height: 30),
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
                          builder: (_) => PondoInfoDialog(
                            constraints: constraints,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: (userStats == null)
                    ? const Center(child: Text('No stats available'))
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 8,
                        ),
                        child: ListView(
                          children: [
                            PlayerStatTile(
                              statDescription: "GAMES PLAYED",
                              statValue: userStats.gamesPlayed.toString(),
                            ),
                            PlayerStatTile(
                              statDescription: "STANDING",
                              statValue:
                                  "${userStats.totalWins} - ${userStats.totalLosses}",
                            ),
                            PlayerStatTile(
                              statDescription: "WIN RATE",
                              statValue: utils
                                  .getPercentageFormat(userStats.winPercent),
                            ),
                            PlayerStatTile(
                              statDescription: "POINTS PER GAME",
                              statValue:
                                  userStats.avePointsPerGame.toStringAsFixed(1),
                            ),
                            PlayerStatTile(
                              statDescription: "ASSISTS PER GAME",
                              statValue: userStats.aveAssistsPerGame
                                  .toStringAsFixed(1),
                            ),
                            PlayerStatTile(
                              statDescription: "REBOUNDS PER GAME",
                              statValue: userStats.aveReboundsPerGame
                                  .toStringAsFixed(1),
                            ),
                            PlayerStatTile(
                              statDescription: "BLOCKS PER GAME",
                              statValue:
                                  userStats.aveBlocksPerGame.toStringAsFixed(1),
                            ),
                            PlayerStatTile(
                              statDescription: "STEALS PER GAME",
                              statValue:
                                  userStats.aveStlPerGame.toStringAsFixed(1),
                            ),
                            PlayerStatTile(
                              statDescription: "TOTAL POINTS",
                              statValue: userStats.totalPoints.toString(),
                            ),
                            PlayerStatTile(
                              statDescription: "TOTAL ASSISTS",
                              statValue: userStats.totalAst.toString(),
                            ),
                            PlayerStatTile(
                              statDescription: "TOTAL REBOUNDS",
                              statValue: userStats.totalRebounds.toString(),
                            ),
                            PlayerStatTile(
                              statDescription: "TOTAL BLOCKS",
                              statValue: userStats.totalBlk.toString(),
                            ),
                            PlayerStatTile(
                              statDescription: "TOTAL STEALS",
                              statValue: userStats.totalStl.toString(),
                            ),
                            PlayerStatTile(
                              statDescription: "FG %",
                              statValue: utils
                                  .getPercentageFormat(userStats.aveFgPercent),
                            ),
                            PlayerStatTile(
                              statDescription: "3PT %",
                              statValue: utils.getPercentageFormat(
                                userStats.aveThreePtPercent,
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          );
  }
}
