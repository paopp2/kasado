import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/home/home_view_model.dart';
import 'package:kasado/logic/home/states/home_tab_state.dart';
import 'package:kasado/ui/home/tabs/home/components/next_court_slot_card.dart';
import 'package:kasado/ui/shared/place_search_field.dart';
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
    final isLocationRetrieved = ref.watch(isLocationRetrievedProvider);

    useEffect(() {
      ref.read(mixpanel)!.track("Viewed HomeTab");
      _controller.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          if (courtsStream.asData == const AsyncValue.loading() ||
              !isLocationRetrieved) {
            _controller.forward(from: 0.5);
          } else {
            ref.read(isLoadedProvider.notifier).state = true;
          }
        }
      });

      return;
    }, [isLocationRetrieved]);

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: constraints.maxHeight * 0.1, // AppBar height
            floating: true,
            pinned: false,
            snap: false,
            elevation: 0,
            backgroundColor: Colors.transparent,
            flexibleSpace: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
                vertical: 8.0,
              ),
              child: Material(
                elevation: 15,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: PlaceSearchField(
                  constraints: constraints,
                  onLocationTapped: (location) => ref
                      .read(selectedCenterLocProvider.notifier)
                      .state = location,
                ),
              ),
            ),
          ),
          (!isLoaded)
              ? SliverFillRemaining(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: constraints.maxHeight * 0.3,
                        child: Lottie.asset(
                          'assets/lottie/dunking_man.zip',
                          height: constraints.maxHeight * 0.65,
                          controller: _controller,
                          onLoaded: (composition) => Future.delayed(
                            composition.duration,
                            // ignore: prefer-extracting-callbacks
                            () {
                              _controller
                                ..duration = composition.duration
                                ..forward(from: 0.5);
                            },
                          ),
                        ),
                      ),
                      Text(
                        "Finding courts near you...",
                        style: TextStyle(
                          fontSize: constraints.maxWidth * 0.035,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                )
              : AnimationLimiter(
                  child: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, i) {
                        final court = courtsList[i];

                        return StaggerListTileAnimation(
                          index: i,
                          child: NextCourtSlotCard(
                            constraints: constraints,
                            court: court,
                          ),
                        );
                      },
                      childCount: courtsList.length,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
