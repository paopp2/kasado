import 'package:flutter/material.dart';

class StatButton extends StatelessWidget {
  const StatButton({
    Key? key,
    required this.color,
    required this.content,
    required this.onPressed,
  }) : super(key: key);

  final Color color;
  final String content;
  final VoidCallback onPressed;

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
        style: ElevatedButton.styleFrom(
          primary: color,
          fixedSize: const Size(75, 75),
          shape: const CircleBorder(),
        ),
      ),
    );
  }
}
