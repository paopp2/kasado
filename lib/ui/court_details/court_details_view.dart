import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/ui/court_details/components/court_admins_panel.dart';
import 'package:kasado/ui/court_details/components/court_schedule_panel.dart';

class CourtDetailsView extends HookConsumerWidget {
  const CourtDetailsView({
    Key? key,
    required this.court,
    required this.isAdmin,
  }) : super(key: key);

  final Court court;
  final bool isAdmin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = useState(0);
    final tabController = useTabController(initialLength: 2);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: SizedBox(
                  height: constraints.maxHeight * 0.3,
                  child: Image.network(
                    court.photoUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(court.name.toUpperCase() + ((isAdmin) ? ' (ADMIN)' : '')),
              const SizedBox(height: 30),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: [
                    CourtSchedulePanel(
                      constraints: constraints,
                      isAdmin: isAdmin,
                      court: court,
                    ),
                    const CourtAdminsPanel(),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: Visibility(
            visible: isAdmin,
            child: FloatingActionButton.extended(
              onPressed: () {},
              label: const Text('Add Admin'),
              icon: const Icon(Icons.person),
            ),
          ),
          bottomNavigationBar: Visibility(
            visible: isAdmin,
            child: BottomNavigationBar(
              onTap: (index) {
                tabIndex.value = index;
                tabController.animateTo(index);
              },
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
  }
}
