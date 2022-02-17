import 'package:flutter/material.dart';
import 'package:kasado/model/court/court.dart';

class CourtAdminsPanel extends StatelessWidget {
  const CourtAdminsPanel({
    Key? key,
    required this.court,
  }) : super(key: key);

  final Court court;

  @override
  Widget build(BuildContext context) {
    final admins = court.admins;
    return ListView.builder(
      itemCount: admins.length,
      itemBuilder: (context, i) {
        final admin = admins[i];
        return ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(admin.photoUrl!),
          ),
          title: Text(admin.displayName!),
        );
      },
    );
  }
}
