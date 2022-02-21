import 'package:flutter/material.dart';
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
              final players = courtSlot?.players ?? [];
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
                  Text(utils.getTimeRangeFormat(courtSlot!.timeRange)),
                  const SizedBox(height: 10),
                  Visibility(
                    visible: isAdmin,
                    child: const Text('ADMIN MODE'),
                  ),
                  const Divider(thickness: 2),
                  Expanded(
                    child: (players.isEmpty)
                        ? const Center(child: Text('No players yet'))
                        : ListView.builder(
                            itemCount: players.length,
                            itemBuilder: (context, index) {
                              final player = players[index];
                              return ListTile(
                                onTap: () => context.pushNamed(
                                  Routes.userProfileView,
                                  extra: player.id,
                                ),
                                onLongPress: (isAdmin)
                                    ? () => adminController
                                            .togglePlayerPaymentStatus(
                                          baseCourtSlot: courtSlot,
                                          player: player,
                                        )
                                    : null,
                                title: Text(player.displayName!),
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
                              (courtSlot.isClosedByAdmin)
                                  ? 'OPEN SLOT'
                                  : 'CLOSE SLOT',
                            ),
                            onPressed: () => adminController.setCourtSlotClosed(
                              courtSlot: courtSlot,
                              closeCourt: !courtSlot.isClosedByAdmin,
                            ),
                          )
                        ],
                        (courtSlot.hasPlayer(currentUser))
                            ? TextButton(
                                child: const Text('LEAVE GAME'),
                                onPressed: () => model.leaveCourtSlot(
                                  courtSlot,
                                  context,
                                ),
                              )
                            : TextButton(
                                child: const Text('JOIN GAME'),
                                onPressed: () => model.joinCourtSlot(
                                  courtSlot,
                                  context,
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
      ),
    );
  }
}
