import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/time_range/time_range.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

part 'court.freezed.dart';
part 'court.g.dart';

@freezed
class Court with _$Court {
  const factory Court({
    required String id,
    required String name,
    required String address,
    required String photoUrl,
    required double ticketPrice,
    required List<WeekDays> allowedWeekDays,
    required List<TimeRange> allowedTimeSlots,
    required List<String> adminIds,
    @Default([]) List<CourtSlot>? hiddenCourtSlots,
  }) = _Court;

  factory Court.fromJson(Map<String, dynamic> json) => _$CourtFromJson(json);
}
