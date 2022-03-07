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
    required this.notifId,
  }) : super(key: key);

  final NotifsViewModel model;
  final String userId;
  final String notifId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNotifStream = ref.watch(userNotifStreamProvider(notifId));
    final notifMetaStream = ref.watch(notifMetaStreamProvider(notifId));

    return userNotifStream.when(
      error: (e, _) => Text(e.toString()),
      loading: () => const SizedBox(),
      data: (userNotif) {
        userNotif as NotifObject;
        final isLiked = userNotif.hasLiked;
        return notifMetaStream.when(
          error: (e, _) => Text(e.toString()),
          loading: () => const SizedBox(),
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
                          // If user responded 👎
                          (isLiked == false)
                              ? Icons.thumb_down
                              : Icons.thumb_down_outlined,
                          color: Colors.red.shade300,
                        ),
                        onPressed: () => model.onDislikePressed(
                          notif: userNotif,
                          notifMeta: notifMeta!,
                          wasLiked: userNotif.hasLiked,
                        ),
                      ),
                      Text(notifMeta?.noCount.toString() ?? '0'),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          // If user responded 👍
                          (isLiked == true)
                              ? Icons.thumb_up
                              : Icons.thumb_up_outlined,
                          color: Colors.green.shade300,
                        ),
                        onPressed: () => model.onLikePressed(
                          notif: userNotif,
                          notifMeta: notifMeta!,
                          wasLiked: userNotif.hasLiked,
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
      },
    );
  }
}
