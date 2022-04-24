import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kasado/model/court_sched/court_sched.dart';

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
    required List<String> adminIds,
    @Default([]) List<CourtSched> courtScheds,
    @Default(30) int maxPerSlot,
    @Default(15) int minPerSlot,

    /// Special courtScheds are courtScheds wherein all the other slots with the
    /// same day as them are hidden. In other words, only the specialCourtScheds
    /// are shown during the day that they occur
    //
    // These are in use with Syncfusion's calendar widget and its
    // 'recurrenceExceptionDates' feature. Useful when admin has to hide some
    // slots from the end user
    @Default([]) List<CourtSched> specialCourtScheds,
  }) = _Court;

  factory Court.fromJson(Map<String, dynamic> json) => _$CourtFromJson(json);
}
