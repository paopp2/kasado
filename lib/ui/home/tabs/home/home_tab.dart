import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/home/home_view_model.dart';
import 'package:kasado/logic/home/states/home_tab_state.dart';
import 'package:kasado/ui/home/tabs/home/components/next_court_slot_card.dart';
import 'package:kasado/ui/shared/stagger_list_tile_animation.dart';
import 'package:lottie/lottie.dart';

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

    useEffect(() {
      ref.read(mixpanel)!.track("Viewed HomeTab");

      return;
    }, []);

    return Column(
      children: [
        const Text(
          'NEXT GAMES',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        Expanded(
          child: Center(
            child: courtsStream.when(
              error: (e, __) => Text(e.toString()),
              loading: () => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('assets/lottie/dunking_man.zip'),
                  const Text("Warming up..."),
                ],
              ),
              data: (courtList) {
                return AnimationLimiter(
                  child: ListView.builder(
                    itemCount: courtList.length,
                    itemBuilder: (context, i) {
                      final court = courtList[i];

                      return StaggerListTileAnimation(
                        index: i,
                        child: NextCourtSlotCard(
                          constraints: constraints,
                          court: court,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
