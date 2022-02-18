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
    final nextTimeSlotState =
        useState(utils.getNextNearestTimeSlot(court.allowedTimeSlots));
    final nextTimeSlot = nextTimeSlotState.value;
    final courtSlotStream = ref.watch(
      courtSlotStreamProvider(
        "${court.id}|${utils.getSlotIdFromTimeSlot(nextTimeSlot)}",
      ),
    );
    // TODO: Remove this temp feature and replace with showing the next sched
    // (or not, depending on user feedback)
    //
    // (Next available day and time for schedule based on allowed times/days)
    // For now this feature is still based on the assumption that the next
    // sched is the day after, which might not be true
    final isToday = nextTimeSlot.startsAt.day == DateTime.now().day;

    useEffect(() {
      // TODO: Improve performance for this feature
      // Update nextTimeSlot every 5 minutes
      Timer.periodic(const Duration(minutes: 5), (_) {
        nextTimeSlotState.value =
            utils.getNextNearestTimeSlot(court.allowedTimeSlots);
      });
      return;
    }, []);

    return courtSlotStream.when(
      error: (e, _) => Text(e.toString()),
      loading: () => const CircularProgressIndicator(),
      data: (courtSlot) {
        final baseCourtSlot = courtSlot ??
            CourtSlot(
              courtId: court.id,
              players: [],
              timeRange: TimeRange(
                startsAt: nextTimeSlot.startsAt,
                endsAt: nextTimeSlot.endsAt,
              ),
            );

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: constraints.maxWidth * 0.15,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.people),
                  SizedBox(width: constraints.maxWidth * 0.05),
                  Text(
                    (isToday) ? '${baseCourtSlot.playerCount} / 25' : '-',
                    style: TextStyle(
                      color: (baseCourtSlot.isFull) ? Colors.red : Colors.green,
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
                    (isToday)
                        ? "${utils.getDateFormat(nextTimeSlot.startsAt)} / ${utils.getTimeRangeFormat(nextTimeSlot)}"
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
              (baseCourtSlot.hasPlayer(currentUser))
                  ? TextButton(
                      child: const Text('LEAVE GAME'),
                      onPressed: () => model.leaveCourtSlot(baseCourtSlot),
                    )
                  : TextButton(
                      child: const Text('JOIN GAME'),
                      onPressed: (baseCourtSlot.isFull || !isToday)
                          ? null
                          : () => model.joinCourtSlot(baseCourtSlot),
                    ),
            ],
          ),
        );
      },
    );
  }
}
