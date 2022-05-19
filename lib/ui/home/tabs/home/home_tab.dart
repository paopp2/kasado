import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/home/home_view_model.dart';
import 'package:kasado/logic/home/states/home_tab_state.dart';
import 'package:kasado/ui/home/tabs/home/components/next_court_slot_card.dart';
import 'package:kasado/ui/home/tabs/home/components/next_court_slot_card_shimmer.dart';
import 'package:kasado/ui/shared/place_search_field.dart';
import 'package:kasado/ui/shared/stagger_list_tile_animation.dart';

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
    final courtsList = courtsStream.value;

    useEffect(() {
      ref.read(mixpanel)!.track("Viewed HomeTab");

      return;
    }, []);

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: constraints.maxHeight * 0.1, // AppBar height
            floating: true,
            pinned: false,
            snap: false,
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
          (courtsList == null)
              ? SliverFillRemaining(
                  child: ListView.builder(
                    itemBuilder: (context, i) {
                      return NextCourtSlotCardShimmer(constraints: constraints);
                    },
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
