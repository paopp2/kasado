import 'dart:core';

import 'package:kasado/model/time_range/time_range.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

// In accordance with ISO 8601 wherein week starts with Monday
final indexToWeekDay = [
  WeekDays.monday,
  WeekDays.tuesday,
  WeekDays.wednesday,
  WeekDays.thursday,
  WeekDays.friday,
  WeekDays.saturday,
  WeekDays.sunday,
];

final allowedTimeRanges = [
  TimeRange(
    startsAt: DateTime(2022, 1, 1, 6, 0),
    endsAt: DateTime(2022, 1, 1, 8, 0),
  ),
  TimeRange(
    startsAt: DateTime(2022, 1, 1, 8, 0),
    endsAt: DateTime(2022, 1, 1, 10, 0),
  ),
  TimeRange(
    startsAt: DateTime(2022, 1, 1, 10, 0),
    endsAt: DateTime(2022, 1, 1, 12, 0),
  ),
  TimeRange(
    startsAt: DateTime(2022, 1, 1, 12, 0),
    endsAt: DateTime(2022, 1, 1, 14, 0),
  ),
  TimeRange(
    startsAt: DateTime(2022, 1, 1, 14, 0),
    endsAt: DateTime(2022, 1, 1, 16, 0),
  ),
  TimeRange(
    startsAt: DateTime(2022, 1, 1, 16, 0),
    endsAt: DateTime(2022, 1, 1, 18, 0),
  ),
  TimeRange(
    startsAt: DateTime(2022, 1, 1, 18, 0),
    endsAt: DateTime(2022, 1, 1, 20, 0),
  ),
  TimeRange(
    startsAt: DateTime(2022, 1, 1, 20, 0),
    endsAt: DateTime(2022, 1, 1, 22, 0),
  ),
  TimeRange(
    startsAt: DateTime(2022, 1, 1, 5, 0),
    endsAt: DateTime(2022, 1, 1, 7, 0),
  ),
  TimeRange(
    startsAt: DateTime(2022, 1, 1, 7, 0),
    endsAt: DateTime(2022, 1, 1, 9, 0),
  ),
  TimeRange(
    startsAt: DateTime(2022, 1, 1, 9, 0),
    endsAt: DateTime(2022, 1, 1, 11, 0),
  ),
  TimeRange(
    startsAt: DateTime(2022, 1, 1, 11, 0),
    endsAt: DateTime(2022, 1, 1, 13, 0),
  ),
  TimeRange(
    startsAt: DateTime(2022, 1, 1, 13, 0),
    endsAt: DateTime(2022, 1, 1, 15, 0),
  ),
  TimeRange(
    startsAt: DateTime(2022, 1, 1, 15, 0),
    endsAt: DateTime(2022, 1, 1, 17, 0),
  ),
  TimeRange(
    startsAt: DateTime(2022, 1, 1, 17, 0),
    endsAt: DateTime(2022, 1, 1, 19, 0),
  ),
  TimeRange(
    startsAt: DateTime(2022, 1, 1, 19, 0),
    endsAt: DateTime(2022, 1, 1, 21, 0),
  ),
];
