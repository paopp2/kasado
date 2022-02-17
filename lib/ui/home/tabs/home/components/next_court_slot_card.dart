import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kasado/app_router.dart';
import 'package:kasado/logic/court_details/court_details_state.dart';
import 'package:kasado/logic/court_details/court_details_view_model.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/court_slot/court_slot.dart';

class NextCourtSlotCard extends HookConsumerWidget {
  const NextCourtSlotCard({
    Key? key,
    required this.constraints,
    required this.court,
    required this.nextCourtSlot,
  }) : super(key: key);

  final BoxConstraints constraints;
  final Court court;
  final CourtSlot nextCourtSlot;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(courtDetailsViewModel);
    final courtSlotsStream = ref.watch(courtSlotsStreamProvider(court.id));

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10,
      ),
      child: SizedBox(
        height: constraints.maxHeight * 0.45,
        width: constraints.maxWidth * 0.85,
        child: Card(
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: InkWell(
            onTap: () => context.pushNamed(
              Routes.courtDetailsView,
              extra: {'court': court},
            ),
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: SizedBox(
                      height: constraints.maxHeight * 0.2,
                      width: constraints.maxWidth,
                      child: Image.network(
                        court.photoUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.02),
                  Text(
                    court.name.toUpperCase(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth * 0.15,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.people),
                            SizedBox(width: constraints.maxWidth * 0.05),
                            Text('${nextCourtSlot.playerCount} / 15')
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
                          onPressed: () {},
                          child: const Text("JOIN GAME"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
