import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/notifs/notifs_state.dart';
import 'package:kasado/logic/notifs/notifs_view_model.dart';
import 'package:kasado/model/notif/notif.dart';

class NotifFeedbackRow extends HookConsumerWidget {
  const NotifFeedbackRow({
    Key? key,
    required this.model,
    required this.userId,
    required this.notif,
  }) : super(key: key);

  final NotifsViewModel model;
  final String userId;
  final Notif notif;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final yesCount = ref.watch(notifYesCountStreamProvider(notif.id)).when(
          data: (yesCount) => yesCount.toString(),
          error: (e, _) => e.toString(),
          loading: () => '',
        );
    final noCount = ref.watch(notifNoCountStreamProvider(notif.id)).when(
          data: (yesCount) => yesCount.toString(),
          error: (e, _) => e.toString(),
          loading: () => '',
        );
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                Icons.thumb_down,
                color: Colors.red.shade300,
              ),
              onPressed: () => model.setFeedback(
                notif: notif,
                isPositive: false,
              ),
            ),
            Text(noCount),
          ],
        ),
        Column(
          children: [
            IconButton(
              icon: Icon(
                Icons.thumb_up,
                color: Colors.green.shade300,
              ),
              onPressed: () => model.setFeedback(
                notif: notif,
                isPositive: true,
              ),
            ),
            Text(yesCount),
          ],
        ),
      ],
    );
  }
}
