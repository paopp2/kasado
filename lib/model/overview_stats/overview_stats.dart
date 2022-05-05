import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'overview_stats.freezed.dart';
part 'overview_stats.g.dart';

@freezed
class OverviewStats with _$OverviewStats {
  const OverviewStats._();
  const factory OverviewStats({
    @Default(0) int totalThreePA,
    @Default(0) int totalThreePM,
    @Default(0) int totalTwoPA,
    @Default(0) int totalTwoPM,
    @Default(0) int totalFta,
    @Default(0) int totalFtm,
    @Default(0) int totalOReb,
    @Default(0) int totalDReb,
    @Default(0) int totalAst,
    @Default(0) int totalStl,
    @Default(0) int totalBlk,
    @Default(0) int totalTO,
    @Default(0) int totalWins,
    @Default(0) int gamesPlayed,
  }) = _OverviewStats;

  int get totalPoints => (totalThreePM * 3) + (totalTwoPM * 2) + totalFtm;
  int get totalAttempts => totalThreePA + totalTwoPA;
  int get totalMade => totalThreePM + totalTwoPM;
  int get totalRebounds => totalOReb + totalDReb;
  double get aveFgPercent => (totalMade / totalAttempts) * 100;
  double get aveThreePtPercent => (totalThreePM / totalThreePA) * 100;
  double get aveFtPercent => (totalFtm / totalFta) * 100;
  double get avePointsPerGame => totalPoints / gamesPlayed;
  double get aveAssistsPerGame => totalAst / gamesPlayed;
  double get aveReboundsPerGame => totalRebounds / gamesPlayed;
  double get aveBlocksPerGame => totalBlk / gamesPlayed;
  double get aveStlPerGame => totalStl / gamesPlayed;
  int get totalLosses => gamesPlayed - totalWins;
  double get winPercent => (totalWins / gamesPlayed) * 100;
  int get winLossDifference => totalWins - totalLosses;
  double get effRating =>
      (totalPoints +
          totalAst +
          totalRebounds +
          totalBlk +
          totalStl -
          (totalAttempts - totalMade) -
          (totalFta - totalFtm)) /
      gamesPlayed;

  factory OverviewStats.fromJson(Map<String, dynamic> json) =>
      _$OverviewStatsFromJson(json);
}
