import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_range.freezed.dart';
part 'time_range.g.dart';

@freezed
class TimeRange with _$TimeRange {
  const TimeRange._();
  const factory TimeRange({
    /// DateTime is used for ease of serialization but the 'Date' will be disregarded
    required DateTime startsAt,
    required DateTime endsAt,
  }) = _TimeRange;

  TimeOfDay get startTime => TimeOfDay.fromDateTime(startsAt);
  TimeOfDay get endTime => TimeOfDay.fromDateTime(endsAt);

  factory TimeRange.fromJson(Map<String, dynamic> json) =>
      _$TimeRangeFromJson(json);
}
