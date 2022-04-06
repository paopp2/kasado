import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:kasado/model/ticket/ticket.dart';

part 'team.freezed.dart';
part 'team.g.dart';

@freezed
class Team with _$Team {
  const Team._();
  const factory Team({
    required String id,
    required KasadoUser teamCaptain,
    @Default('') String customTeamName,
    @Default([]) List<KasadoUser> players,
    @Default([]) List<Ticket> tickets,
  }) = _Team;

  String get teamName => (customTeamName.isNotEmpty)
      ? customTeamName
      : "Team ${teamCaptain.displayName!.split(' ').first.toUpperCase()}";

  static int get maxPlayerCount => 5;

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
}
