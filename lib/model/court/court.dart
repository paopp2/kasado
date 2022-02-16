import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kasado/model/time_range/time_range.dart';

part 'court.freezed.dart';
part 'court.g.dart';

@freezed
class Court with _$Court {
  const factory Court({
    required String id,
    required String name,
    required String photoUrl,
    required double ticketPrice,
    required List<TimeRange> allowedTimeSlots,
  }) = _Court;

  factory Court.fromJson(Map<String, dynamic> json) => _$CourtFromJson(json);
}
