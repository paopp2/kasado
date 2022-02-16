import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';

part 'court_slot.freezed.dart';
part 'court_slot.g.dart';

@freezed
class CourtSlot with _$CourtSlot {
  const factory CourtSlot({
    required String courtId,
    required String courtName,
    required String courtPhotoUrl,
    required List<KasadoUser> players,
    required double ticketPrice,
  }) = _CourtSlot;

  factory CourtSlot.fromJson(Map<String, dynamic> json) =>
      _$CourtSlotFromJson(json);
}
