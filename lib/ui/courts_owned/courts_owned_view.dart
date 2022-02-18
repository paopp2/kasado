import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/app_router.dart';
import 'package:kasado/logic/courts_owned/courts_owned_state.dart';
import 'package:kasado/logic/courts_owned/courts_owned_view_model.dart';
import 'package:kasado/ui/courts_owned/components/new_court_input_dialog.dart';

class CourtsOwnedView extends HookConsumerWidget {
  const CourtsOwnedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(courtsOwnedViewModel);
    final courtsOwnedList = ref.watch(courtsOwnedListProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: courtsOwnedList.when(
            error: (e, _) => Text(e.toString()),
            loading: () => const CircularProgressIndicator(),
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
                      "court": court,
                      "isAdmin": true,
                    },
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => model.deleteCourt(court),
                  ),
                );
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => showDialog(
              context: context,
              builder: (_) => NewCourtInputDialog(model: model),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
