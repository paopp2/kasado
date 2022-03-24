import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/feedbacks/feedbacks_view_model.dart';
import 'package:kasado/ui/feedbacks/components/feedback_input_dialog.dart';

class FeedbacksView extends HookConsumerWidget {
  const FeedbacksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);
    final currentUserInfo = ref.watch(currentUserInfoProvider);
    final model = ref.watch(feedbacksViewModel);

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
                    child: ListView.builder(
                      itemBuilder: (context, i) {
                        return ListTile(title: Text("INdex $i"));
                      },
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
                builder: (_) => FeedbackInputDialog(
                  model: model,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
