import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/app_router.dart';
import 'package:kasado/constants/current_app_meta.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/home/home_view_model.dart';

class UserInfoDrawer extends HookConsumerWidget {
  const UserInfoDrawer({
    Key? key,
    required this.constraints,
    required this.model,
  }) : super(key: key);

  final BoxConstraints constraints;
  final HomeViewModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);
    final currentUserInfoStream = ref.watch(currentUserInfoProvider);
    final isCurrentUserAdmin = currentUserInfoStream.value?.isAdmin ?? false;

    return Drawer(
      child: (currentUser == null)
          ? const Center(child: Text("No user"))
          : Column(
              children: [
                Container(
                  height: constraints.maxHeight * 0.3,
                  width: constraints.maxWidth * 0.85,
                  color: const Color(0xfff5f5f5),
                  padding: EdgeInsets.only(
                    left: constraints.maxWidth * 0.05,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: constraints.maxHeight * 0.03,
                        ),
                        child: CircleAvatar(
                          backgroundColor: const Color(0xFF5F45A4),
                          radius: 48,
                          child: CircleAvatar(
                            radius: 45,
                            backgroundImage:
                                NetworkImage(currentUser.photoUrl!),
                          ),
                        ),
                      ),
                      Text(
                        currentUser.displayName!,
                        overflow: TextOverflow.fade,
                        softWrap: false,
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(currentUser.email!),
                    ],
                  ),
                ),
                Visibility(
                  visible: isCurrentUserAdmin,
                  child: ListTile(
                    onTap: () => context.pushNamed(Routes.courtsOwnedView),
                    title: const Text('Manage courts'),
                    leading: const Icon(Icons.settings),
                  ),
                ),
                ListTile(
                  onTap: model.signOut,
                  title: const Text('Logout'),
                  leading: const Icon(Icons.logout),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onLongPress: () => context.pushNamed(
                      Routes.courtsOwnedView,
                    ),
                    child: const Text(currentVersion),
                  ),
                ),
              ],
            ),
    );
  }
}
