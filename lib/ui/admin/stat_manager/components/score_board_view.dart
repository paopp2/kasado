import 'package:flutter/material.dart';

class ScoreBoardView extends StatelessWidget {
  const ScoreBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '14',
                      style: TextStyle(
                        color: Colors.blue.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: constraints.maxHeight * 0.65,
                      ),
                    ),
                    Text(
                      '13',
                      style: TextStyle(
                        color: Colors.red.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: constraints.maxHeight * 0.65,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TextButton(
                  child: Text(
                    '14 : 23',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: constraints.maxHeight * 0.3,
                    ),
                  ),
                  onPressed: null,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
