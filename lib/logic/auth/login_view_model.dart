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

  Future<void> signInWithGoogle() async {
    final authCreds = await authService.signInWithGoogle();
    authCreds.fold((error) => Fluttertoast.showToast(msg: error.toString()),
        (creds) {
      if (creds != null) {
        Fluttertoast.showToast(msg: 'Signed in successfully');
      }
    });
  }
}
