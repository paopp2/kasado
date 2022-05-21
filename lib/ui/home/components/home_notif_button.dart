import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/app_router.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/notifs/notifs_state.dart';

class HomeNotifButton extends HookConsumerWidget {
  const HomeNotifButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserInfo = ref.watch(currentUserInfoProvider).value;

    useEffect(() {
      // User's age set here (for analytics) since this is where the
      // userInfo is first read by the app
      final userBirthdate = currentUserInfo?.user.userBio?.birthdate;
      if (userBirthdate != null) {
        final ageDuration = DateTime.now().difference(userBirthdate);
        final ageInYears = ageDuration.inDays ~/ 365;
        ref.read(mixpanel)!.getPeople().set('age', ageInYears);
      }

      return;
    }, [currentUserInfo]);

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
                      loading: () => const Icon(Icons.notifications),
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
