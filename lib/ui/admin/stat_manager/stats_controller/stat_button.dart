import 'package:flutter/material.dart';

class StatButton extends StatelessWidget {
  const StatButton({
    Key? key,
    required this.color,
    required this.content,
    required this.onPressed,
    required this.onLongPressed,
  }) : super(key: key);

  final Color color;
  final String content;
  final VoidCallback onPressed;
  final VoidCallback onLongPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ElevatedButton(
        child: Text(
          content,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        onPressed: onPressed,
        onLongPress: onLongPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          fixedSize: const Size(75, 75),
          shape: const CircleBorder(),
        ),
      ),
    );
  }
}
