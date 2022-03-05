import 'package:flutter/material.dart';

class PondoInfoDialog extends StatelessWidget {
  const PondoInfoDialog({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: constraints.maxHeight * 0.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                'Your PONDO can be used to pay for any game you want to join in advance',
              ),
              Text(
                "When paying through your PONDO, you don't have to pay on game day",
              ),
              Text(
                'For more information, contact Paul Abenaza or Paolo Pepito',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
