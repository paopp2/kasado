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
    final _controller = useAnimationController();
    final courtsStream = ref.watch(courtsStreamProvider);
    final courtsList = courtsStream.value ?? [];
    final isLoaded = ref.watch(isLoadedProvider);

    useEffect(() {
      ref.read(mixpanel)!.track("Viewed HomeTab");
      _controller.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          if (courtsStream.asData == const AsyncValue.loading()) {
            _controller.forward(from: 0);
          } else {
            ref.read(isLoadedProvider.notifier).state = true;
          }
        }
      });

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
            child: (!isLoaded)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        'assets/lottie/dunking_man.zip',
                        height: constraints.maxHeight * 0.65,
                        controller: _controller,
                        onLoaded: (composition) => Future.delayed(
                          composition.duration,
                          () {
                            _controller
                              ..duration = composition.duration
                              ..forward();
                          },
                        ),
                      ),
                      const Text("Warming up..."),
                    ],
                  )
                : AnimationLimiter(
                    child: ListView.builder(
                      itemCount: courtsList.length,
                      itemBuilder: (context, i) {
                        final court = courtsList[i];

                        return StaggerListTileAnimation(
                          index: i,
                          child: NextCourtSlotCard(
                            constraints: constraints,
                            court: court,
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
