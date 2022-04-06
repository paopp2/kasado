import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kasado/constants/enums.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/court_slot_details/court_slot_details_state.dart';
import 'package:kasado/logic/court_slot_details/court_slot_details_view_model.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/time_range/time_range.dart';
import 'package:kasado/ui/shared/join_leave_slot_button.dart';
import 'package:kasado/ui/shared/loading_widget.dart';
import 'package:time/time.dart';

class NextCourtSlotDetails extends HookConsumerWidget {
  const NextCourtSlotDetails({
    Key? key,
    required this.constraints,
    required this.court,
  }) : super(key: key);

  final BoxConstraints constraints;
  final Court court;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider)!;
    final currentUserInfo = ref.watch(currentUserInfoProvider).value;
    final model = ref.watch(courtSlotDetailsViewModel);
    final utils = ref.watch(kasadoUtilsProvider);
    final nextTimeSlotState = useState(utils.getNextTimeSlot(
      timeSlots: court.allowedTimeSlots,
      weekdays: court.allowedWeekDays,
    ));
    final nextTimeSlot = nextTimeSlotState.value;
    final courtSlotStream = ref.watch(
      courtSlotStreamProvider(
        "${court.id}|${CourtSlot.getIdFromTimeRange(nextTimeSlot)}",
      ),
    );

    useEffect(() {
      // TODO: Improve performance for this feature
      // Update nextTimeSlot every 5 seconds
      Timer.periodic(const Duration(seconds: 5), (_) {
        nextTimeSlotState.value = utils.getNextTimeSlot(
          timeSlots: court.allowedTimeSlots,
          weekdays: court.allowedWeekDays,
        );
      });
      return;
    }, []);

    return courtSlotStream.when(
      error: (e, _) => Text(e.toString()),
      loading: () => SizedBox(
        height: constraints.maxHeight * 0.12,
        child: const LoadingWidget(),
      ),
      data: (courtSlot) {
        // if there are no more timeSlots available for the day, then next
        // CourtSlot is null
        final nextCourtSlot = courtSlot ??
            CourtSlot(
              courtId: court.id,
              slotId: CourtSlot.getIdFromTimeRange(nextTimeSlot),
              timeRange: TimeRange(
                startsAt: nextTimeSlot.startsAt,
                endsAt: nextTimeSlot.endsAt,
              ),
            );

        final nextSlotState = model.getSlotAndUserState(nextCourtSlot);

        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.people),
                      SizedBox(width: constraints.maxWidth * 0.05),
                      Text(
                        nextSlotState.when(
                          slotClosedByAdmin: () => 'Closed by admin',
                          orElse: () => '${nextCourtSlot.playerCount} / 25',
                        ),
                        style: TextStyle(
                          color: nextSlotState.when(
                            slotFull: () => Colors.red.shade200,
                            slotClosedByAdmin: () => Colors.red.shade200,
                            orElse: () {
                              return (nextCourtSlot.isLackingPlayers)
                                  ? Colors.grey
                                  : Colors.green.shade400;
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.calendar_today),
                      SizedBox(
                        width: constraints.maxWidth * 0.05,
                      ),
                      Text(
                        "${(nextTimeSlot.startsAt.isAtSameDayAs(DateTime.now())) ? 'Today' : DateFormat('E').format(nextTimeSlot.startsAt)} / ${utils.getTimeRangeFormat(nextTimeSlot)}",
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.money),
                      SizedBox(
                        width: constraints.maxWidth * 0.05,
                      ),
                      Text('₱ ${court.ticketPrice}')
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: constraints.maxHeight * 0.08,
                child: JoinLeaveSlotButton(
                  court: court,
                  courtSlot: nextCourtSlot,
                  currentUser: currentUser,
                  currentUserInfo: currentUserInfo!,
                  model: model,
                  allowLeave: false,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}
