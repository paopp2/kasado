import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/notifs/notifs_state.dart';
import 'package:kasado/logic/notifs/notifs_view_model.dart';
import 'package:kasado/model/notif/notif.dart';
import 'package:kasado/ui/notifs/components/notif_input_dialog.dart';
import 'package:kasado/ui/shared/loading_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotifsView extends HookConsumerWidget {
  const NotifsView({
    Key? key,
    required this.userId,
    this.isAdmin = false,
  }) : super(key: key);

  final bool isAdmin;
  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(notifsViewModel);
    final userNotifsStream = ref.watch(userNotifsStreamProvider(userId));

    useEffect(() {
      model.initState();
      return model.dispose;
    }, []);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: userNotifsStream.when(
              error: (e, _) => Text(e.toString()),
              loading: () => const LoadingWidget(),
              data: (userNotifs) {
                return ListView.builder(
                  itemCount: userNotifs.length,
                  itemBuilder: (context, i) {
                    final notif = userNotifs[i];
                    notif as NotifObject;
                    return Column(
                      children: [
                        ListTile(
                          contentPadding: const EdgeInsets.all(8),
                          tileColor: (notif.isRead)
                              ? null
                              : Colors.blue.shade100.withAlpha(50),
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(
                              notif.sender!.photoUrl!,
                            ),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  notif.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                timeago.format(
                                  notif.sentAt,
                                  locale: 'en_short',
                                ),
                                style: const TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                          subtitle: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(notif.body),
                              Visibility(
                                visible: notif.needsFeedback && !notif.isRead,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.thumb_down,
                                        color: Colors.red.shade300,
                                      ),
                                      onPressed: () => model.setFeedback(
                                        userId: userId,
                                        notif: notif,
                                        isPositive: false,
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.thumb_up,
                                        color: Colors.green.shade300,
                                      ),
                                      onPressed: () => model.setFeedback(
                                        userId: userId,
                                        notif: notif,
                                        isPositive: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: constraints.maxWidth * 0.8,
                          child: const Divider(),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          floatingActionButton: Visibility(
            visible: isAdmin,
            child: FloatingActionButton.extended(
              label: const Text('New notif'),
              icon: const Icon(Icons.add),
              onPressed: () => showDialog(
                context: context,
                builder: (_) => NotifInputDialog(model: model),
              ).then((_) => model.clearAllTecs()),
            ),
          ),
        );
      },
    );
  }
}
