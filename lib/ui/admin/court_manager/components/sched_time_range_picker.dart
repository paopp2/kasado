import 'package:flutter/material.dart';
import 'package:time/time.dart';
import 'package:time_range_picker/time_range_picker.dart';

class SchedTimeRangePicker extends StatelessWidget {
  const SchedTimeRangePicker({
    Key? key,
    required this.timeStartState,
    required this.timeEndState,
  }) : super(key: key);

  final ValueNotifier<DateTime> timeStartState;
  final ValueNotifier<DateTime> timeEndState;

  @override
  Widget build(BuildContext context) {
    return TimeRangePicker(
      use24HourFormat: false,
      interval: const Duration(minutes: 30),
      timeTextStyle: const TextStyle(color: Colors.black),
      ticks: 12,
      labels: ["12 am", "3 am", "6 am", "9 am", "12 pm", "3 pm", "6 pm", "9 pm"]
          .asMap()
          .entries
          .map((e) {
        return ClockLabel.fromIndex(idx: e.key, length: 8, text: e.value);
      }).toList(),
      snap: true,
      onStartChange: (time) =>
          timeStartState.value = timeStartState.value.copyWith(
        hour: time.hour,
        minute: time.minute,
      ),
      onEndChange: (time) => timeEndState.value = timeEndState.value.copyWith(
        hour: time.hour,
        minute: time.minute,
      ),
      ticksColor: Colors.black,
      hideButtons: true,
      rotateLabels: false,
    );
  }
}
