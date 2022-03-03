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
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemBuilder: (context, i) {
                final isEven = i % 2 == 0;
                return ListTile(
                  contentPadding: const EdgeInsets.all(8),
                  tileColor:
                      (isEven) ? Colors.blue.shade100.withAlpha(50) : null,
                  leading: const CircleAvatar(
                    backgroundColor: Colors.amber,
                    radius: 25,
                  ),
                  title: const Text(
                    'This is the title',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'The quic brown fox umpso ver the lazy doThe quic brown fox umpso ver the lazy doThe quic brown fox umpso ver the lazy doThe quic brown fox umpso ver the lazy doThe quic brown fox umpso ver the lazy doggggg The quic brown fox umpso ver the lazy doThe quic brown fox umpso ver the lazy doThe quic brown fox umpso ver the lazy doThe quic brown fox umpso ver the lazy doThe quic brown fox umpso ver the lazy doggggg',
                      ),
                      Visibility(
                        visible: true,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.thumb_down,
                                color: Colors.red.shade300,
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.thumb_up,
                                color: Colors.green.shade300,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          floatingActionButton: Visibility(
            visible: isAdmin,
            child: FloatingActionButton.extended(
              label: const Text('New notif'),
              icon: const Icon(Icons.add),
              onPressed: () {},
            ),
          ),
        );
      },
    );
  }
}
