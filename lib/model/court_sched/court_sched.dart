import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kasado/model/time_range/time_range.dart';

part 'court_sched.freezed.dart';
part 'court_sched.g.dart';

@freezed
class CourtSched with _$CourtSched {
  const factory CourtSched({
    required int weekdayIndex,
    required TimeRange timeRange,
  }) = _CourtSched;

  factory CourtSched.fromJson(Map<String, dynamic> json) =>
      _$CourtSchedFromJson(json);
}
