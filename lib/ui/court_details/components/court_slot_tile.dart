import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/court_details/court_details_view_model.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/ui/court_details/components/court_slot_details_dialog.dart';

class CourtSlotTile extends HookConsumerWidget {
  const CourtSlotTile({
    Key? key,
    required this.constraints,
    required this.isAdmin,
    required this.model,
    required this.courtSlot,
    required this.court,
  }) : super(key: key);

  final BoxConstraints constraints;
  final bool isAdmin;
  final CourtDetailsViewModel model;
  final CourtSlot courtSlot;
  final Court court;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utils = ref.watch(kasadoUtilsProvider);
    final slotAndUserState = model.getSlotAndUserState(courtSlot);

    return Center(
      child: Container(
        height: constraints.maxHeight * 0.15,
        decoration: BoxDecoration(
          color: slotAndUserState.when(
            slotEnded: () => Colors.grey.shade300,
            slotClosedByAdmin: () => Colors.red.shade200,
            slotFull: () => Colors.red.shade200,
            userNotReserved: () => Colors.green.shade400,
            userReservedAtThisSlot: () => Colors.green.shade400,
            userReservedAtAnotherSlot: () => Colors.green.shade200,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: (courtSlot.isClosedByAdmin && !isAdmin)
                ? null
                : () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return CourtSlotDetailsDialog(
                          constraints: constraints,
                          model: model,
                          isAdmin: isAdmin,
                          court: court,
                          baseCourtSlot: courtSlot,
                          isDone:
                              slotAndUserState == SlotAndUserState.slotEnded,
                        );
                      },
                    );
                  },
            child: Center(
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                textColor: Colors.white,
                title: Text(
                  slotAndUserState.when(
                    slotEnded: () => 'Slot has ended',
                    slotClosedByAdmin: () => 'Closed by admin',
                    slotFull: () => 'Full',
                    userNotReserved: () => 'Available',
                    userReservedAtThisSlot: () => 'Joined',
                    userReservedAtAnotherSlot: () => 'Available',
                  ),
                  style: const TextStyle(fontSize: 20),
                ),
                subtitle: Text(
                  utils.getTimeRangeFormat(courtSlot.timeRange),
                ),
                trailing: Visibility(
                  visible: !courtSlot.isClosedByAdmin,
                  child: Text(
                    '${courtSlot.playerCount} / 25',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
