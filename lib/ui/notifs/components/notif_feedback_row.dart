import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/notifs/notifs_state.dart';
import 'package:kasado/logic/notifs/notifs_view_model.dart';
import 'package:kasado/model/notif/notif.dart';
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
    final userNotifStream = ref.watch(userNotifStreamProvider(notifId));
    final notifMetaStream = ref.watch(notifMetaStreamProvider(notifId));
    final hasLikeBeenPressed = useState(false);
    final hasDislikeBeenPressed = useState(false);

    return userNotifStream.when(
      error: (e, _) => Text(e.toString()),
      loading: () => const LoadingWidget(),
      data: (userNotif) {
        userNotif as NotifObject;
        final isLiked = userNotif.hasLiked;
        hasLikeBeenPressed.value = isLiked ?? false;
        hasDislikeBeenPressed.value = !(isLiked ?? true);
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
                        icon:
                            // If user responded 👎
                            (hasDislikeBeenPressed.value)
                                ? const Icon(
                                    Icons.thumb_down,
                                    color: Colors.red,
                                  )
                                : Icon(
                                    Icons.thumb_down_outlined,
                                    color: Colors.red.shade300,
                                  ),
                        onPressed: () => model.onDislikePressed(
                          notif: userNotif,
                          notifMeta: notifMeta!,
                          hasBeenPressed: hasDislikeBeenPressed,
                          hasLikeBeenPressed: hasLikeBeenPressed,
                        ),
                      ),
                      Text(notifMeta?.noCount.toString() ?? '0'),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon:
                            // If user responded 👍
                            (hasLikeBeenPressed.value)
                                ? const Icon(
                                    Icons.thumb_up,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.thumb_up_outlined,
                                    color: Colors.green.shade300,
                                  ),
                        onPressed: () => model.onLikePressed(
                          notif: userNotif,
                          notifMeta: notifMeta!,
                          hasBeenPressed: hasLikeBeenPressed,
                          hasDislikeBeenPressed: hasDislikeBeenPressed,
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
