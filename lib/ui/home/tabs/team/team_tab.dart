import 'package:flutter/material.dart';

class TeamTab extends StatelessWidget {
  const TeamTab({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('You currently do not have a team'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Create a team'),
        icon: const Icon(Icons.group),
        onPressed: () {},
      ),
    );
  }
}
