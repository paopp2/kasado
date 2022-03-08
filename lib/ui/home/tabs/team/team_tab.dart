import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/home/team_tab_model.dart';
import 'package:kasado/ui/home/tabs/team/components/team_invite_dialog.dart';

class TeamTab extends HookConsumerWidget {
  const TeamTab({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(teamTabModel);

    return Scaffold(
      body: const Center(
        child: Text('You currently do not have a team'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Build a team'),
        icon: const Icon(Icons.group),
        onPressed: () => showDialog(
          context: context,
          builder: (_) => TeamInviteDialog(
            constraints: constraints,
            model: model,
          ),
        ),
      ),
    );
  }
}
