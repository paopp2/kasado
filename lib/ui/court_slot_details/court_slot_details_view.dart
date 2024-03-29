import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/court_slot_details/court_slot_details_state.dart';
import 'package:kasado/logic/court_slot_details/court_slot_details_view_model.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/ui/admin/stat_manager/stats_controller/stats_controller_tab.dart';
import 'package:kasado/ui/admin/stat_manager/ticket_scanner/ticket_scanner_tab.dart';
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
    final pageIndex = useState(0);
    final pageController = usePageController();

    useEffect(() {
      ref.read(mixpanel)!.track(
        "Navigated to CourtSlotDetailsView",
        properties: {
          "isDone": isDone,
          "courtSlotTimeRange": utils.getTimeRangeFormat(
            baseCourtSlot.timeRange,
            showDate: true,
          ),
        },
      );
      model.initState({'court_id': baseCourtSlot.courtId});

      return model.dispose;
    }, []);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(),
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
                      utils.getTimeRangeFormat(
                        fetchedCourtSlot.timeRange,
                        showDate: true,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Visibility(
                      visible: isAdmin,
                      child: const Text('ADMIN MODE'),
                    ),
                    const Divider(thickness: 2),
                    Expanded(
                      child: PageView(
                        controller: pageController,
                        onPageChanged: (i) => pageIndex.value = i,
                        children: [
                          SlotPlayersTab(
                            constraints: constraints,
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
                            isAdmin: isAdmin,
                          ),
                          if (isAdmin) ...[
                            StatsControllerTab(
                              constraints: constraints,
                              courtSlot: fetchedCourtSlot,
                            ),
                            TicketScannerTab(
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
            type: BottomNavigationBarType.fixed,
            onTap: (i) => pageController.animateToPage(
              i,
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            ),
            currentIndex: pageIndex.value,
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
                  label: "Stats",
                  icon: Icon(Icons.gamepad_outlined),
                ),
                const BottomNavigationBarItem(
                  label: "Scanner",
                  icon: Icon(Icons.qr_code_scanner),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
