import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/constants/current_app_meta.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/home/home_view_model.dart';
import 'package:kasado/ui/home/components/home_bottom_nav_bar.dart';
import 'package:kasado/ui/home/components/home_notif_button.dart';
import 'package:kasado/ui/home/components/user_info_drawer.dart';
import 'package:kasado/ui/home/tabs/home/home_tab.dart';
import 'package:kasado/ui/home/tabs/profile/profile_tab.dart';
import 'package:kasado/ui/home/tabs/team/team_tab.dart';
import 'package:kasado/ui/home/tabs/ticket/ticket_tab.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = useState(0);
    final tabController = useTabController(initialLength: 4);
    final model = ref.watch(homeViewModel);
    final appMetaStream = ref.watch(appMetaStreamProvider);
    final isCurrentVerGood = (appMetaStream.value != null)
        // Is the current version greater than or equal to the 'allowed' version
        ? (currentVersion.compareTo(appMetaStream.value!['currentVer'] ?? '') >=
            0)
        : true;

    useEffect(() {
      ref.read(mixpanel)!.track(
        "At HomeView",
        properties: {"isUpdated": isCurrentVerGood},
      );
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
                (isCurrentVerGood)
                    ? HomeTab(
                        model: model,
                        constraints: constraints,
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Please update to version ${appMetaStream.value?['currentVer']}',
                          ),
                          const Text(
                            '(I-sud gawas lng ang app, automatic rana mu-update)',
                          ),
                        ],
                      ),
                TeamTab(constraints: constraints),
                TicketTab(constraints: constraints),
                ProfileTab(constraints: constraints),
              ],
            ),
            bottomNavigationBar: HomeBottomNavBar(
              tabController: tabController,
              tabIndex: tabIndex,
            ),
          );
        },
      ),
    );
  }
}
