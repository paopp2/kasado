import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kasado/app_router.dart';

class NotifButton extends StatelessWidget {
  const NotifButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        onPressed: () => context.pushNamed(Routes.courtsOwnedView),
      ),
    );
  }
}
