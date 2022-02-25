import 'package:flutter/material.dart';

class LoginErrorDialog extends StatelessWidget {
  const LoginErrorDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Text("Ni-error pre. Kani kasagaran ang problema:"),
          SizedBox(height: 20),
          Text(
            "1) Dili Google Chrome or Safari ang gigamit sa pag abli sa link",
          ),
          SizedBox(height: 20),
          Text("2) Naka-disabled ang popups. Try daw enable pre"),
          SizedBox(height: 20),
          Text(
              "Og wa jud gani gihapon, e-contact si Paolo Pepito or Paul Abenaza"),
        ],
      ),
      actions: [
        TextButton(
          child: const Text('Sge2 pre'),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
  }
}
