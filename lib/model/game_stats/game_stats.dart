import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kasado/model/stats/stats.dart';

part 'game_stats.freezed.dart';
part 'game_stats.g.dart';

@freezed
class GameStats with _$GameStats {
  const GameStats._();
  const factory GameStats({
    required String id,
    required Map<String, Stats> homeTeamStats,
    required Map<String, Stats> awayTeamStats,
    bool? isHomeWinner,
  }) = _GameStats;

  factory GameStats.fromJson(Map<String, dynamic> json) =>
      _$GameStatsFromJson(json);
}
