import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/admin/court_manager/court_admin_controller.dart';
import 'package:kasado/logic/court_details/court_details_state.dart';
import 'package:kasado/logic/court_details/court_details_view_model.dart';
import 'package:kasado/logic/court_slot_details/court_slot_details_view_model.dart';
import 'package:kasado/ui/court_details/components/court_admins_panel.dart';
import 'package:kasado/ui/court_details/components/court_schedule_panel.dart';
import 'package:kasado/ui/admin/court_manager/components/court_input_dialog.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

class CourtDetailsView extends HookConsumerWidget {
  const CourtDetailsView({
    Key? key,
    required this.courtId,
    required this.isAdmin,
  }) : super(key: key);

  final String courtId;
  final bool isAdmin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courtDetailsModel = ref.watch(courtDetailsViewModel);
    final courtSlotDetailsModel = ref.watch(courtSlotDetailsViewModel);
    final adminController = ref.watch(courtAdminController);

    final courtStream = ref.watch(courtStreamProvider(courtId));
    final tabIndex = useState(0);
    final tabController = useTabController(
      initialLength: 2,
    );

    useEffect(() {
      if (courtStream.value != null) {
        ref.read(mixpanel)!.track(
          "Navigated to CourtDetailsView",
          properties: {
            "courtName": courtStream.value!.name,
            "courtId": courtStream.value!.id,
          },
        );
      }
      courtDetailsModel.initState({'court_id': courtId});

      return courtDetailsModel.dispose;
    }, [courtStream.value]);

    void _onBottomNavBarItemTapped(int index) {
      tabIndex.value = index;
      tabController.animateTo(index);
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return courtStream.when(
          error: (e, _) => Text(e.toString()),
          loading: () => const LoadingWidget(),
          data: (court) {
            court!;

            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconTheme: const IconThemeData(color: Colors.white),
              ),
              extendBodyBehindAppBar: true,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Hero(
                    tag: court.id,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      child: SizedBox(
                        height: constraints.maxHeight * 0.3,
                        child: Stack(
                          children: [
                            Positioned(
                              child: Image.network(
                                court.photoUrl,
                                fit: BoxFit.cover,
                              ),
                              right: 0,
                              left: 0,
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "${court.ticketPrice.toStringAsFixed(0)} Php",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // TODO: Uncomment after implementing additional if with light
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.end,
                                    //   children: [
                                    //     Text(
                                    //       "+10 if w/",
                                    //       style: TextStyle(
                                    //         color: Colors.white,
                                    //         fontWeight: FontWeight.bold,
                                    //       ),
                                    //     ),
                                    //     Icon(
                                    //       Icons.lightbulb,
                                    //       color: Colors.amber,
                                    //     ),
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: Column(
                      children: [
                        AutoSizeText(
                          court.name.toUpperCase(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.center,
                        ),
                        AutoSizeText(
                          court.address,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: tabController,
                      children: [
                        CourtSchedulePanel(
                          constraints: constraints,
                          model: courtSlotDetailsModel,
                          isAdmin: isAdmin,
                          court: court,
                        ),
                        CourtAdminsPanel(court: court),
                      ],
                    ),
                  ),
                ],
              ),
              floatingActionButton: Visibility(
                visible: isAdmin,
                child: FloatingActionButton.extended(
                  onPressed: (tabIndex.value == 0)
                      ? () => adminController.openCourtInputDialog(
                            context: context,
                            dialog: CourtInputDialog(
                              controller: adminController,
                              courtToEdit: court,
                            ),
                            forEdit: true,
                            court: court,
                          )
                      : () {
                          // TODO: Add an admin for court
                        },
                  label: Text(
                    tabIndex.value == 0 ? 'Edit Court' : 'Add Admin',
                  ),
                  icon: Icon(tabIndex.value == 0 ? Icons.edit : Icons.person),
                ),
              ),
              bottomNavigationBar: Visibility(
                visible: isAdmin,
                child: BottomNavigationBar(
                  onTap: _onBottomNavBarItemTapped,
                  selectedItemColor: Colors.black,
                  currentIndex: tabController.index,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.schedule),
                      label: 'Schedule',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.people),
                      label: 'Admins',
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
