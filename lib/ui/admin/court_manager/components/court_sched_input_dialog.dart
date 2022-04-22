import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/constants/date_time_related_constants.dart';
import 'package:kasado/model/court_sched/court_sched.dart';
import 'package:time/time.dart';
import 'package:time_range_picker/time_range_picker.dart';
import 'package:weekday_selector/weekday_selector.dart';
import 'package:kasado/model/time_range/time_range.dart' as kasado;

class CourtSchedInputDialog extends HookConsumerWidget {
  const CourtSchedInputDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedWeekdayIndex = useState(0);
    final timeStartState = useState(bigBang);
    final timeEndState = useState(bigBang);

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            WeekdaySelector(
              firstDayOfWeek: 0,
              onChanged: (weekday) =>
                  (selectedWeekdayIndex.value = (weekday - 1) % 7),
              values: List.generate(
                  7, (i) => ((i - 1) % 7 == selectedWeekdayIndex.value)),
            ),
            TimeRangePicker(
              use24HourFormat: false,
              interval: const Duration(minutes: 30),
              timeTextStyle: const TextStyle(color: Colors.black),
              ticks: 12,
              labels: [
                "12 am",
                "3 am",
                "6 am",
                "9 am",
                "12 pm",
                "3 pm",
                "6 pm",
                "9 pm"
              ].asMap().entries.map((e) {
                return ClockLabel.fromIndex(
                    idx: e.key, length: 8, text: e.value);
              }).toList(),
              snap: true,
              onStartChange: (time) =>
                  timeStartState.value = timeStartState.value.copyWith(
                hour: time.hour,
                minute: time.minute,
              ),
              onEndChange: (time) =>
                  timeEndState.value = timeEndState.value.copyWith(
                hour: time.hour,
                minute: time.minute,
              ),
              ticksColor: Colors.black,
              hideButtons: true,
              rotateLabels: false,
            ),
            TextButton(
              child: const Text("Add CourtSched"),
              // ignore: prefer-extracting-callbacks
              onPressed: () {
                print(CourtSched(
                  weekdayIndex: selectedWeekdayIndex.value,
                  timeRange: kasado.TimeRange(
                    startsAt: timeStartState.value,
                    endsAt: timeEndState.value,
                  ),
                ));
              },
              style: TextButton.styleFrom(
                primary: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
