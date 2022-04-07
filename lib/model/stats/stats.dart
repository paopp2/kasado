import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';

part 'stats.freezed.dart';
part 'stats.g.dart';

@freezed
class Stats with _$Stats {
  const Stats._();
  const factory Stats({
    required KasadoUser player,
    required CourtSlot courtSlot,
    @Default(0) int threePA,
    @Default(0) int threePM,
    @Default(0) int twoPA,
    @Default(0) int twoPM,
    @Default(0) int ftA,
    @Default(0) int ftM,
    @Default(0) int oReb,
    @Default(0) int dReb,
    @Default(0) int ast,
    @Default(0) int stl,
    @Default(0) int blk,
    bool? hasWonGame,
  }) = _Stats;

  int get points => (threePM * 3) + (twoPM * 2) + ftM;
  int get totalAttempts => threePA + twoPA;
  int get totalMade => threePM + twoPM;
  int get rebounds => oReb + dReb;
  double get threePtPercent => (threePM / threePA) * 100;
  double get fgPercent => (totalMade / totalAttempts) * 100;
  double get ftPercent => (ftM / ftA) * 100;

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
}

enum StatType {
  winRate,
  ptsPerGame,
  astPerGame,
  rebPerGame,
}
