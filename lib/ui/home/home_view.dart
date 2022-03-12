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
