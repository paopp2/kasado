import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/notifs/notifs_state.dart';
import 'package:kasado/logic/notifs/notifs_view_model.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

class NotifFeedbackRow extends HookConsumerWidget {
  const NotifFeedbackRow({
    Key? key,
    required this.model,
    required this.userId,
    required this.notifId,
  }) : super(key: key);

  final NotifsViewModel model;
  final String userId;
  final String notifId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifMetaStream = ref.watch(notifMetaStreamProvider(notifId));

    return notifMetaStream.when(
      error: (e, _) => Text(e.toString()),
      loading: () => const LoadingWidget(),
      data: (notifMeta) {
        return Visibility(
          visible: notifMeta?.needsFeedback ?? false,
          child: Row(
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
                      notif: notifMeta!,
                      isPositive: false,
                    ),
                  ),
                  Text(notifMeta?.noCount.toString() ?? '0'),
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
                      notif: notifMeta!,
                      isPositive: true,
                    ),
                  ),
                  Text(notifMeta?.yesCount.toString() ?? '0'),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
