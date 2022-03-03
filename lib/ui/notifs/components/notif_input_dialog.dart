import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/notifs/notifs_state.dart';
import 'package:kasado/logic/notifs/notifs_view_model.dart';
import 'package:kasado/ui/shared/data_entry_field.dart';

class NotifInputDialog extends HookConsumerWidget {
  const NotifInputDialog({
    Key? key,
    required this.model,
  }) : super(key: key);

  final NotifsViewModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isYesNoEnabled = ref.watch(isYesNoEnabledProvider);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: ListView(
        shrinkWrap: true,
        children: [
          DataEntryField(
            hint: 'Title',
            tec: model.tecNotifTitle,
          ),
          DataEntryField(
            hint: 'Body',
            tec: model.tecNotifBody,
            maxLines: 10,
          ),
          FilterChip(
            label: const Text('Get yes/no feedback'),
            onSelected: model.setYesNoFeedbackEnabled,
            selected: isYesNoEnabled,
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: model.pushNotifications,
            child: const Text('PUSH NOTIF'),
          ),
        ],
      ),
    );
  }
}
