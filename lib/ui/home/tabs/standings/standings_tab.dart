import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/app_router.dart';
import 'package:kasado/constants/enums.dart';
import 'package:kasado/logic/leaderboards/stat_leaders_view_model.dart';
import 'package:kasado/ui/leaderboards/components/stat_leaders_pane.dart';

class StandingsTab extends HookConsumerWidget {
  const StandingsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(statLeadersViewModel);

    return Scaffold(
      body: StatLeadersPane(
        model: model,
        statType: StatType.standing,
        statDescription: 'Player Standings',
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.amber,
        icon: const FaIcon(
          FontAwesomeIcons.crown,
          size: 15,
        ),
        foregroundColor: Colors.black,
        label: const Text('Stat Leaders'),
        onPressed: () => context.pushNamed(Routes.statLeadersView),
      ),
    );
  }
}
