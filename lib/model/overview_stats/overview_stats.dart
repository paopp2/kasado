import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kasado/constants/enums/stat_type.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';

part 'overview_stats.freezed.dart';
part 'overview_stats.g.dart';

@freezed
class OverviewStats with _$OverviewStats {
  const OverviewStats._();
  const factory OverviewStats(
    KasadoUser? player, {
    @Default(0) int mmr,
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
    @Default(0) int totalPlusMinus,
    @Default(0) int gamesPlayed,
    @Default(0) int gamesPlayedNoStats,
    @Default(false) bool isHiddenFromRankings,
  }) = _OverviewStats;

  int get totalPoints => (totalThreePM * 3) + (totalTwoPM * 2) + totalFtm;
  int get totalAttempts => totalThreePA + totalTwoPA;
  int get totalMade => totalThreePM + totalTwoPM;
  int get totalRebounds => totalOReb + totalDReb;
  int get totalGamesPlayed => gamesPlayed + gamesPlayedNoStats;

  double get aveFgPercent => (totalMade / totalAttempts) * 100;
  double get aveThreePtPercent => (totalThreePM / totalThreePA) * 100;
  double get aveFtPercent => (totalFtm / totalFta) * 100;
  double get avePointsPerGame => totalPoints / gamesPlayed;
  double get aveAssistsPerGame => totalAst / gamesPlayed;
  double get aveReboundsPerGame => totalRebounds / gamesPlayed;
  double get aveBlocksPerGame => totalBlk / gamesPlayed;
  double get aveStlPerGame => totalStl / gamesPlayed;
  double get avePlusMinus => totalPlusMinus / totalGamesPlayed;

  int get totalLosses => totalGamesPlayed - totalWins;
  double get winPercent => (totalWins / totalGamesPlayed) * 100;
  int get winLossDifference => totalWins - totalLosses;
  double get effRating =>
      (totalPoints +
          totalAst +
          totalRebounds +
          totalBlk +
          totalStl -
          (totalAttempts - totalMade) -
          (totalFta - totalFtm) -
          totalTO) /
      gamesPlayed;

  String getStatValueAsString(StatType statType) {
    final double statValue;
    switch (statType) {
      case StatType.mmr:
        statValue = mmr.toDouble();
        break;
      case StatType.effRating:
        statValue = effRating;
        break;
      case StatType.standing:
        statValue = winPercent;
        break;
      case StatType.ptsPerGame:
        statValue = avePointsPerGame;
        break;
      case StatType.astPerGame:
        statValue = aveAssistsPerGame;
        break;
      case StatType.rebPerGame:
        statValue = aveReboundsPerGame;
        break;
      case StatType.blkPerGame:
        statValue = aveBlocksPerGame;
        break;
      case StatType.stlPerGame:
        statValue = aveStlPerGame;
        break;
      case StatType.fgPercent:
        statValue = aveFgPercent;
        break;
      case StatType.threePtPercent:
        statValue = aveThreePtPercent;
        break;
      case StatType.threePtMade:
        statValue = totalThreePM.toDouble();
        break;
    }

    return (statType == StatType.standing)
        ? '$totalWins - $totalLosses'
        : (statType == StatType.threePtMade || statType == StatType.mmr)
            ? statValue.toStringAsFixed(0) // No decimals
            : statValue.isNaN
                ? '-'
                : statValue.toStringAsFixed(1);
  }

  factory OverviewStats.fromJson(Map<String, dynamic> json) =>
      _$OverviewStatsFromJson(json);
}
