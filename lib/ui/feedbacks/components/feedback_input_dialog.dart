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

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: ListView(
        shrinkWrap: true,
        children: const [
          DataEntryField(
            hint: 'Title',
            // tec: model.tecNotifTitle,
          ),
          DataEntryField(
            hint: 'Body',
            // tec: model.tecNotifBody,
            maxLines: 10,
          ),
          SizedBox(height: 20),
          // (isLoadingState.value)
          //     ? const LoadingWidget()
          //     : TextButton(
          //         onPressed: () async {
          //           isLoadingState.value = true;
          //           await model.pushNotifications(context);
          //           isLoadingState.value = false;
          //         },
          //         child: const Text('PUSH NOTIF'),
          //       ),
        ],
      ),
    );
  }
}
