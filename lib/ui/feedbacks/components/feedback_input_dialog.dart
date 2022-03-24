import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/feedbacks/feedbacks_view_model.dart';
import 'package:kasado/ui/shared/data_entry_field.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

class FeedbackInputDialog extends HookConsumerWidget {
  const FeedbackInputDialog({
    Key? key,
    required this.model,
  }) : super(key: key);

  final FeedbacksViewModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoadingState = useState(false);

    useEffect(() {
      // Clear TECs on dialog closed
      return model.clearAllTecs;
    }, []);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: model.feedbackInputFormKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              DataEntryField(
                validator: null,
                hint: 'Title',
                tec: model.tecFeedbackTitle,
              ),
              DataEntryField(
                hint: 'Body',
                tec: model.tecFeedbackBody,
                maxLines: 10,
              ),
              const SizedBox(height: 20),
              (isLoadingState.value)
                  ? const LoadingWidget()
                  : TextButton(
                      onPressed: () async {
                        isLoadingState.value = true;
                        await model.pushFeedback(context);
                        isLoadingState.value = false;
                      },
                      child: Text(
                        'SEND FEEDBACK',
                        style: TextStyle(color: Colors.green.shade500),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
