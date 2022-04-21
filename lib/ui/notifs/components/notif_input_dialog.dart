import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/notifs/notifs_state.dart';
import 'package:kasado/logic/notifs/notifs_view_model.dart';
import 'package:kasado/ui/shared/data_entry_field.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

class NotifInputDialog extends HookConsumerWidget {
  const NotifInputDialog({
    Key? key,
    required this.model,
  }) : super(key: key);

  final NotifsViewModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isYesNoEnabled = ref.watch(isYesNoEnabledProvider);
    final isLoadingState = useState(false);

    Future<void> _onPushNotifPressed() async {
      isLoadingState.value = true;
      await model.pushNotifications(context);
      isLoadingState.value = false;
    }

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
          (isLoadingState.value)
              ? const LoadingWidget()
              : TextButton(
                  child: const Text('PUSH NOTIF'),
                  onPressed: _onPushNotifPressed,
                ),
        ],
      ),
    );
  }
}
