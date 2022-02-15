import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';

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
