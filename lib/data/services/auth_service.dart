import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';

final authServiceProvider = Provider.autoDispose(
  (ref) => AuthService(
    ref.read,
    GoogleSignIn(),
  ),
);

class AuthService {
  AuthService(this.read, this.googleSignIn);
  final Reader read;
  final GoogleSignIn googleSignIn;

  Future<Either<Exception, UserCredential?>> signInWithGoogle() async {
    try {
      final googleSignInAcc = await googleSignIn.signIn();

      // Cancelled sign-in
      if (googleSignInAcc == null) return const Right(null);

      final googleSignInAuth = await googleSignInAcc.authentication;
      final googleAuthCreds = GoogleAuthProvider.credential(
        accessToken: googleSignInAuth.accessToken,
        idToken: googleSignInAuth.idToken,
      );
      final signedInUserCreds =
          await read(fireauthProvider).signInWithCredential(googleAuthCreds);

      return Right(signedInUserCreds);
    } catch (e) {
      return Left(e as Exception);
    }
  }

  Future<void> signOutGoogle() async {
    await googleSignIn.signOut();
    await read(fireauthProvider).signOut();
  }
}
