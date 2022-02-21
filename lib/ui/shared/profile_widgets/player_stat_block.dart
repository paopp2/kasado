import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PlayerStatBlock extends StatelessWidget {
  const PlayerStatBlock({
    Key? key,
    required this.constraints,
    required this.statDescription,
    required this.statValue,
  }) : super(key: key);

  final BoxConstraints constraints;
  final String statValue;
  final String statDescription;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      elevation: 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () => Fluttertoast.showToast(
          msg: 'Ranked games with player stats coming soon',
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.transparent,
          ),
          height: constraints.maxWidth * 0.275,
          width: constraints.maxWidth * 0.275,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                statValue,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                statDescription,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
