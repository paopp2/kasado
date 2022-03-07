import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/constants/current_app_meta.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/home/home_view_model.dart';
import 'package:kasado/ui/home/components/home_notif_button.dart';
import 'package:kasado/ui/home/components/user_info_drawer.dart';
import 'package:kasado/ui/home/tabs/home/home_tab.dart';
import 'package:kasado/ui/home/tabs/profile/profile_tab.dart';
import 'package:kasado/ui/home/tabs/ticket/ticket_tab.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = useState(0);
    final tabController = useTabController(initialLength: 4);
    final model = ref.watch(homeViewModel);
    final appMetaStream = ref.watch(appMetaStreamProvider);

    useEffect(() {
      tabController.addListener(() => (tabIndex.value = tabController.index));
      model.initState();
      return model.dispose;
    }, []);

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            drawer: UserInfoDrawer(
              constraints: constraints,
              model: model,
            ),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              actions: const [HomeNotifButton()],
            ),
            body: TabBarView(
              controller: tabController,
              children: [
                appMetaStream.when(
                  loading: () => const LoadingWidget(),
                  error: (e, _) => Text(e.toString()),
                  data: (a) =>
                      // If currentVersion is >= to the allowed version then
                      // allow continuation of usage. If not then prompt
                      // user to update
                      (currentVersion.compareTo(a?['currentVer'] ?? '') >= 0)
                          ? HomeTab(
                              model: model,
                              constraints: constraints,
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Please update to version ${a?['currentVer']}',
                                ),
                                const Text(
                                  '(Try daw exit sa app nya sud balik)',
                                ),
                              ],
                            ),
                ),
                const Center(child: Text('Team invites coming soon')),
                TicketTab(constraints: constraints),
                ProfileTab(constraints: constraints),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
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
                    showBadge: false,
                    child: const Icon(Icons.group_sharp),
                  ),
                  label: 'Team',
                ),
                BottomNavigationBarItem(
                  icon: Badge(
                    badgeColor: Colors.green,
                    showBadge: false,
                    child: const FaIcon(
                      FontAwesomeIcons.ticketAlt,
                      size: 20,
                    ),
                  ),
                  label: 'Ticket',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
