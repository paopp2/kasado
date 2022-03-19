import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/court_details/court_details_state.dart';
import 'package:kasado/logic/court_slot_details/court_slot_details_view_model.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/ui/court_details/components/slot_player_tile.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

class CourtSlotDetailsView extends HookConsumerWidget {
  const CourtSlotDetailsView({
    Key? key,
    required this.isAdmin,
    required this.court,
    required this.baseCourtSlot,
    required this.isDone,
  }) : super(key: key);

  final bool isAdmin;
  final Court court;
  final CourtSlot baseCourtSlot;
  final bool isDone;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(courtSlotDetailsViewModel);
    final courtSlotStream = ref.watch(
      courtSlotStreamProvider('${court.id}|${baseCourtSlot.slotId}'),
    );
    final currentUser = ref.watch(currentUserProvider)!;
    final currentUserInfo = ref.watch(currentUserInfoProvider).value;
    final isSuperAdmin = currentUserInfo?.isSuperAdmin ?? false;
    final adminController = model.adminController;
    final utils = ref.watch(kasadoUtilsProvider);
    final isModifyingSlot = useState(false);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: courtSlotStream.when(
              error: (e, _) => Text(e.toString()),
              loading: () => const LoadingWidget(),
              data: (courtSlot) {
                // If courtSlot doesn't exist in DB, use baseCourtSlot as passed
                // from previous View
                final fetchedCourtSlot =
                    courtSlot ?? baseCourtSlot.copyWith(players: []);
                final isSlotClosed =
                    utils.isCurrentSlotClosed(fetchedCourtSlot.timeRange);
                final players = fetchedCourtSlot.players;
                final currentPlayer = fetchedCourtSlot.hasPlayer(currentUser)
                    ? players.singleWhere((u) => (u.id == currentUser.id))
                    : null;
                if (isSlotClosed && (currentPlayer?.hasVotedForMvp ?? true)) {
                  players
                      .sort((a, b) => b.mvpVoteCount.compareTo(a.mvpVoteCount));
                }

                return Column(
                  children: [
                    Text(
                      court.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${utils.getDateFormat(fetchedCourtSlot.timeRange.startsAt)} / ${utils.getTimeRangeFormat(fetchedCourtSlot.timeRange)}",
                    ),
                    const SizedBox(height: 10),
                    Visibility(
                      visible: isAdmin,
                      child: const Text('ADMIN MODE'),
                    ),
                    if (utils.isCurrentSlotClosed(fetchedCourtSlot.timeRange) &&
                        currentPlayer != null &&
                        !currentPlayer.hasVotedForMvp) ...[
                      const Text(
                        'Pick your MVP to show results',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                    const Divider(thickness: 2),
                    Expanded(
                      child: (fetchedCourtSlot.isClosedByAdmin)
                          ? const Center(child: Text('Closed by admin'))
                          : (players.isEmpty)
                              ? const Center(child: Text('No players'))
                              : Material(
                                  child: ListView.builder(
                                    itemCount: players.length,
                                    itemBuilder: (context, index) {
                                      final player = players[index];
                                      return SlotPlayerTile(
                                        isMvp: index == 0 &&
                                            (player.mvpVoteCount != 0),
                                        model: model,
                                        player: player,
                                        currentPlayer: currentPlayer,
                                        court: court,
                                        fetchedCourtSlot: fetchedCourtSlot,
                                        isAdmin: isAdmin,
                                        isSuperAdmin: isSuperAdmin,
                                        adminController: adminController,
                                      );
                                    },
                                  ),
                                ),
                    ),
                    if (!isDone) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if (isAdmin) ...[
                            TextButton(
                              child: Text(
                                (fetchedCourtSlot.isClosedByAdmin)
                                    ? 'OPEN SLOT'
                                    : 'CLOSE SLOT',
                              ),
                              onPressed: () =>
                                  adminController.setCourtSlotClosed(
                                context: context,
                                courtSlot: fetchedCourtSlot,
                                closeCourt: !fetchedCourtSlot.isClosedByAdmin,
                                courtTicketPrice: court.ticketPrice,
                              ),
                            )
                          ],
                          (isModifyingSlot.value)
                              ? const LoadingWidget()
                              : Visibility(
                                  visible: !fetchedCourtSlot.isClosedByAdmin,
                                  child: TextButton(
                                    child: Text(
                                      fetchedCourtSlot.hasPlayer(currentUser)
                                          ? 'LEAVE GAME'
                                          : 'JOIN GAME',
                                    ),
                                    onPressed: () async {
                                      isModifyingSlot.value = true;
                                      await model.joinLeaveCourtSlot(
                                        baseCourtSlot: fetchedCourtSlot,
                                        slotHasPlayer:
                                            fetchedCourtSlot.hasPlayer(
                                          currentUser,
                                        ),
                                        courtTicketPrice: court.ticketPrice,
                                        teamId: currentUserInfo!.teamId,
                                        isTeamCaptain:
                                            currentUserInfo.isTeamCaptain,
                                      );
                                      isModifyingSlot.value = false;
                                    },
                                  ),
                                ),
                        ],
                      ),
                    ],
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
