import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/data/services/auth_service.dart';
import 'package:kasado/logic/shared/view_model.dart';

final loginViewModel = Provider.autoDispose(
  (ref) => LoginViewModel(
    ref: ref,
    authService: ref.watch(authServiceProvider),
  ),
);

class LoginViewModel extends ViewModel {
  LoginViewModel({
    required Ref ref,
    required this.authService,
  }) : super(ref);

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
        ref.read(mixpanel)!.track(
          "Sign in attempt",
          properties: {"success": false, "error": error.toString()},
        );

        return ifError(error);
      },
      (creds) {
        ref.read(mixpanel)!.track(
          "Sign in attempt",
          properties: {"success": true, "provider": "Google"},
        );

        return ifSuccess(creds);
      },
    );
  }

  Future<void> signInWithFacebook() async {
    ref.read(mixpanel)!.track(
      "Sign in attempt",
      properties: {"success": false, "provider": "Facebook"},
    );
    Fluttertoast.showToast(
      msg: 'Google lng say gamita pre, butngan ra nya namo nig para FB pramis',
    );
  }
}
