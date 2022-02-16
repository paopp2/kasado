import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/home/home_view_model.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/ui/home/components/court_slot_card.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(homeViewModel);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: model.signOut,
              )
            ],
          ),
          body: Center(
            child: ListView(
              children: [
                const SizedBox(height: 50),
                CourtSlotCard(
                  model: model,
                  constraints: constraints,
                  courtSlot: CourtSlot(
                    id: 'court1',
                    name: 'Skina Japan Basketball Court',
                    photoUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHonQRDPCLA0zXvTzoThs-Q2hQ9s5lg3RBmA&usqp=CAU",
                    players: [],
                    ticketPrice: 50,
                    startsAt: DateTime(2022, 2, 16, 9, 0),
                    endsAt: DateTime(2022, 2, 16, 10, 0),
                  ),
                ),
                CourtSlotCard(
                  model: model,
                  constraints: constraints,
                  courtSlot: CourtSlot(
                    id: 'court2',
                    name: 'Skina China Basketball Court',
                    photoUrl:
                        "https://i.pinimg.com/originals/80/9f/af/809faf105f55a2830918b9d859bd3958.jpg",
                    players: [],
                    ticketPrice: 15,
                    startsAt: DateTime(2022, 2, 16, 8, 0),
                    endsAt: DateTime(2022, 2, 16, 9, 0),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
