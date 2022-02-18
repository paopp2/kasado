import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kasado/app_router.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/ui/home/tabs/home/components/next_court_slot_details.dart';

class NextCourtSlotCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10,
      ),
      child: SizedBox(
        height: constraints.maxHeight * 0.47,
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
                  Text(court.address),
                  const Divider(),
                  NextCourtSlotDetails(
                    constraints: constraints,
                    court: court,
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
