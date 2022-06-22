import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';

part 'stat_input.freezed.dart';
part 'stat_input.g.dart';

@freezed
class StatInput with _$StatInput {
  const StatInput._();
  const factory StatInput.shotAttempt({
    required KasadoUser? player,
    required KasadoUser? playerWhoAssisted,
    required bool isThree, // isTwo if otherwise
    required bool wasMade,
  }) = ShotAttempt;

  const factory StatInput.block({
    required KasadoUser? player,
  }) = Block;

  const factory StatInput.steal({
    required KasadoUser? player,
  }) = Steal;

  const factory StatInput.ftAttempt({
    required KasadoUser? player,
    required bool wasMade,
  }) = FtAttempt;

  const factory StatInput.rebound({
    required KasadoUser? player,
    required bool isDefensive,
  }) = Rebound;

  const factory StatInput.turnover({
    required KasadoUser? player,
  }) = Turnover;

  factory StatInput.fromJson(Map<String, dynamic> json) =>
      _$StatInputFromJson(json);
}
