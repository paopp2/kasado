import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/feedbacks/feedbacks_state.dart';
import 'package:kasado/logic/feedbacks/feedbacks_view_model.dart';
import 'package:kasado/ui/feedbacks/components/feedback_input_dialog.dart';
import 'package:kasado/ui/shared/loading_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class FeedbacksView extends HookConsumerWidget {
  const FeedbacksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(feedbacksViewModel);
    final currentUserInfo = ref.watch(currentUserInfoProvider);
    final isSuperAdmin = currentUserInfo.value?.isSuperAdmin ?? false;
    final feedbacksStream = ref.watch(feedbacksStreamProvider(isSuperAdmin));

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        'FEEDBACKS AND SUGGESTIONS',
                        style: TextStyle(
                          fontSize: constraints.maxWidth * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text('Only you will be able to see your feedbacks'),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: feedbacksStream.when(
                      error: (e, _) => Text(e.toString()),
                      loading: () => const LoadingWidget(),
                      data: (feedbacks) => (feedbacks.isEmpty)
                          ? const Center(
                              child: Text("You have no feedbacks yet"),
                            )
                          : ListView.builder(
                              itemCount: feedbacks.length,
                              itemBuilder: (context, i) {
                                final feedback = feedbacks[i];
                                return ListTile(
                                  leading: (isSuperAdmin)
                                      ? CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            feedback.sender!.photoUrl!,
                                          ),
                                        )
                                      : null,
                                  title: Row(
                                    children: [
                                      Text(
                                        (feedback.title.isEmpty)
                                            ? 'Untitled'
                                            : feedback.title,
                                      ),
                                      const Spacer(),
                                      Text(
                                        timeago.format(
                                          feedback.sentAt,
                                          locale: 'en_short',
                                        ),
                                        style: const TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                                  subtitle: Text(feedback.body),
                                );
                              },
                            ),
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton.extended(
              label: const Text('New Feedback'),
              icon: const Icon(Icons.add),
              onPressed: () => showDialog(
                context: context,
                builder: (_) => FeedbackInputDialog(model: model),
              ),
            ),
          );
        },
      ),
    );
  }
}
