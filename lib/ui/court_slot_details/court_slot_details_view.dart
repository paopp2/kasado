import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/court_slot_details/court_slot_details_state.dart';
import 'package:kasado/logic/court_slot_details/court_slot_details_view_model.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/ui/admin/stat_manager/stats_controller_tab.dart';
import 'package:kasado/ui/court_slot_details/tabs/box_score_tab/box_score_tab.dart';
import 'package:kasado/ui/court_slot_details/tabs/slot_players_tab/slot_players_tab.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

class CourtSlotDetailsView extends HookConsumerWidget {
  const CourtSlotDetailsView({
    Key? key,
    required this.isAdmin,
    required this.court,
    required this.baseCourtSlot,
    required this.isDone,
  }) : super(key: key);

  final bool isAdmin;
  final Court court;
  final CourtSlot baseCourtSlot;
  final bool isDone;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(courtSlotDetailsViewModel);
    final courtSlotStream = ref.watch(
      courtSlotStreamProvider('${court.id}|${baseCourtSlot.slotId}'),
    );
    final utils = ref.watch(kasadoUtilsProvider);
    final tabIndex = useState(0);
    final tabController = useTabController(initialLength: (isAdmin) ? 3 : 2);

    useEffect(() {
      ref.read(mixpanel)!.track(
        "Navigated to CourtSlotDetailsView",
        properties: {
          "isDone": isDone,
          "courtSlotTimerange":
              "${utils.getDateFormat(baseCourtSlot.timeRange.startsAt)} / ${utils.getTimeRangeFormat(baseCourtSlot.timeRange)}",
        },
      );
      tabController.addListener(() => (tabIndex.value = tabController.index));
      model.initState({'court_id': baseCourtSlot.courtId});
      return model.dispose;
    }, []);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: courtSlotStream.when(
              error: (e, _) => Text(e.toString()),
              loading: () => const LoadingWidget(),
              data: (courtSlot) {
                // If courtSlot doesn't exist in DB, use baseCourtSlot as passed
                // from previous View
                final fetchedCourtSlot =
                    courtSlot ?? baseCourtSlot.copyWith(players: []);

                return Column(
                  children: [
                    Text(
                      court.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${utils.getDateFormat(fetchedCourtSlot.timeRange.startsAt)} / ${utils.getTimeRangeFormat(fetchedCourtSlot.timeRange)}",
                    ),
                    const SizedBox(height: 10),
                    Visibility(
                      visible: isAdmin,
                      child: const Text('ADMIN MODE'),
                    ),
                    const Divider(thickness: 2),
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          SlotPlayersTab(
                            model: model,
                            utils: utils,
                            courtSlot: fetchedCourtSlot,
                            court: court,
                            isAdmin: isAdmin,
                            isDone: isDone,
                          ),
                          BoxScoreTab(
                            constraints: constraints,
                            courtSlot: baseCourtSlot,
                          ),
                          if (isAdmin) ...[
                            StatsControllerTab(
                              constraints: constraints,
                              courtSlot: fetchedCourtSlot,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: tabController.animateTo,
            currentIndex: tabIndex.value,
            selectedItemColor: Colors.black,
            items: [
              const BottomNavigationBarItem(
                label: "Players",
                icon: Icon(Icons.people),
              ),
              const BottomNavigationBarItem(
                label: "Box Score",
                icon: Icon(Icons.analytics_outlined),
              ),
              if (isAdmin) ...[
                const BottomNavigationBarItem(
                  label: "Stats Controller",
                  icon: Icon(Icons.gamepad_outlined),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
