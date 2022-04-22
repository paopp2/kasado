import 'dart:core';

import 'package:kasado/model/time_range/time_range.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

// ignore: prefer-match-file-name
class WeekdayIndex {
  static const mon = 0;
  static const tue = 1;
  static const wed = 2;
  static const thu = 3;
  static const fri = 4;
  static const sat = 5;
  static const sun = 6;
}

final weekdaysStringList = [
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
  "Sunday",
];

final bigBang = DateTime(2022, 3, 1);

// In accordance with ISO 8601 wherein week starts with Monday
final weekdaysList = [
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
    startsAt: DateTime(2022, 3, 1, 6, 0),
    endsAt: DateTime(2022, 3, 1, 8, 0),
  ),
  TimeRange(
    startsAt: DateTime(2022, 3, 1, 8, 0),
    endsAt: DateTime(2022, 3, 1, 10, 0),
  ),
  TimeRange(
    startsAt: DateTime(2022, 3, 1, 10, 0),
    endsAt: DateTime(2022, 3, 1, 12, 0),
  ),
  TimeRange(
    startsAt: DateTime(2022, 3, 1, 12, 0),
    endsAt: DateTime(2022, 3, 1, 14, 0),
  ),
  TimeRange(
    startsAt: DateTime(2022, 3, 1, 14, 0),
    endsAt: DateTime(2022, 3, 1, 16, 0),
  ),
  TimeRange(
    startsAt: DateTime(2022, 3, 1, 16, 0),
    endsAt: DateTime(2022, 3, 1, 18, 0),
  ),
  TimeRange(
    startsAt: DateTime(2022, 3, 1, 18, 0),
    endsAt: DateTime(2022, 3, 1, 20, 0),
  ),
  TimeRange(
    startsAt: DateTime(2022, 3, 1, 20, 0),
    endsAt: DateTime(2022, 3, 1, 22, 0),
  ),
  TimeRange(
    startsAt: DateTime(2022, 3, 1, 5, 0),
    endsAt: DateTime(2022, 3, 1, 7, 0),
  ),
  TimeRange(
    startsAt: DateTime(2022, 3, 1, 7, 0),
    endsAt: DateTime(2022, 3, 1, 9, 0),
  ),
  TimeRange(
    startsAt: DateTime(2022, 3, 1, 9, 0),
    endsAt: DateTime(2022, 3, 1, 11, 0),
  ),
  TimeRange(
    startsAt: DateTime(2022, 3, 1, 11, 0),
    endsAt: DateTime(2022, 3, 1, 13, 0),
  ),
  TimeRange(
    startsAt: DateTime(2022, 3, 1, 13, 0),
    endsAt: DateTime(2022, 3, 1, 15, 0),
  ),
  TimeRange(
    startsAt: DateTime(2022, 3, 1, 15, 0),
    endsAt: DateTime(2022, 3, 1, 17, 0),
  ),
  TimeRange(
    startsAt: DateTime(2022, 3, 1, 17, 0),
    endsAt: DateTime(2022, 3, 1, 19, 0),
  ),
  TimeRange(
    startsAt: DateTime(2022, 3, 1, 19, 0),
    endsAt: DateTime(2022, 3, 1, 21, 0),
  ),
];
