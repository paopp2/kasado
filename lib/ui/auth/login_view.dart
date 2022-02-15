import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text('Sign in with Google'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Sign in with Facebook'),
            ),
          ],
        ),
      ),
    );
  }
}
