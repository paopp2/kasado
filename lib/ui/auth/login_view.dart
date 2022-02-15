import 'package:flutter/material.dart';
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
            TextButton(
              onPressed: model.signInWithGoogle,
              child: const Text('Sign in with Google'),
            ),
            TextButton(
              onPressed: model.signOut,
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
