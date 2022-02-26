import 'package:flutter/material.dart';
import 'package:kasado/ui/shared/data_entry_field.dart';

class UserSearchPane extends StatelessWidget {
  const UserSearchPane({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DataEntryField(hint: 'Search player email'),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, i) {
              return ListTile(
                leading: const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.amber,
                ),
                title: const Text('Name Famname'),
                subtitle: const Text('email0here@gmail.com'),
                onTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}
