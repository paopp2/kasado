import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/game_stats/game_stats.dart';
import 'package:time/time.dart';

class TimerButton extends HookConsumerWidget {
  const TimerButton({
    Key? key,
    required this.gameStats,
  }) : super(key: key);

  final GameStats gameStats;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utils = ref.watch(kasadoUtilsProvider);
    final remainingOnPausedState = useState<Duration?>(15.minutes);
    final endTimeState = useState(15.minutes.fromNow);
    final isPaused = remainingOnPausedState.value != null;
    final remainingTimeState = useState("15 : 00 : 00");

    useEffect(() {
      final _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
        if (isPaused) return;

        final now = DateTime.now();
        final durationDifference = endTimeState.value.difference(now);
        if (durationDifference <= Duration.zero) {
          timer.cancel();
          remainingTimeState.value = "00 : 00 : 00";
        } else {
          remainingTimeState.value =
              utils.getFormattedRemainingTime(durationDifference);
        }
      });
      return _timer.cancel;
    }, [isPaused]);

    return TextButton(
      child: Text(
        (isPaused)
            ? utils.getFormattedRemainingTime(remainingOnPausedState.value!)
            : remainingTimeState.value,
        style: GoogleFonts.roboto(
          fontSize: 22,
          color: (isPaused) ? Colors.red.shade500 : Colors.green.shade500,
        ),
      ),
      onPressed: () {
        if (isPaused) {
          endTimeState.value =
              DateTime.now().add(remainingOnPausedState.value!);
          remainingOnPausedState.value = null;
        } else {
          remainingOnPausedState.value =
              endTimeState.value.difference(DateTime.now());
        }
      },
    );
  }
}
