import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/auth/login_view_model.dart';
import 'package:kasado/ui/auth/components/login_error_dialog.dart';
import 'package:kasado/ui/shared/loading_widget.dart';
import 'package:sign_button/sign_button.dart';
import 'package:go_router/go_router.dart';
import 'package:kasado/app_router.dart';

class LoginView extends HookConsumerWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangesProvider);
    final isLoggingInState = useState(false);
    final model = ref.watch(loginViewModel);

    useEffect(() {
      ref.read(mixpanel)!.track("Navigated to LoginView");
      model.initState();

      return model.dispose;
    }, []);

    Future<void> _onSignInWithGooglePressed() async {
      isLoggingInState.value = true;
      await model.signInWithGoogle(
        ifError: (e) => showDialog(
          context: context,
          builder: (_) => const LoginErrorDialog(),
        ),
        ifSuccess: (creds) {
          if (creds != null) {
            context.pushReplacementNamed(Routes.homeView);
            Fluttertoast.showToast(
              msg: 'Signed in successfully',
            );
          }
        },
      );
      isLoggingInState.value = false;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Center(
            // While app is still retrieving authState, the LoginView is shown to
            // the user. To prevent the user from logging-in while the app is
            // still retrieving authState, show LoadingWidget
            child: authState.when(
              error: (e, _) => Text(e.toString()),
              loading: () => const LoadingWidget(),
              data: (user) => (user != null)
                  ? const SizedBox()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: constraints.maxHeight * 0.3,
                          child: Image.asset(
                            'assets/images/logo/kasado_logo_v2.png',
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.1,
                          child: (isLoggingInState.value)
                              ? const LoadingWidget()
                              : const Text(
                                  'Kasado',
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.grey,
                                  ),
                                ),
                        ),
                        const SizedBox(width: 200, child: Divider()),
                        const SizedBox(height: 20),
                        SignInButton(
                          buttonType: ButtonType.google,
                          buttonSize: ButtonSize.large,
                          width: constraints.maxWidth * 0.7,
                          padding: 10.0,
                          btnTextColor: Colors.grey.shade600,
                          onPressed: _onSignInWithGooglePressed,
                          elevation: 10.0,
                        ),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}
