import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kasado/constants/date_time_related_constants.dart';
import 'package:kasado/model/time_range/time_range.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

final kasadoUtilsProvider = Provider.autoDispose(
  (ref) => KasadoUtils(ref.read),
);

class KasadoUtils {
  KasadoUtils(this.read);

  final Reader read;

  TimeRange? getNextTimeSlotForToday({
    required List<TimeRange> timeSlots,
    required List<WeekDays> weekdays,
  }) {
    const hour = Duration(hours: 1);
    final now = DateTime.now();
    final sortedTimeSlots = timeSlots
      ..sort((a, b) => a.startsAt.compareTo(b.startsAt));

    // If today's WeekDay not permitted by Court, then there are no games today
    if (!weekdays.contains(indexToWeekDay[now.weekday - 1])) return null;

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

    // If none in the list are viable then there are no more games for today
    return null;
  }

  bool isCurrentSlotClosed(TimeRange timeRange) {
    final now = DateTime.now();
    return timeRange.startsAt.difference(now).abs() >
        timeRange.endsAt.difference(now).abs();
  }

  String getDateFormat(DateTime dateTime) {
    return DateFormat('MMM d').format(dateTime);
  }

  String getTimeRangeFormat(TimeRange timeRange) {
    final startTimeFormat = DateFormat('h:mm');
    final endTimeFormat = DateFormat('h:mm a');
    return "${startTimeFormat.format(timeRange.startsAt)} - ${endTimeFormat.format(timeRange.endsAt)}";
  }
}
