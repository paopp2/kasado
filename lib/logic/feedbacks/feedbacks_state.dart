import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/repositories/feedbacks_repository.dart';

final feedbacksStreamProvider = StreamProvider.autoDispose((ref) {
  final feedbacksRepo = ref.watch(feedbacksRepositoryProvider);
  return feedbacksRepo.getFeedbacksStream();
});
