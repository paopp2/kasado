import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'overview_stats.freezed.dart';
part 'overview_stats.g.dart';

@freezed
class OverviewStats with _$OverviewStats {
  const OverviewStats._();
  const factory OverviewStats({
    @Default(0) int mvpVoteCount,
  }) = _OverviewStats;

  factory OverviewStats.fromJson(Map<String, dynamic> json) =>
      _$OverviewStatsFromJson(json);
}
