import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kasado/logic/shared/extensions.dart';
import 'package:kasado/model/time_range/time_range.dart';

final kasadoUtilsProvider = Provider.autoDispose(
  (ref) => KasadoUtils(ref.read),
);

class KasadoUtils {
  KasadoUtils(this.read);

  final Reader read;

  TimeRange getNextNearestTimeSlot(List<TimeRange> timeSlots) {
    const hour = Duration(hours: 1);
    final now = DateTime.now();
    final sortedTimeSlots = timeSlots
      ..sort((a, b) => a.startsAt.compareTo(b.startsAt));

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

    // If none in the list are viable then return the first slot the next day
    final firstSlot = sortedTimeSlots.first;
    return TimeRange(
      startsAt: firstSlot.startsAt.copyWith(month: now.month, day: now.day + 1),
      endsAt: firstSlot.endsAt.copyWith(month: now.month, day: now.day + 1),
    );
  }

  bool isCurrentSlotClosed(TimeRange timeRange) {
    final now = DateTime.now();
    return timeRange.startsAt.difference(now).abs() >
        timeRange.endsAt.difference(now).abs();
  }

  String getSlotIdFromTimeSlot(TimeRange timeRange) {
    return "${timeRange.startsAt.toIso8601String()}-${timeRange.endsAt.toIso8601String()}";
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
