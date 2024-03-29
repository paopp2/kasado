import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/app_router.dart';
import 'package:kasado/constants/current_app_meta.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/home/home_view_model.dart';
import 'package:kasado/ui/home/components/pondo_info_dialog.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

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

    useEffect(() {
      ref.read(mixpanel)!.track("Opened UserInfoDrawer");

      return;
    }, []);

    return Drawer(
      child: (currentUser == null)
          ? const Center(child: Text("No user"))
          : currentUserInfoStream.when(
              error: (e, _) => Text(e.toString()),
              loading: () => const LoadingWidget(),
              data: (userInfo) {
                final isCurrentUserAdmin = userInfo!.isAdmin;

                return Column(
                  children: [
                    Container(
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
                              backgroundColor: Colors.blueGrey,
                              radius: 48,
                              child: CircleAvatar(
                                radius: 45,
                                backgroundImage: NetworkImage(
                                  currentUser.photoUrl!,
                                ),
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
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('PONDO: ${userInfo.pondo} Php'),
                              TextButton(
                                child: const Text(
                                  'ADD',
                                  style: TextStyle(color: Colors.green),
                                ),
                                onPressed: () => showDialog(
                                  context: context,
                                  builder: (_) => const PondoInfoDialog(),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: isCurrentUserAdmin,
                      child: ListTile(
                        title: const Text('Manage courts'),
                        leading: const Icon(Icons.settings),
                        onTap: () => context.pushNamed(Routes.courtsOwnedView),
                      ),
                    ),
                    ListTile(
                      title: const Text('Give feedback'),
                      leading: const Icon(Icons.feedback),
                      onTap: () => context.pushNamed(Routes.feedbacksView),
                    ),
                    ListTile(
                      title: const Text('Logout'),
                      leading: const Icon(Icons.logout),
                      onTap: () async {
                        await model.signOut();
                        context.pushReplacementNamed(Routes.loginView);
                      },
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
                );
              },
            ),
    );
  }
}
