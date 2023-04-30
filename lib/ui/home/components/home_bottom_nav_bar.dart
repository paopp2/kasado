import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeBottomNavBar extends StatelessWidget {
  const HomeBottomNavBar({
    Key? key,
    required this.pageController,
    required this.pageIndex,
  }) : super(key: key);

  final PageController pageController;
  final ValueNotifier<int> pageIndex;

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      onTap: (i) => pageController.animateToPage(
        i,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      ),
      currentIndex: pageIndex.value,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      items: [
        SalomonBottomBarItem(
          icon: const Icon(Icons.home),
          title: const Text('Home'),
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.group_sharp),
          title: const Text('Team'),
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.bar_chart),
          title: const Text('Rankings'),
        ),
        SalomonBottomBarItem(
          icon: const FaIcon(
            FontAwesomeIcons.ticketSimple,
            size: 20,
          ),
          title: const Text('Tickets'),
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.person),
          title: const Text('Profile'),
        ),
      ],
    );
  }
}
