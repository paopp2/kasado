import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/constants/enums.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/leaderboards/leaderboards_view_model.dart';
import 'package:kasado/ui/leaderboards/components/stat_leaders_pane.dart';

class LeaderboardsView extends HookConsumerWidget {
  const LeaderboardsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(leaderboardsViewModel);
    final tabController = useTabController(initialLength: 9);

    useEffect(() {
      ref.read(mixpanel)!.track("Navigated to LeaderboardsView");
      return;
    }, []);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            bottom: TabBar(
              controller: tabController,
              isScrollable: true,
              tabs: const [
                Tab(child: Text('WIN%')),
                Tab(child: Text('PPG')),
                Tab(child: Text('RPG')),
                Tab(child: Text('APG')),
                Tab(child: Text('FG%')),
                Tab(child: Text('3PM')),
                Tab(child: Text('3PT%')),
                Tab(child: Text('SPG')),
                Tab(child: Text('BPG')),
              ],
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    StatLeadersPane(
                      model: model,
                      statDescription: "WIN RATE",
                      statType: StatType.winRate,
                    ),
                    StatLeadersPane(
                      model: model,
                      statDescription: "POINTS PER GAME",
                      statType: StatType.ptsPerGame,
                    ),
                    StatLeadersPane(
                      model: model,
                      statDescription: "REBOUNDS PER GAME",
                      statType: StatType.rebPerGame,
                    ),
                    StatLeadersPane(
                      model: model,
                      statDescription: "ASSISTS PER GAME",
                      statType: StatType.astPerGame,
                    ),
                    StatLeadersPane(
                      model: model,
                      statDescription: "FIELD GOAL PERCENTAGE",
                      statType: StatType.fgPercent,
                    ),
                    StatLeadersPane(
                      model: model,
                      statDescription: "3 POINTS MADE",
                      statType: StatType.threePtMade,
                    ),
                    StatLeadersPane(
                      model: model,
                      statDescription: "3 POINT PERCENTAGE",
                      statType: StatType.threePtPercent,
                    ),
                    StatLeadersPane(
                      model: model,
                      statDescription: "STEALS PER GAME",
                      statType: StatType.stlPerGame,
                    ),
                    StatLeadersPane(
                      model: model,
                      statDescription: "BLOCKS PER GAME",
                      statType: StatType.blkPerGame,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
