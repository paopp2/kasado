import 'package:flutter/material.dart';

class LeaderboardsView extends StatelessWidget {
  const LeaderboardsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Container(color: Colors.amber),
        );
      },
    );
  }
}
