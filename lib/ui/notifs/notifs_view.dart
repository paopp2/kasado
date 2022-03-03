import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/notifs/notifs_state.dart';
import 'package:kasado/logic/notifs/notifs_view_model.dart';
import 'package:kasado/model/notif/notif.dart';
import 'package:kasado/ui/notifs/components/notif_input_dialog.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

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
                    return ListTile(
                      contentPadding: const EdgeInsets.all(8),
                      tileColor: (notif.isRead)
                          ? null
                          : Colors.blue.shade100.withAlpha(50),
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(notif.sender!.photoUrl!),
                      ),
                      title: Text(
                        notif.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(notif.body),
                          Visibility(
                            visible: notif.needsFeedback,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.thumb_down,
                                    color: Colors.red.shade300,
                                  ),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.thumb_up,
                                    color: Colors.green.shade300,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
