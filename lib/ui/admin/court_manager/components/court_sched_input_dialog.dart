import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/constants/date_time_related_constants.dart';
import 'package:kasado/logic/admin/court_manager/court_admin_controller.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/court_sched/court_sched.dart';
import 'package:kasado/ui/admin/court_manager/components/sched_time_range_picker.dart';
import 'package:time/time.dart';
import 'package:kasado/model/time_range/time_range.dart' as kasado;

/// Dialog for inputting a Court schedule
///
/// Regular schedules recurs every week. The courtSched.timeRange.startsAt
/// represents the startDate of the appointment recurrence as well as where the
/// weekday will be obtained from (weekday of date). As for the special dates, it
/// only represents well, the special date that a certain appointment occurs
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
    final timeStartState = useState(bigBang);
    final timeEndState = useState(bigBang);
    final isSchedDateSet = !timeStartState.value.isAtSameDayAs(bigBang);
    final schedEndDate = useState<DateTime?>(null);
    final utils = ref.watch(kasadoUtilsProvider);

    void _onAddCourtSchedPressed() {
      controller.addToCourtSchedList(
        sched: CourtSched(
          weekdayIndex: timeStartState.value.weekday - 1,
          timeRange: kasado.TimeRange(
            startsAt: timeStartState.value,
            endsAt: timeEndState.value,
          ),
          endDate: schedEndDate.value,
        ),
        isSpecial: isSpecial,
      );
      Navigator.pop(context);
    }

    void _onDateSchedButtonPressed({bool forEnd = false}) async {
      final date = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime(2050),
          ) ??
          DateTime(
            timeStartState.value.year,
            timeStartState.value.month,
          );
      if (forEnd) {
        schedEndDate.value = date;
      } else {
        timeStartState.value = timeStartState.value.copyWith(
          month: date.month,
          day: date.day,
          year: date.year,
        );
        timeEndState.value = timeEndState.value.copyWith(
          month: date.month,
          day: date.day,
          year: date.year,
        );
      }
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
                      foregroundColor:
                          (isSchedDateSet) ? Colors.green : Colors.red,
                    ),
                    child: Text(
                      (isSchedDateSet)
                          ? utils.getDateFormat(
                              timeStartState.value,
                              showYear: true,
                            )
                          : "Choose a special sched date",
                    ),
                    onPressed: _onDateSchedButtonPressed,
                  )
                : TextButton(
                    child: Text(
                      (isSchedDateSet)
                          ? "${utils.getDateFormat(
                              timeStartState.value,
                              showYear: true,
                            )} (${weekdaysStringList[timeStartState.value.weekday - 1]})"
                          : "Choose a starting date for sched",
                    ),
                    onPressed: _onDateSchedButtonPressed,
                  ),
            if (!isSpecial) ...[
              TextButton(
                child: Text(
                  (schedEndDate.value != null)
                      ? utils.getDateFormat(
                          schedEndDate.value,
                          showYear: true,
                        )
                      : "Choose end date for sched (optional)",
                ),
                onPressed: () => _onDateSchedButtonPressed(forEnd: true),
              ),
            ],
            SchedTimeRangePicker(
              timeStartState: timeStartState,
              timeEndState: timeEndState,
            ),
            TextButton(
              child: const Text("Add CourtSched"),
              onPressed: _onAddCourtSchedPressed,
              style: TextButton.styleFrom(
                foregroundColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
