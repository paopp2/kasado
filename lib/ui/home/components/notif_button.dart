import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/app_router.dart';
import 'package:kasado/data/core/core_providers.dart';

class NotifButton extends HookConsumerWidget {
  const NotifButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserInfo = ref.watch(currentUserInfoProvider).value;
    final isAdmin = currentUserInfo?.isAdmin;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: IconButton(
        icon: Badge(
          badgeContent: const Text(
            '2',
            style: TextStyle(color: Colors.white),
          ),
          child: const Icon(Icons.notifications),
        ),
        onPressed: () => context.pushNamed(
          Routes.notifsView,
          extra: isAdmin,
        ),
      ),
    );
  }
}
