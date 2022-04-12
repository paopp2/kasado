import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/app_router.dart';
import 'package:kasado/constants/enums.dart';
import 'package:kasado/logic/court_slot_details/court_slot_details_view_model.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/court_slot/court_slot.dart';

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
  final CourtSlotDetailsViewModel model;
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
            userHasConflictWithOtherSlot: () => Colors.red.shade200,
            userReservedAtThisSlot: () => Colors.green.shade200,
            orElse: () => Colors.green.shade400,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: (courtSlot.isClosedByAdmin && !isAdmin)
                ? null
                : () => context.pushNamed(
                      Routes.courtSlotDetailsView,
                      params: {'courtId': court.id},
                      queryParams: {
                        'court': jsonEncode(court.toJson()),
                        'baseCourtSlot': jsonEncode(courtSlot.toJson()),
                        'isDone':
                            (slotAndUserState == SlotAndUserState.slotEnded)
                                .toString(),
                      },
                      extra: isAdmin,
                    ),
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
                    userReservedAtThisSlot: () => 'Joined',
                    userHasConflictWithOtherSlot: () => 'In Conflict',
                    orElse: () => 'Available',
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
