import 'package:flutter/material.dart';

class CourtAdminsPanel extends StatelessWidget {
  const CourtAdminsPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const ListTile(title: Text("Hello world"));
      },
    );
  }
}
