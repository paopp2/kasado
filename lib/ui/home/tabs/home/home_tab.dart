import 'package:flutter/material.dart';
import 'package:kasado/logic/home/home_view_model.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/ui/home/tabs/home/components/court_slot_card.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({
    Key? key,
    required this.model,
    required this.constraints,
  }) : super(key: key);

  final HomeViewModel model;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          CourtSlotCard(
            model: model,
            constraints: constraints,
            courtSlot: CourtSlot(
              court: const Court(
                id: 'court1',
                name: 'Skina Japan Basketball Court',
                photoUrl:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHonQRDPCLA0zXvTzoThs-Q2hQ9s5lg3RBmA&usqp=CAU",
                ticketPrice: 50,
                allowedTimeSlots: [],
              ),
              players: [],
              startsAt: DateTime(2022, 2, 16, 9, 0),
              endsAt: DateTime(2022, 2, 16, 10, 0),
            ),
          ),
          CourtSlotCard(
            model: model,
            constraints: constraints,
            courtSlot: CourtSlot(
              court: const Court(
                id: 'court2',
                name: 'Skina China Basketball Court',
                photoUrl:
                    "https://i.pinimg.com/originals/80/9f/af/809faf105f55a2830918b9d859bd3958.jpg",
                ticketPrice: 15,
                allowedTimeSlots: [],
              ),
              players: [],
              startsAt: DateTime(2022, 2, 16, 8, 0),
              endsAt: DateTime(2022, 2, 16, 9, 0),
            ),
          ),
        ],
      ),
    );
  }
}
