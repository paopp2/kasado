import 'package:flutter/material.dart';

class CourtDetailsView extends StatelessWidget {
  const CourtDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (constraints, context) {
        return Scaffold(
          body: Container(color: Colors.blue),
        );
      },
    );
  }
}
