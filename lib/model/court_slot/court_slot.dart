import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';

part 'court_slot.freezed.dart';
part 'court_slot.g.dart';

@freezed
class CourtSlot with _$CourtSlot {
  const CourtSlot._();
  const factory CourtSlot({
    required Court court,
    required List<KasadoUser> players,
    required DateTime startsAt,
    required DateTime endsAt,
  }) = _CourtSlot;

  int get playerCount => players.length;

  factory CourtSlot.fromJson(Map<String, dynamic> json) =>
      _$CourtSlotFromJson(json);
}
