import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/helpers/firestore_helper.dart';
import 'package:kasado/data/helpers/firestore_path.dart';
import 'package:kasado/model/feedback/feedback.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';

final feedbacksRepositoryProvider = Provider.autoDispose(
  (ref) => FeedbacksRepository(firestoreHelper: FirestoreHelper.instance),
);

class FeedbacksRepository {
  FeedbacksRepository({required this.firestoreHelper});
  final FirestoreHelper firestoreHelper;

  Future<void> pushFeedback(Feedback feedback) async {
    await firestoreHelper.setData(
      path: FirestorePath.docFeedbacks(feedback.id),
      data: feedback.toJson(),
    );
  }

  Stream<List<Feedback>> getFeedbacksStream([KasadoUser? user]) {
    return firestoreHelper.collectionStream(
      path: FirestorePath.colFeedbacks(),
      builder: (data, _) => Feedback.fromJson(data),
      queryBuilder: (query) {
        final modifiedQuery = (user != null)
            ? query.where('sender.id', isEqualTo: user.id)
            : query;

        return modifiedQuery.orderBy(
          'sentAt',
          descending: true,
        );
      },
    );
  }
}
