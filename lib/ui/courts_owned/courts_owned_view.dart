import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kasado/app_router.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/ui/shared/data_entry_field.dart';

class CourtsOwnedView extends StatelessWidget {
  const CourtsOwnedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  "court": const Court(
                    id: 'court2',
                    name: 'Pitogo Basketball Court',
                    photoUrl:
                        "https://i.pinimg.com/originals/80/9f/af/809faf105f55a2830918b9d859bd3958.jpg",
                    ticketPrice: 50,
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
                  return Dialog(
                    child: Column(
                      children: [
                        const DataEntryField(hint: 'Court Name'),
                        const DataEntryField(hint: 'Court Photo URL'),
                        const DataEntryField(hint: 'Address'),
                        const DataEntryField(hint: 'Ticket Price'),
                        TextButton(
                          child: const Text('Add Court'),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  );
                }),
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
