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

    /// Special courtSlots are courtSlots wherein all the other slots with the
    /// same day as them are hidden. In other words, only the specialCourtSlots
    /// are shown during the day that they occur
    //
    // These are in use with Syncfusion's calendar widget and its
    // 'recurrenceExceptionDates' feature. Useful when admin has to hide some
    // slots from the end user
    @Default([]) List<CourtSlot>? specialCourtSlots,
  }) = _Court;

  factory Court.fromJson(Map<String, dynamic> json) => _$CourtFromJson(json);
}
