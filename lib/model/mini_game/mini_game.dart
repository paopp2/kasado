import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kasado/model/stats/stats.dart';

part 'mini_game.freezed.dart';
part 'mini_game.g.dart';

@freezed
class MiniGame with _$MiniGame {
  const MiniGame._();
  const factory MiniGame({
    required Map<String, Stats> homeTeamStats,
    required Map<String, Stats> awayTeamStats,
    bool? isHomeWinner,
  }) = _MiniGame;

  factory MiniGame.fromJson(Map<String, dynamic> json) =>
      _$MiniGameFromJson(json);
}
