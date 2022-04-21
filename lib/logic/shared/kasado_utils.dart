import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kasado/constants/date_time_related_constants.dart';
import 'package:kasado/model/time_range/time_range.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:time/time.dart';

final kasadoUtilsProvider = Provider.autoDispose(
  (ref) => KasadoUtils(ref.read),
);

class KasadoUtils {
  KasadoUtils(this.read);

  final Reader read;

  TimeRange getNextTimeSlot({
    required List<TimeRange> timeSlots,
    required List<WeekDays> weekdays,
  }) {
    const hour = Duration(hours: 1);
    final now = DateTime.now();
    final sortedTimeSlots = timeSlots
      ..sort((a, b) => a.startsAt.compareTo(b.startsAt));

    // If today is not one of the allowed weekdays for the sched, calculate the
    // time range for the next sched
    if (!weekdays.contains(indexToWeekDay[now.weekday - 1])) {
      return calculateFirstSlotForNextSched(
        timeSlots: timeSlots,
        weekdays: weekdays,
      );
    }

    // Iterate over the time slots to get the next closest one for today
    for (final slot in sortedTimeSlots) {
      final sStart = slot.startTime;
      final sEnd = slot.endTime;

      final sStartDateTime =
          DateTime(now.year, now.month, now.day, sStart.hour, sStart.minute);
      final sEndDateTime =
          DateTime(now.year, now.month, now.day, sEnd.hour, sEnd.minute);

      final sAdjustedTimeRange = TimeRange(
        startsAt: sStartDateTime,
        endsAt: sEndDateTime,
      );

      // Get next slot if current slot's time range has ended
      if (sEndDateTime.isBefore(now)) continue;

      // If slot's time range had not started yet OR
      // If the slot has started but still within an hour ago, return the slot
      if (sStartDateTime.isAfter(now) ||
          now.difference(sStartDateTime) < hour) {
        return sAdjustedTimeRange;
      }
    }

    //In cases there is none,
    // get the closest next schedule that is not for today
    return calculateFirstSlotForNextSched(
      timeSlots: timeSlots,
      weekdays: weekdays,
    );
  }

  /// Calculates the TimeRange for the next sched when it's not for today
  TimeRange calculateFirstSlotForNextSched({
    required List<TimeRange> timeSlots,
    required List<WeekDays> weekdays,
  }) {
    final now = DateTime.now();
    final weekFromNow = now + 1.weeks;
    // -1 adjusts now.weekday to begin at 0 (eg. Monday: 0, Sunday: 6)
    final dayTodayAsNum = now.weekday - 1;
    // Map [weekdays] to their number counterpart (based on ISO 8601)
    final weekdaysAsNumber =
        weekdays.map((day) => indexToWeekDay.indexOf(day)).toList();
    // Insert today (as number) to the list above
    final weekdaysWithToday = weekdaysAsNumber
      ..add(dayTodayAsNum)
      ..sort();
    // Obtain the index to be used below
    final indexOfDayToday = weekdaysWithToday.indexOf(dayTodayAsNum);

    DateTime nextSchedDate;
    nextSchedDate = (weekdaysWithToday.last == dayTodayAsNum)
        // If today is at the end of the weekdays list, the first one will be the day of the next sched
        ? now.to(weekFromNow).firstWhere(
              (dt) => dt.weekday == (weekdaysWithToday.first + 1),
            )
        // Else the next sched day will be the next one on the weekdays list after today
        : now.to(weekFromNow).firstWhere(
            (dt) => dt.weekday == (weekdaysAsNumber[indexOfDayToday + 1] + 1));

    // Use the first slot at timeSlots
    final firstSlot = timeSlots.first;

    return TimeRange(
      startsAt: DateTime(
        nextSchedDate.year,
        nextSchedDate.month,
        nextSchedDate.day,
        firstSlot.startsAt.hour,
        firstSlot.startsAt.minute,
      ),
      endsAt: DateTime(
        nextSchedDate.year,
        nextSchedDate.month,
        nextSchedDate.day,
        firstSlot.endsAt.hour,
        firstSlot.endsAt.minute,
      ),
    );
  }

  bool isCurrentSlotEnded(TimeRange timeRange) {
    final now = DateTime.now();

    return timeRange.startsAt.difference(now).abs() >
        timeRange.endsAt.difference(now).abs();
  }

  String getDateFormat(DateTime dateTime) {
    return DateFormat('MMM d').format(dateTime);
  }

  String getTimeRangeFormat(TimeRange timeRange, {bool showDate = false}) {
    final startTimeFormat = DateFormat('h:mm');
    final endTimeFormat = DateFormat('h:mm a');
    final timeRangeAsString =
        "${startTimeFormat.format(timeRange.startsAt)} - ${endTimeFormat.format(timeRange.endsAt)}";

    return (showDate)
        ? "${getDateFormat(timeRange.startsAt)} / $timeRangeAsString"
        : timeRangeAsString;
  }

  String getPercentageFormat(double number) {
    if (number.isNaN) return "N/A";

    return "${number.toStringAsFixed(0)}%";
  }

  String getDoubleFormat(double number) {
    if (number.isNaN) return "N/A";

    return number.toStringAsFixed(1);
  }

  String getFormattedRemainingTime({
    required Duration remaining,
    bool showMillis = false,
  }) {
    final twoDigitFormat = NumberFormat('00');
    final minRemaining =
        twoDigitFormat.format(remaining.inMinutes.remainder(60));
    final secRemaining =
        twoDigitFormat.format(remaining.inSeconds.remainder(60));
    final msRemaining =
        twoDigitFormat.format(remaining.inMilliseconds.remainder(100));

    return "$minRemaining : $secRemaining" +
        ((showMillis) ? " : $msRemaining" : '');
  }
}
