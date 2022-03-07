import 'package:flutter/material.dart';

class TicketTab extends StatelessWidget {
  const TicketTab({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Hello po'));
  }
}
