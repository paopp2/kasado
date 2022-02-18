import 'package:kasado/model/time_range/time_range.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

final indexToWeekDay = [
  WeekDays.sunday,
  WeekDays.monday,
  WeekDays.tuesday,
  WeekDays.wednesday,
  WeekDays.thursday,
  WeekDays.friday,
  WeekDays.saturday,
];

final allowedTimeRanges = [
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
];
