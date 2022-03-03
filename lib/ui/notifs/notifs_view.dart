import 'package:flutter/material.dart';

class NotifsView extends StatelessWidget {
  const NotifsView({
    Key? key,
    this.isAdmin = false,
  }) : super(key: key);

  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Container(color: (isAdmin) ? Colors.red : Colors.blueGrey),
        );
      },
    );
  }
}
