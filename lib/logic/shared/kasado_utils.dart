import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kasado/model/court_sched/court_sched.dart';
import 'package:kasado/model/time_range/time_range.dart';
import 'package:time/time.dart';

final kasadoUtilsProvider = Provider.autoDispose(
  (ref) => KasadoUtils(ref.read),
);

class KasadoUtils {
  KasadoUtils(this.read);

  final Reader read;

  TimeRange getNextTimeSlot({
    required DateTime from,
    required List<CourtSched> courtScheds,
  }) {
    // Filter courtScheds to remove scheds has an end date before [from]
    final _courtScheds = [...courtScheds]
      ..removeWhere((sched) => (sched.endDate?.isBefore(from) ?? false));

    // Weekdays are represented as numbers => MON:0, TUE:1,..., SUN:6
    final weekdays =
        _courtScheds.map((sched) => sched.weekdayIndex).toSet().toList();
    final today = from.weekday - 1; // Adjusted to start at 0 (1 by default)
    final slotsPerDay = {
      for (final day in weekdays)
        day: _courtScheds
            .where((sched) => sched.weekdayIndex == day)
            .map((sched) => sched.timeRange)
            .toList()
          ..sort((a, b) => a.startsAt.compareTo(b.startsAt)),
    };

    // If today is not one of the allowed weekdays for the sched, calculate the
    // time range for the next sched
    if (!weekdays.contains(today)) {
      return calculateFirstSlotForNextSched(
        from: from,
        slotsPerDay: slotsPerDay,
      );
    }

    // Iterate over the time slots of today and get the next closest one
    for (final slot in slotsPerDay[today]!) {
      final sStart = slot.startTime;
      final sEnd = slot.endTime;

      final sStartDateTime =
          DateTime(from.year, from.month, from.day, sStart.hour, sStart.minute);
      final sEndDateTime =
          DateTime(from.year, from.month, from.day, sEnd.hour, sEnd.minute);

      final sAdjustedTimeRange = TimeRange(
        startsAt: sStartDateTime,
        endsAt: sEndDateTime,
      );

      // Get next slot if current slot's time range has ended
      if (sEndDateTime.isBefore(from)) continue;

      // If slot's time range had not started yet OR
      // If the slot has started but still within an hour ago, return the slot
      if (sStartDateTime.isAfter(from) ||
          from.difference(sStartDateTime) < 1.hours) {
        // Except if the slot's time range is not yet meant to start (will start
        // in future), then continue to the next one
        if (sAdjustedTimeRange.startsAt.isBefore(slot.startsAt)) continue;

        return sAdjustedTimeRange;
      }
    }

    return calculateFirstSlotForNextSched(
      slotsPerDay: slotsPerDay,
      from: from,
    );
  }

  TimeRange calculateFirstSlotForNextSched({
    required Map<int, List<TimeRange>> slotsPerDay,
    required DateTime from,
  }) {
    // Weekdays are represented as numbers => MON:0, TUE:1,..., SUN:6
    final today = from.weekday - 1; // Adjusted to start at 0 (1 by default)
    final weekdays = slotsPerDay.keys.toList();

    // Insert today to the weekdays list (if not in it already)
    final weekdaysWithToday = {...weekdays, today}.toList()..sort();

    // Obtain the index to be used below
    final todayIndex = weekdaysWithToday.indexOf(today);

    DateTime nextSchedDate;
    final weekFromNow = from + 1.weeks;
    nextSchedDate = (weekdaysWithToday.last == today)
        // If today is at the end of the weekdays list, the first one will be the day of the next sched
        ? from.to(weekFromNow).firstWhere(
              (dt) => dt.weekday == (weekdaysWithToday.first + 1),
            )
        // Else the next sched day will be the next one on the weekdays list after today
        : from.to(weekFromNow).firstWhere(
            (dt) => (dt.weekday) == (weekdaysWithToday[todayIndex + 1] + 1));

    // Use the first slot of nextSchedDate (adjusted to start at 0 (1 by default))
    final firstSlot = slotsPerDay[nextSchedDate.weekday - 1]!.first;

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

  String getDateFormat(DateTime? dateTime, {bool showYear = false}) {
    if (dateTime == null) return '';
    final dateFormat =
        (showYear) ? DateFormat('MMM d yyyy') : DateFormat('MMM d');

    return dateFormat.format(dateTime);
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
