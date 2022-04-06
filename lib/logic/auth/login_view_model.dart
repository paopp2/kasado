import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/services/auth_service.dart';
import 'package:kasado/logic/shared/view_model.dart';

final loginViewModel = Provider.autoDispose(
  (ref) => LoginViewModel(
    read: ref.read,
    authService: ref.watch(authServiceProvider),
  ),
);

class LoginViewModel extends ViewModel {
  LoginViewModel({
    required Reader read,
    required this.authService,
  }) : super(read);

  final AuthService authService;

  @override
  void initState([Map<String, Object?>? params]) {
    FirebaseAnalytics.instance.logEvent(name: 'login_view');
  }

  Future<void> signInWithGoogle({
    required Function(Exception) ifError,
    required Function(UserCredential?) ifSuccess,
  }) async {
    final authCreds = await authService.signInWithGoogle();
    authCreds.fold(
      (error) {
        print("Mixpanel: ${error.toString()}");
        return ifError(error);
      },
      (creds) {
        print("Mixpanel: Signed in successfully");
        return ifSuccess(creds);
      },
    );
  }

  Future<void> signInWithFacebook() async {
    print("Mixpanel: Sign in with Facebook");
    Fluttertoast.showToast(
      msg: 'Google lng say gamita pre, butngan ra nya namo nig para FB pramis',
    );
  }
}
