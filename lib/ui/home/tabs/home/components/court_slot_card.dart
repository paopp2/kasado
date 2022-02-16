import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:kasado/app_router.dart';
import 'package:kasado/logic/home/home_view_model.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/court_slot/court_slot.dart';

class CourtSlotCard extends StatelessWidget {
  const CourtSlotCard({
    Key? key,
    required this.constraints,
    required this.court,
    required this.nextCourtSlot,
    required this.model,
  }) : super(key: key);

  final BoxConstraints constraints;
  final Court court;
  final CourtSlot nextCourtSlot;
  final HomeViewModel model;

  @override
  Widget build(BuildContext context) {
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 80.0,
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
                                "${DateFormat('MMM d / h:mm').format(nextCourtSlot.timeRange.startsAt)} - ${DateFormat('h:mm').format(nextCourtSlot.timeRange.endsAt)}")
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
