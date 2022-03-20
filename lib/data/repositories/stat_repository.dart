import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/helpers/firestore_helper.dart';

final statRepositoryProvider = Provider.autoDispose(
  (ref) => StatRepository(
    firestoreHelper: FirestoreHelper.instance,
  ),
);

class StatRepository {
  StatRepository({
    required this.firestoreHelper,
  });

  final FirestoreHelper firestoreHelper;
}
