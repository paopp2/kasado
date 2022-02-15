import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';

class RootView extends HookConsumerWidget {
  const RootView({
    Key? key,
    required this.loggedInBuilder,
    required this.loggedOutBuilder,
  }) : super(key: key);
  final WidgetBuilder loggedOutBuilder;
  final WidgetBuilder loggedInBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateChanges = ref.watch(authStateChangesProvider);

    return authStateChanges.when(
      data: (user) => _data(context, user),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, __) => Center(child: Text('Error: $e')),
    );
  }

  Widget _data(BuildContext context, User? user) {
    return (user != null)
        ? loggedInBuilder(context)
        : loggedOutBuilder(context);
  }
}
