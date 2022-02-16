import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kasado/app_router.dart';
import 'package:kasado/model/court/court.dart';

class CourtsOwnedView extends StatelessWidget {
  const CourtsOwnedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          body: ListView.builder(itemBuilder: (context, index) {
            return ListTile(
              title: Text('Pitogo Basketball Court $index'),
              subtitle: const Text('Pitogo Consolacion Cebu, Philippines'),
              onTap: () => context.pushNamed(
                Routes.courtDetailsView,
                extra: const Court(
                  id: 'court2',
                  name: 'Pitogo Basketball Court',
                  photoUrl:
                      "https://i.pinimg.com/originals/80/9f/af/809faf105f55a2830918b9d859bd3958.jpg",
                  ticketPrice: 50,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
