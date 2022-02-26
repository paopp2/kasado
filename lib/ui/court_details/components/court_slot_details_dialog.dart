import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/app_router.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/court_details/court_details_state.dart';
import 'package:kasado/logic/court_details/court_details_view_model.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

class CourtSlotDetailsDialog extends HookConsumerWidget {
  const CourtSlotDetailsDialog({
    Key? key,
    required this.constraints,
    required this.model,
    required this.isAdmin,
    required this.court,
    required this.baseCourtSlot,
    required this.isDone,
  }) : super(key: key);

  final BoxConstraints constraints;
  final bool isAdmin;
  final CourtDetailsViewModel model;
  final Court court;
  final CourtSlot baseCourtSlot;
  final bool isDone;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courtSlotStream = ref.watch(
      courtSlotStreamProvider('${court.id}|${baseCourtSlot.slotId}'),
    );
    final currentUser = ref.watch(currentUserProvider)!;
    final adminController = model.adminController;
    final utils = ref.watch(kasadoUtilsProvider);
    final isModifyingSlot = useState(false);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          height: constraints.maxHeight * 0.8,
          width: constraints.maxWidth * 0.8,
          child: courtSlotStream.when(
            error: (e, _) => Text(e.toString()),
            loading: () => const LoadingWidget(),
            data: (courtSlot) {
              // If courtSlot doesn't exist in DB, use baseCourtSlot as passed
              // from previous View
              final fetchedCourtSlot = courtSlot ?? baseCourtSlot;
              final players = fetchedCourtSlot.players;
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
                  const Divider(thickness: 2),
                  Expanded(
                    child: (players.isEmpty)
                        ? const Center(child: Text('No players'))
                        : ListView.builder(
                            itemCount: players.length,
                            itemBuilder: (context, index) {
                              final player = players[index];
                              return ListTile(
                                onTap: () => context.pushNamed(
                                  Routes.userProfileView,
                                  params: {'uid': player.id},
                                ),
                                onLongPress: (isAdmin)
                                    ? () => adminController
                                            .togglePlayerPaymentStatus(
                                          baseCourtSlot: fetchedCourtSlot,
                                          player: player,
                                        )
                                    : null,
                                title: AutoSizeText(
                                  player.displayName!,
                                  maxLines: 1,
                                ),
                                leading: CircleAvatar(
                                  radius: 25,
                                  backgroundImage:
                                      NetworkImage(player.photoUrl!),
                                ),
                                trailing: Visibility(
                                  visible: player.hasPaid,
                                  child: const Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  ),
                                ),
                              );
                            },
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
                            onPressed: () => adminController.setCourtSlotClosed(
                              context: context,
                              courtSlot: fetchedCourtSlot,
                              closeCourt: !fetchedCourtSlot.isClosedByAdmin,
                            ),
                          )
                        ],
                        (isModifyingSlot.value)
                            ? const LoadingWidget()
                            : TextButton(
                                child: Text(
                                  fetchedCourtSlot.hasPlayer(currentUser)
                                      ? 'LEAVE GAME'
                                      : 'JOIN GAME',
                                ),
                                onPressed: () async {
                                  isModifyingSlot.value = true;
                                  await model.joinLeaveCourtSlot(
                                    baseCourtSlot: fetchedCourtSlot,
                                    slotHasPlayer: fetchedCourtSlot.hasPlayer(
                                      currentUser,
                                    ),
                                    courtTicketPrice: court.ticketPrice,
                                    context: context,
                                  );
                                  isModifyingSlot.value = false;
                                },
                              ),
                      ],
                    ),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
