import 'package:flutter/material.dart';

class StatControllerTab extends StatelessWidget {
  const StatControllerTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          child: Center(child: Text('Hello world')),
        ),
        Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                  child: const Text('3'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    fixedSize: const Size(75, 75),
                    shape: const CircleBorder(),
                  ),
                ),
                ElevatedButton(
                  child: const Text('3'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    fixedSize: const Size(75, 75),
                    shape: const CircleBorder(),
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  child: const Text('OREB'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    fixedSize: const Size(75, 75),
                    shape: const CircleBorder(),
                  ),
                ),
                ElevatedButton(
                  child: const Text('DREB'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    fixedSize: const Size(75, 75),
                    shape: const CircleBorder(),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  child: const Text('2'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    fixedSize: const Size(75, 75),
                    shape: const CircleBorder(),
                  ),
                ),
                ElevatedButton(
                  child: const Text('2'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    fixedSize: const Size(75, 75),
                    shape: const CircleBorder(),
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  child: const Text('STL'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    fixedSize: const Size(75, 75),
                    shape: const CircleBorder(),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  child: const Text('1'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    fixedSize: const Size(75, 75),
                    shape: const CircleBorder(),
                  ),
                ),
                ElevatedButton(
                  child: const Text('1'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    fixedSize: const Size(75, 75),
                    shape: const CircleBorder(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
