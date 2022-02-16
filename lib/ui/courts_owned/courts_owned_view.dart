import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/app_router.dart';
import 'package:kasado/logic/courts_owned/courts_owned_view_model.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/ui/courts_owned/components/new_court_input_dialog.dart';

class CourtsOwnedView extends HookConsumerWidget {
  const CourtsOwnedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(courtsOwnedViewModel);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: ListView.builder(itemBuilder: (context, index) {
            return ListTile(
              title: Text('Pitogo Basketball Court $index'),
              subtitle: const Text('Pitogo Consolacion Cebu, Philippines'),
              onTap: () => context.pushNamed(
                Routes.courtDetailsView,
                extra: {
                  "court": Court(
                    id: 'court2',
                    name: 'Pitogo Basketball Court',
                    photoUrl:
                        "https://i.pinimg.com/originals/80/9f/af/809faf105f55a2830918b9d859bd3958.jpg",
                    ticketPrice: 50,
                    allowedTimeSlots: [],
                    nextAvailableSlot: CourtSlot(
                      courtId: '',
                      players: [],
                      startsAt: DateTime.now(),
                      endsAt: DateTime.now(),
                    ),
                  ),
                  "isAdmin": true,
                },
              ),
            );
          }),
          floatingActionButton: FloatingActionButton(
            onPressed: () => showDialog(
              context: context,
              builder: (context) {
                return NewCourtInputDialog(model: model);
              },
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
