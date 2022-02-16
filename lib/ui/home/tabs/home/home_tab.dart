import 'package:flutter/material.dart';
import 'package:kasado/logic/home/home_view_model.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/time_range/time_range.dart';
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
              courtId: 'Court ID',
              players: [],
              timeRange: TimeRange(
                startsAt: DateTime(2022, 2, 16, 9, 0),
                endsAt: DateTime(2022, 2, 16, 10, 0),
              ),
            ),
          ),
          CourtSlotCard(
            model: model,
            constraints: constraints,
            courtSlot: CourtSlot(
              courtId: 'Court ID',
              players: [],
              timeRange: TimeRange(
                startsAt: DateTime(2022, 2, 16, 8, 0),
                endsAt: DateTime(2022, 2, 16, 9, 0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
