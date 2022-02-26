import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/admin/player_manager/player_manager_view_model.dart';
import 'package:kasado/ui/shared/user_search/user_search_pane.dart';

class PlayerManagerView extends HookConsumerWidget {
  const PlayerManagerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(playerManagerViewModel);

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: UserSearchPane(
          onUserTapped: (userInfo) {
            showDialog(
              context: context,
              builder: (_) => const AlertDialog(
                title: Text('Hello'),
              ),
            );
          },
        ),
      ),
    );
  }
}
