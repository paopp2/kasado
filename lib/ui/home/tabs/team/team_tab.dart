import 'package:flutter/material.dart';
import 'package:kasado/ui/shared/user_search/user_search_pane.dart';

class TeamTab extends StatelessWidget {
  const TeamTab({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('You currently do not have a team'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Build a team'),
        icon: const Icon(Icons.group),
        onPressed: () => showDialog(
          context: context,
          builder: (_) => TeamInviteDialog(constraints: constraints),
        ),
      ),
    );
  }
}

class TeamInviteDialog extends StatelessWidget {
  const TeamInviteDialog({
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
      child: Column(
        children: [
          SizedBox(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 25,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 25,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 25,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 25,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 25,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 25,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 25,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 25,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 25,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 25,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Expanded(child: UserSearchPane()),
          TextButton(
            onPressed: () {},
            child: const Text(
              'BUILD TEAM',
              style: TextStyle(color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}
