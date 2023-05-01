import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kasado/model/game_stat_entry/game_stat_entry.dart';
import 'package:kasado/model/stats/stats.dart';
import 'package:time/time.dart';

part 'game_stats.freezed.dart';
part 'game_stats.g.dart';

@freezed
class GameStats with _$GameStats {
  const GameStats._();
  const factory GameStats({
    required String id,
    required DateTime recordedAt,
    required Map<String, Stats> homeTeamStats,
    required Map<String, Stats> awayTeamStats,
    @Default([]) List<GameStatEntry> statEntryHistory,
    @Default(false) bool isLive,
    int? remainingMsOnPaused, // 900000 milliseconds == 15 mins
    // Set as nullable for backward compatibility (property nonexistent before)
    DateTime? endsAt,
  }) = _GameStats;

  const factory GameStats.scoreOnly({
    required String id,
    required DateTime recordedAt,
    required Map<String, Stats> homeTeamStats,
    required Map<String, Stats> awayTeamStats,
    @Default(false) bool isLive,
    int? remainingMsOnPaused, // 900000 milliseconds == 15 mins
    // Set as nullable for backward compatibility (property nonexistent before)
    DateTime? endsAt,
    @Default(0) int homeTeamScore,
    @Default(0) int awayTeamScore,
  }) = GameStatsScoreOnly;

  Duration? get remainingOnPaused => remainingMsOnPaused?.milliseconds;

  bool get isPaused => remainingMsOnPaused != null;

  int get homeScore {
    return map(
      (gameStats) => gameStats.homeTeamStats.values
          .map((statEntry) => statEntry.points)
          .reduce((a, b) => a + b),
      scoreOnly: (gameStats) => gameStats.homeTeamScore,
    );
  }

  int get awayScore {
    return map(
      (gameStats) => gameStats.awayTeamStats.values
          .map((statEntry) => statEntry.points)
          .reduce((a, b) => a + b),
      scoreOnly: (gameStats) => gameStats.awayTeamScore,
    );
  }

  bool get isHomeWinner => homeScore > awayScore;

  factory GameStats.fromJson(Map<String, dynamic> json) =>
      _$GameStatsFromJson(json);
}
