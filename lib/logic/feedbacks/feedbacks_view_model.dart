import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/data/repositories/feedbacks_repository.dart';
import 'package:kasado/logic/feedbacks/feedbacks_tec_mixin.dart';
import 'package:kasado/logic/shared/view_model.dart';
import 'package:kasado/model/feedback/feedback.dart' as kasado;
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:uuid/uuid.dart';

final feedbacksViewModel = Provider.autoDispose(
  (ref) => FeedbacksViewModel(
    read: ref.read,
    feedbacksRepo: ref.watch(feedbacksRepositoryProvider),
    currentUser: ref.watch(currentUserProvider)!,
  ),
);

class FeedbacksViewModel extends ViewModel with FeedbacksTecMixin {
  FeedbacksViewModel({
    required Reader read,
    required this.feedbacksRepo,
    required this.currentUser,
  }) : super(read);

  final FeedbacksRepository feedbacksRepo;
  final KasadoUser currentUser;
  final feedbackInputFormKey = GlobalKey<FormState>();

  @override
  Future<void> initState([Map<String, Object?>? params]) async {
    FirebaseAnalytics.instance.logEvent(name: 'feedbacks_view');
  }

  Future<void> pushFeedback(BuildContext context) async {
    if (feedbackInputFormKey.currentState!.validate()) {
      await feedbacksRepo.pushFeedback(
        kasado.Feedback(
          id: const Uuid().v4(),
          sender: currentUser,
          sentAt: DateTime.now(),
          title: tecFeedbackTitle.text,
          body: tecFeedbackBody.text,
        ),
      );
      Navigator.pop(context);
    }
  }
}
