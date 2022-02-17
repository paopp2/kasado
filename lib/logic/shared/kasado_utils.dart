import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kasado/model/time_range/time_range.dart';

final kasadoUtilsProvider = Provider.autoDispose(
  (ref) => KasadoUtils(ref.read),
);

class KasadoUtils {
  KasadoUtils(this.read);

  final Reader read;

  TimeRange getNextNearestTimeSlot(List<TimeRange> timeSlots) {
    final now = DateTime.now();
    return timeSlots.reduce((a, b) {
      final TimeOfDay aStart = a.startTime;
      final TimeOfDay aEnd = a.endTime;
      final TimeOfDay bStart = b.startTime;
      final TimeOfDay bEnd = b.endTime;

      final aStartDateTime =
          DateTime(now.year, now.month, now.day, aStart.hour, aStart.minute);
      final aEndDateTime =
          DateTime(now.year, now.month, now.day, aEnd.hour, aEnd.minute);
      final bStartDateTime =
          DateTime(now.year, now.month, now.day, bStart.hour, bStart.minute);
      final bEndDateTime =
          DateTime(now.year, now.month, now.day, bEnd.hour, bEnd.minute);

      final aAdjustedTimeRange = TimeRange(
        startsAt: aStartDateTime,
        endsAt: aEndDateTime,
      );
      final bAdjustedTimeRange = TimeRange(
        startsAt: bStartDateTime,
        endsAt: bEndDateTime,
      );

      if (aEndDateTime.isBefore(now)) return bAdjustedTimeRange;

      return (now.difference(aStartDateTime).abs() <
              now.difference(bStartDateTime).abs())
          ? aAdjustedTimeRange
          : bAdjustedTimeRange;
    });
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
