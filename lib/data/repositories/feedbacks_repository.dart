import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/helpers/firestore_helper.dart';

final feedbacksRepositoryProvider = Provider.autoDispose(
  (ref) => FeedbacksRepository(firestoreHelper: FirestoreHelper.instance),
);

class FeedbacksRepository {
  FeedbacksRepository({required this.firestoreHelper});
  final FirestoreHelper firestoreHelper;
}
