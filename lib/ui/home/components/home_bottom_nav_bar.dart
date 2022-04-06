import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';

class HomeBottomNavBar extends HookConsumerWidget {
  const HomeBottomNavBar({
    Key? key,
    required this.tabController,
    required this.tabIndex,
  }) : super(key: key);

  final TabController tabController;
  final ValueNotifier<int> tabIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserInfo = ref.watch(currentUserInfoProvider).value;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: tabController.animateTo,
      currentIndex: tabIndex.value,
      selectedItemColor: Colors.black,
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Badge(
            badgeColor: Colors.green,
            showBadge: currentUserInfo?.hasTeam ?? false,
            child: const Icon(Icons.group_sharp),
          ),
          label: 'Team',
        ),
        BottomNavigationBarItem(
          icon: Badge(
            badgeColor: Colors.green,
            showBadge: currentUserInfo?.hasReserved ?? false,
            child: const FaIcon(
              FontAwesomeIcons.ticketAlt,
              size: 20,
            ),
          ),
          label: 'Tickets',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
