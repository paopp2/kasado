import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/auth/login_view_model.dart';

class LoginView extends HookConsumerWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(loginViewModel);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'KASADO',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 200, child: Divider()),
            TextButton(
              onPressed: model.signInWithGoogle,
              child: const Text('Sign in with Google'),
            ),
            TextButton(
              onPressed: () => Fluttertoast.showToast(
                msg:
                    'Google lng say gamita pre, butngan ra nya nako nig para FB pramis',
              ),
              child: const Text('Sign in with Facebook'),
            ),
          ],
        ),
      ),
    );
  }
}
