import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kasado/model/court_slot/court_slot.dart';

class CourtSlotCard extends StatelessWidget {
  const CourtSlotCard({
    Key? key,
    required this.constraints,
    required this.courtSlot,
  }) : super(key: key);

  final BoxConstraints constraints;
  final CourtSlot courtSlot;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10,
      ),
      child: SizedBox(
        height: constraints.maxHeight * 0.38,
        width: constraints.maxWidth * 0.85,
        child: Card(
          elevation: 20,
          shape: RoundedRectangleBorder(
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
                      courtSlot.photoUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.02),
                Text(
                  courtSlot.name.toUpperCase(),
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
                          Text('${courtSlot.playerCount} / 15')
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.calendar_today),
                          SizedBox(
                            width: constraints.maxWidth * 0.05,
                          ),
                          Text(
                              "${DateFormat('MMM d / h:mm').format(courtSlot.startsAt)} - ${DateFormat('h:mm').format(courtSlot.endsAt)}")
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.money),
                          SizedBox(
                            width: constraints.maxWidth * 0.05,
                          ),
                          Text('₱ ${courtSlot.ticketPrice}')
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
