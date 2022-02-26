import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/app_router.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/court_details/court_details_view_model.dart';
import 'package:kasado/logic/admin/court_manager/court_admin_state.dart';
import 'package:kasado/ui/admin/court_manager/components/court_input_dialog.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

class CourtsOwnedView extends HookConsumerWidget {
  const CourtsOwnedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserInfo = ref.watch(currentUserInfoProvider).value;
    final adminController = ref.watch(courtDetailsViewModel).adminController;
    final courtsOwnedList = ref.watch(courtsOwnedListProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
          body: courtsOwnedList.when(
            error: (e, _) => Text(e.toString()),
            loading: () => const LoadingWidget(),
            data: (courtsList) => ListView.builder(
              itemCount: courtsList.length,
              itemBuilder: (context, i) {
                final court = courtsList[i];
                return ListTile(
                  title: Text(court.name),
                  subtitle: Text(court.address),
                  onTap: () => context.pushNamed(
                    Routes.courtDetailsView,
                    extra: {
                      "courtId": court.id,
                      "isAdmin": true,
                    },
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => adminController.deleteCourt(court),
                  ),
                );
              },
            ),
          ),
          floatingActionButton: Visibility(
            visible: currentUserInfo?.isSuperAdmin ?? false,
            child: FloatingActionButton.extended(
              onPressed: () => adminController.openCourtInputDialog(
                context: context,
                dialog: CourtInputDialog(controller: adminController),
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
