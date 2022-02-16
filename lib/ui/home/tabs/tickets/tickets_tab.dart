import 'package:flutter/material.dart';

class TicketsTab extends StatelessWidget {
  const TicketsTab({
    required this.constraints,
    Key? key,
  }) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("Ticket $index"),
        );
      },
    );
  }
}
