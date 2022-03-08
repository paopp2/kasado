import 'package:flutter/material.dart';

class TeamTab extends StatelessWidget {
  const TeamTab({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Team invites coming soon'));
  }
}
