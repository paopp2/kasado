import 'package:flutter/material.dart';

class PlayerStatTile extends StatelessWidget {
  const PlayerStatTile({
    Key? key,
    required this.statValue,
    required this.statDescription,
  }) : super(key: key);

  final String statValue;
  final String statDescription;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        tileColor: Colors.grey.shade100,
        title: Text(
          statDescription,
          style: TextStyle(color: Colors.grey.shade800),
        ),
        trailing: Text(
          statValue,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
