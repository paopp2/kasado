import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kasado/logic/court_details/court_details_state.dart';
import 'package:kasado/logic/court_details/court_details_view_model.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/time_range/time_range.dart';

class NextCourtSlotDetails extends HookConsumerWidget {
  const NextCourtSlotDetails({
    Key? key,
    required this.constraints,
    required this.nextCourtSlot,
    required this.court,
  }) : super(key: key);

  final BoxConstraints constraints;
  final CourtSlot nextCourtSlot;
  final Court court;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(courtDetailsViewModel);
    final courtSlotStream = ref.watch(
      courtSlotStreamProvider("${court.id}|${nextCourtSlot.slotId}"),
    );

    return courtSlotStream.when(
      error: (e, _) => Text(e.toString()),
      loading: () => const CircularProgressIndicator(),
      data: (courtSlot) {
        final baseCourtSlot = courtSlot ??
            CourtSlot(
              courtId: court.id,
              players: [],
              timeRange: TimeRange(
                startsAt: nextCourtSlot.timeRange.startsAt,
                endsAt: nextCourtSlot.timeRange.endsAt,
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
                  Text('${baseCourtSlot.playerCount} / 25')
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.calendar_today),
                  SizedBox(
                    width: constraints.maxWidth * 0.05,
                  ),
                  Text(
                      "${DateFormat('MMM d / h:mm').format(nextCourtSlot.timeRange.startsAt)} - ${DateFormat('h:mm a').format(nextCourtSlot.timeRange.endsAt)}")
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
              TextButton(
                onPressed: () => model.joinCourtSlot(baseCourtSlot),
                child: const Text("JOIN GAME"),
              ),
            ],
          ),
        );
      },
    );
  }
}
