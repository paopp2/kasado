import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/model/stats/stats.dart';
import 'package:kasado/ui/leaderboards/components/stat_leaders_pane.dart';

class LeaderboardsView extends HookConsumerWidget {
  const LeaderboardsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 4);

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
              tabs: const [
                Tab(child: Text('WIN %')),
                Tab(child: Text('PPG')),
                Tab(child: Text('APG')),
                Tab(child: Text('RPG')),
              ],
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    StatLeadersPane(
                      statDescription: "WIN RATE",
                      statType: StatType.winRate,
                    ),
                    StatLeadersPane(
                      statDescription: "POINTS PER GAME",
                      statType: StatType.ptsPerGame,
                    ),
                    StatLeadersPane(
                      statDescription: "ASSISTS PER GAME",
                      statType: StatType.astPerGame,
                    ),
                    StatLeadersPane(
                      statDescription: "REBOUNDS PER GAME",
                      statType: StatType.rebPerGame,
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
