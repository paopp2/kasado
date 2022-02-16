import 'package:flutter/material.dart';

class CourtSlotDetailsDialog extends StatelessWidget {
  const CourtSlotDetailsDialog({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: constraints.maxHeight * 0.8,
          width: constraints.maxWidth * 0.8,
          child: Column(
            children: [
              const Text('Skina Japan Basketball Gym'),
              const Text('7:00 - 8:00 AM'),
              const Text('Players'),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                          "https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTY2Njc5NDYzOTQ4NDYxNDA4/michael-jordan.jpg",
                        ),
                      ),
                      title: Text('Player $index'),
                    );
                  },
                ),
              ),
              ElevatedButton(
                child: const Text('JOIN GAME'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
