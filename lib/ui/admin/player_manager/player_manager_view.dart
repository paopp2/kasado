import 'package:flutter/material.dart';
import 'package:kasado/ui/shared/user_search/user_search_pane.dart';

class PlayerManagerView extends StatelessWidget {
  const PlayerManagerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: UserSearchPane(
          onUserTapped: (userInfo) => print(userInfo.id),
        ),
      ),
    );
  }
}
