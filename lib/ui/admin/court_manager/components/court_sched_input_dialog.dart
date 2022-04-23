import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/constants/date_time_related_constants.dart';
import 'package:kasado/logic/admin/court_manager/court_admin_controller.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/court_sched/court_sched.dart';
import 'package:time/time.dart';
import 'package:time_range_picker/time_range_picker.dart';
import 'package:weekday_selector/weekday_selector.dart';
import 'package:kasado/model/time_range/time_range.dart' as kasado;

class CourtSchedInputDialog extends HookConsumerWidget {
  const CourtSchedInputDialog({
    required this.controller,
    required this.isSpecial,
    Key? key,
  }) : super(key: key);

  final CourtAdminController controller;
  final bool isSpecial;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedWeekdayIndex = useState(0);
    final timeStartState = useState(bigBang);
    final timeEndState = useState(bigBang);
    final isSpecialSchedDateSet = !timeStartState.value.isAtSameDayAs(bigBang);
    final utils = ref.watch(kasadoUtilsProvider);

    void _onAddCourtSchedPressed() {
      controller.addToCourtSchedList(
        sched: CourtSched(
          weekdayIndex: selectedWeekdayIndex.value,
          timeRange: kasado.TimeRange(
            startsAt: timeStartState.value,
            endsAt: timeEndState.value,
          ),
        ),
        isSpecial: isSpecial,
      );
      Navigator.pop(context);
    }

    void _onSpecialDateSchedButtonPressed() async {
      final specialDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime(2050),
          ) ??
          DateTime(
            timeStartState.value.year,
            timeStartState.value.month,
          );
      timeStartState.value = timeStartState.value.copyWith(
        month: specialDate.month,
        day: specialDate.day,
      );
    }

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            (isSpecial)
                ? TextButton(
                    style: TextButton.styleFrom(
                      primary:
                          (isSpecialSchedDateSet) ? Colors.green : Colors.red,
                    ),
                    child: Text(
                      (isSpecialSchedDateSet)
                          ? utils.getDateFormat(
                              timeStartState.value,
                              showYear: true,
                            )
                          : "Choose a special sched date",
                    ),
                    onPressed: _onSpecialDateSchedButtonPressed,
                  )
                : WeekdaySelector(
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
              onPressed: _onAddCourtSchedPressed,
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
