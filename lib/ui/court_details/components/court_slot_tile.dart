import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
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
    final currentUserInfo = ref.watch(currentUserInfoProvider).value!;
    final utils = ref.watch(kasadoUtilsProvider);
    final isSlotClosed = utils.isCurrentSlotClosed(courtSlot.timeRange);
    final userNotReserved = !currentUserInfo.hasReserved;
    final userReservedHere =
        courtSlot.timeRange.startsAt.add(const Duration(hours: 1)) ==
            currentUserInfo.reservedAt;

    return Center(
      child: Container(
        height: constraints.maxHeight * 0.15,
        decoration: BoxDecoration(
          color: (isSlotClosed)
              ? Colors.grey.shade300
              : (courtSlot.isFull || courtSlot.isClosedByAdmin)
                  ? Colors.red.shade200
                  : (userNotReserved || userReservedHere)
                      ? Colors.green.shade400
                      : Colors.green.shade200,
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
                          isDone: isSlotClosed,
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
                  (isSlotClosed)
                      ? 'Closed'
                      : (courtSlot.isFull)
                          ? 'Full'
                          : (courtSlot.isClosedByAdmin)
                              ? 'Closed by admin'
                              : (userReservedHere)
                                  ? 'Joined'
                                  : 'Available',
                ),
                subtitle: Text(
                  utils.getTimeRangeFormat(courtSlot.timeRange),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: (courtSlot.isClosedByAdmin)
                      ? []
                      : [
                          const Text('Players'),
                          Text(
                            '${courtSlot.playerCount} / 25',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
