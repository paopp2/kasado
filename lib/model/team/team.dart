import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';

part 'team.freezed.dart';
part 'team.g.dart';

@freezed
class Team with _$Team {
  const Team._();
  const factory Team({
    required String id,
    required KasadoUser teamCaptain,
    @Default([]) List<KasadoUser> players,
    CourtSlot? reservedAt,
  }) = _Team;

  static int get maxPlayerCount => 5;

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
}
