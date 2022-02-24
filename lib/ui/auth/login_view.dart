import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/auth/login_view_model.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

class LoginView extends HookConsumerWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggingInState = useState(false);
    final model = ref.watch(loginViewModel);

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Kasado',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.2,
                child: Visibility(
                  visible: isLoggingInState.value,
                  child: const Center(
                    child: LoadingWidget(),
                  ),
                ),
              ),
              const SizedBox(width: 200, child: Divider()),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: constraints.maxWidth * 0.7,
                child: SignInButton(
                  Buttons.Google,
                  onPressed: () async {
                    isLoggingInState.value = true;
                    await model.signInWithGoogle();
                  },
                  elevation: 10,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: const EdgeInsets.all(5.0),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: constraints.maxWidth * 0.7,
                child: SignInButton(
                  Buttons.FacebookNew,
                  onPressed: () => Fluttertoast.showToast(
                    msg:
                        'Google lng say gamita pre, butngan ra nya nako nig para FB pramis',
                  ),
                  elevation: 10,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: const EdgeInsets.all(8.0),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
