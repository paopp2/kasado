import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_controller.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/game_stats/game_stats.dart';
import 'package:kasado/ui/admin/stat_manager/components/timer_button.dart';

class ScoreBoardPane extends StatelessWidget {
  const ScoreBoardPane({
    Key? key,
    required this.controller,
    required this.baseCourtSlot,
    required this.constraints,
    required this.gameStats,
  }) : super(key: key);

  final GameStatController controller;
  final CourtSlot baseCourtSlot;
  final BoxConstraints constraints;
  final GameStats gameStats;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: constraints.maxHeight * 0.05),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AnimatedFlipCounter(
                value: gameStats.homeScore,
                curve: Curves.easeInOutBack,
                duration: const Duration(milliseconds: 500),
                textStyle: TextStyle(
                  color: Colors.blue.shade700,
                  fontWeight: FontWeight.bold,
                  fontSize: constraints.maxHeight * 0.6,
                ),
              ),
              AnimatedFlipCounter(
                value: gameStats.awayScore,
                curve: Curves.easeInOutBack,
                duration: const Duration(milliseconds: 500),
                textStyle: TextStyle(
                  color: Colors.red.shade700,
                  fontWeight: FontWeight.bold,
                  fontSize: constraints.maxHeight * 0.6,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: TimerButton(
            controller: controller,
            courtSlot: baseCourtSlot,
            gameStats: gameStats,
            displayTimeOnly: true,
            showMillis: false,
            fontSize: constraints.maxHeight * 0.3,
          ),
        ),
      ],
    );
  }
}
