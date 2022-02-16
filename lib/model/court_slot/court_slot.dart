import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:kasado/model/time_range/time_range.dart';

part 'court_slot.freezed.dart';
part 'court_slot.g.dart';

@freezed
class CourtSlot with _$CourtSlot {
  const CourtSlot._();
  const factory CourtSlot({
    required String courtId,
    required List<KasadoUser> players,
    required TimeRange timeRange,
  }) = _CourtSlot;

  int get playerCount => players.length;
  String get getSlotId =>
      "${timeRange.startsAt.toIso8601String()}-${timeRange.endsAt.toIso8601String()}";

  factory CourtSlot.fromJson(Map<String, dynamic> json) =>
      _$CourtSlotFromJson(json);
}
