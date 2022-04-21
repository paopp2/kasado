import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_controller.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/game_stats/game_stats.dart';

class TimerButton extends HookConsumerWidget {
  const TimerButton({
    Key? key,
    required this.controller,
    required this.courtSlot,
    required this.gameStats,
    this.showMillis = true,
    this.displayTimeOnly = false,
    this.fontSize = 22,
  }) : super(key: key);

  final GameStatController controller;
  final CourtSlot courtSlot;
  final GameStats gameStats;
  final bool showMillis;
  final bool displayTimeOnly;
  final double fontSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utils = ref.watch(kasadoUtilsProvider);
    final remainingOnPaused = gameStats.remainingOnPaused;
    final endsAt = gameStats.endsAt!;
    final isPaused = gameStats.isPaused;
    final remainingTimeState =
        useState((showMillis) ? "15 : 00 : 00" : "15 : 00");

    useEffect(() {
      _updateRemainingTime(Timer timer) {
        if (isPaused) return;

        final now = DateTime.now();
        final durationDifference = endsAt.difference(now);
        if (durationDifference <= Duration.zero) {
          timer.cancel();
          remainingTimeState.value = (showMillis) ? "00 : 00 : 00" : "00 : 00";
        } else {
          remainingTimeState.value = utils.getFormattedRemainingTime(
            remaining: durationDifference,
            showMillis: showMillis,
          );
        }
      }

      final _timer = Timer.periodic(
        const Duration(milliseconds: 5),
        _updateRemainingTime,
      );

      return _timer.cancel;
    }, [isPaused]);

    return TextButton(
      child: Text(
        (isPaused)
            ? utils.getFormattedRemainingTime(
                remaining: remainingOnPaused!,
                showMillis: showMillis,
              )
            : remainingTimeState.value,
        style: GoogleFonts.roboto(
          fontSize: fontSize,
          color: (isPaused) ? Colors.grey.shade500 : Colors.green.shade500,
        ),
      ),
      onPressed: (displayTimeOnly)
          ? null
          : () {
              controller.pauseOrPlayGameClock(
                courtSlot: courtSlot,
                gameStats: gameStats,
                isPaused: isPaused,
              );
            },
    );
  }
}
