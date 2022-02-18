import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/home/home_view_model.dart';
import 'package:kasado/logic/home/states/home_tab_state.dart';
import 'package:kasado/ui/home/tabs/home/components/next_court_slot_card.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

class HomeTab extends HookConsumerWidget {
  const HomeTab({
    Key? key,
    required this.model,
    required this.constraints,
  }) : super(key: key);

  final HomeViewModel model;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courtsStream = ref.watch(courtsStreamProvider);
    return Column(
      children: [
        const Text(
          'GAMES FOR TODAY',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        Expanded(
          child: Center(
            child: courtsStream.when(
              error: (e, __) => Text(e.toString()),
              loading: () => const LoadingWidget(),
              data: (courtList) {
                return ListView.builder(
                  itemCount: courtList.length,
                  itemBuilder: (context, i) {
                    final court = courtList[i];
                    return NextCourtSlotCard(
                      constraints: constraints,
                      court: court,
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
