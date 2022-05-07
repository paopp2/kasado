import 'package:algolia/algolia.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/helpers/firestore_helper.dart';
import 'package:kasado/data/helpers/firestore_path.dart';
import 'package:kasado/data/repositories/user_info_repository.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

final appMetaStreamProvider = StreamProvider.autoDispose((ref) {
  final firestoreHelper = FirestoreHelper.instance;

  return firestoreHelper.documentStream(
    path: FirestorePath.docAppMeta(),
    builder: (data, docId) => data,
  );
});

final fireauthProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final authStateChangesProvider = StreamProvider<User?>(
    (ref) => ref.watch(fireauthProvider).authStateChanges());

final currentUserProvider = Provider.autoDispose<KasadoUser?>((ref) {
  User? firebaseUser = ref.watch(fireauthProvider).currentUser;

  if (firebaseUser == null) return null;

  return KasadoUser(
    id: firebaseUser.uid,
    displayName: firebaseUser.displayName,
    email: firebaseUser.email,
    phoneNumber: firebaseUser.phoneNumber,
    photoUrl: firebaseUser.photoURL,
  );
});

final currentUserInfoProvider = StreamProvider.autoDispose<KasadoUserInfo?>(
  (ref) async* {
    final firebaseUser = ref.watch(fireauthProvider).currentUser;
    if (firebaseUser != null) {
      final userInfoStream = ref
          .watch(userInfoRepositoryProvider)
          .getUserInfoStream(firebaseUser.uid);
      await for (final userInfo in userInfoStream) {
        yield userInfo;
      }
    } else {
      yield null;
    }
  },
);

// Mixpanel instance for analytics
final mixpanel = Provider<Mixpanel?>((ref) => null);

// Algolia instance for search
final algolia = Provider<Algolia>(
  (ref) => const Algolia.init(
    applicationId: "RQ51X9HY3C",
    apiKey: "295776bbbf946adbe75ff6a9c29a7db1",
  ),
);
