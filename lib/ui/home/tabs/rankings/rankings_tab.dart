import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/app_router.dart';
import 'package:kasado/constants/enums/stat_type.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/leaderboards/stat_leaders_view_model.dart';
import 'package:kasado/ui/leaderboards/components/stat_leaders_pane.dart';

class RankingsTab extends HookConsumerWidget {
  const RankingsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(statLeadersViewModel);

    useEffect(() {
      ref.read(mixpanel)!.track("Viewed RankingsTab");

      return;
    }, []);

    return Scaffold(
      body: StatLeadersPane(
        model: model,
        statType: StatType.standing,
        statDescription: 'Player Standings',
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.amber,
        icon: const FaIcon(
          FontAwesomeIcons.angleRight,
          size: 15,
        ),
        foregroundColor: Colors.black,
        label: const Text('Tap here for MORE'),
        onPressed: () => context.pushNamed(Routes.statLeadersView),
      ),
    );
  }
}
