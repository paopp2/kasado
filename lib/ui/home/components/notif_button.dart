import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/app_router.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/notifs/notifs_state.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

class NotifButton extends HookConsumerWidget {
  const NotifButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserInfo = ref.watch(currentUserInfoProvider).value;

    return (currentUserInfo == null)
        ? const SizedBox()
        : Builder(
            builder: (context) {
              final isSuperAdmin = currentUserInfo.isSuperAdmin;
              final unreadNotifCountStream =
                  ref.watch(unreadUserNotifCountStream(currentUserInfo.id));

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: IconButton(
                  icon: unreadNotifCountStream.when(
                      error: (e, _) => Text(e.toString()),
                      loading: () => const LoadingWidget(),
                      data: (unreadNotifCount) {
                        return Badge(
                          showBadge: unreadNotifCount != 0,
                          badgeContent: Text(
                            unreadNotifCount.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                          child: const Icon(Icons.notifications),
                        );
                      }),
                  onPressed: () => context.pushNamed(
                    Routes.notifsView,
                    extra: {
                      'isSuperAdmin': isSuperAdmin,
                      'userId': currentUserInfo.id,
                    },
                  ),
                ),
              );
            },
          );
  }
}
