import 'package:flutter/material.dart';

class CourtsOwnedView extends StatelessWidget {
  const CourtsOwnedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Container(color: Colors.blueGrey),
        );
      },
    );
  }
}
