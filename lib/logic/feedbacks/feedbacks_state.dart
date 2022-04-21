import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/data/repositories/feedbacks_repository.dart';
import 'package:kasado/model/feedback/feedback.dart';

final feedbacksStreamProvider = StreamProvider.autoDispose
    .family<List<Feedback>, bool>((ref, isSuperAdmin) {
  final feedbacksRepo = ref.watch(feedbacksRepositoryProvider);

  return (isSuperAdmin)
      // Get all feedbacks
      ? feedbacksRepo.getFeedbacksStream()
      // Get one's own feedbacks only
      : feedbacksRepo.getFeedbacksStream(ref.watch(currentUserProvider)!);
});
