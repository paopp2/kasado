import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/feedbacks/feedbacks_tec_mixin.dart';
import 'package:kasado/logic/shared/view_model.dart';

final feedbacksViewModel = Provider.autoDispose(
  (ref) => FeedbacksViewModel(read: ref.read),
);

class FeedbacksViewModel extends ViewModel with FeedbacksTecMixin {
  FeedbacksViewModel({
    required Reader read,
  }) : super(read);

  Future<void> pushFeedback() async {}
}
