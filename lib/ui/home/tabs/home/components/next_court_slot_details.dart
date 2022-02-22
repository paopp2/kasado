import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/court_details/court_details_state.dart';
import 'package:kasado/logic/court_details/court_details_view_model.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/time_range/time_range.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

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
    final model = ref.watch(courtDetailsViewModel);
    final utils = ref.watch(kasadoUtilsProvider);
    final nextTimeSlotState = useState(utils.getNextTimeSlotForToday(
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
        nextTimeSlotState.value = utils.getNextTimeSlotForToday(
          timeSlots: court.allowedTimeSlots,
          weekdays: court.allowedWeekDays,
        );
      });
      return;
    }, []);

    return courtSlotStream.when(
      error: (e, _) => Text(e.toString()),
      loading: () => const LoadingWidget(),
      data: (courtSlot) {
        // if there are no more timeSlots available for the day, then next
        // CourtSlot is null
        final nextCourtSlot = (nextTimeSlot == null)
            ? null
            : courtSlot ??
                CourtSlot(
                  courtId: court.id,
                  slotId: CourtSlot.getIdFromTimeRange(nextTimeSlot),
                  timeRange: TimeRange(
                    startsAt: nextTimeSlot.startsAt,
                    endsAt: nextTimeSlot.endsAt,
                  ),
                );

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: constraints.maxWidth * 0.16,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.people),
                  SizedBox(width: constraints.maxWidth * 0.05),
                  Text(
                    (nextCourtSlot != null)
                        ? '${nextCourtSlot.playerCount} / 25'
                        : '-',
                    style: TextStyle(
                      color: (nextCourtSlot?.isFull ?? true)
                          ? Colors.red
                          : Colors.green,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.calendar_today),
                  SizedBox(
                    width: constraints.maxWidth * 0.05,
                  ),
                  Text(
                    (nextTimeSlot != null)
                        ? utils.getTimeRangeFormat(nextTimeSlot)
                        : 'No more games for today',
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.money),
                  SizedBox(
                    width: constraints.maxWidth * 0.05,
                  ),
                  Text('₱ ${court.ticketPrice}')
                ],
              ),
              Visibility(
                visible: nextCourtSlot != null,
                child: (nextCourtSlot?.hasPlayer(currentUser) ?? false)
                    ? TextButton(
                        child: const Text('LEAVE GAME'),
                        onPressed: () => model.leaveCourtSlot(nextCourtSlot!),
                      )
                    : TextButton(
                        child: const Text('JOIN GAME'),
                        onPressed: () => model.joinCourtSlot(nextCourtSlot!),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
