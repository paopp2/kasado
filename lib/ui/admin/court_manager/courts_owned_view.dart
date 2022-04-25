import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/app_router.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/admin/court_manager/court_admin_controller.dart';
import 'package:kasado/logic/admin/court_manager/court_admin_state.dart';
import 'package:kasado/ui/admin/court_manager/components/court_input_dialog.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

class CourtsOwnedView extends HookConsumerWidget {
  const CourtsOwnedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserInfo = ref.watch(currentUserInfoProvider).value;
    final adminController = ref.watch(courtAdminController);
    final courtsOwnedList = ref.watch(courtsOwnedListProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
          body: courtsOwnedList.when(
            error: (e, _) => Text(e.toString()),
            loading: () => const LoadingWidget(),
            data: (courtsList) => AnimationLimiter(
              child: ListView.builder(
                itemCount: courtsList.length,
                itemBuilder: (context, i) {
                  final court = courtsList[i];

                  return AnimationConfiguration.staggeredList(
                    position: i,
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: ListTile(
                          title: Text(court.name),
                          subtitle: Text(court.address),
                          onTap: () => context.pushNamed(
                            Routes.courtDetailsView,
                            params: {"courtId": court.id},
                            extra: true, // isAdmin
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => adminController.deleteCourt(court),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          floatingActionButton: Visibility(
            visible: currentUserInfo?.isSuperAdmin ?? false,
            child: FloatingActionButton.extended(
              onPressed: () => adminController.openCourtInputDialog(
                context: context,
                dialog: CourtInputDialog(
                  controller: adminController,
                  constraints: constraints,
                ),
              ),
              label: const Text('Add Court'),
              icon: const Icon(Icons.add),
            ),
          ),
        );
      },
    );
  }
}
