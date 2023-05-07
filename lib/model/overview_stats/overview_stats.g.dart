// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overview_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OverviewStats _$$_OverviewStatsFromJson(Map<String, dynamic> json) =>
    _$_OverviewStats(
      KasadoUser.fromJson(json['player'] as Map<String, dynamic>),
      json['seasonId'] as String,
      mmr: json['mmr'] as num? ?? 0,
      totalThreePA: json['totalThreePA'] as num? ?? 0,
      totalThreePM: json['totalThreePM'] as num? ?? 0,
      totalTwoPA: json['totalTwoPA'] as num? ?? 0,
      totalTwoPM: json['totalTwoPM'] as num? ?? 0,
      totalFta: json['totalFta'] as num? ?? 0,
      totalFtm: json['totalFtm'] as num? ?? 0,
      totalOReb: json['totalOReb'] as num? ?? 0,
      totalDReb: json['totalDReb'] as num? ?? 0,
      totalAst: json['totalAst'] as num? ?? 0,
      totalStl: json['totalStl'] as num? ?? 0,
      totalBlk: json['totalBlk'] as num? ?? 0,
      totalTO: json['totalTO'] as num? ?? 0,
      totalWins: json['totalWins'] as num? ?? 0,
      totalPlusMinus: json['totalPlusMinus'] as num? ?? 0,
      gamesPlayed: json['gamesPlayed'] as num? ?? 0,
      gamesPlayedNoStats: json['gamesPlayedNoStats'] as num? ?? 0,
      isHiddenFromRankings: json['isHiddenFromRankings'] as bool? ?? false,
    );

Map<String, dynamic> _$$_OverviewStatsToJson(_$_OverviewStats instance) =>
    <String, dynamic>{
      'player': instance.player.toJson(),
      'seasonId': instance.seasonId,
      'mmr': instance.mmr,
      'totalThreePA': instance.totalThreePA,
      'totalThreePM': instance.totalThreePM,
      'totalTwoPA': instance.totalTwoPA,
      'totalTwoPM': instance.totalTwoPM,
      'totalFta': instance.totalFta,
      'totalFtm': instance.totalFtm,
      'totalOReb': instance.totalOReb,
      'totalDReb': instance.totalDReb,
      'totalAst': instance.totalAst,
      'totalStl': instance.totalStl,
      'totalBlk': instance.totalBlk,
      'totalTO': instance.totalTO,
      'totalWins': instance.totalWins,
      'totalPlusMinus': instance.totalPlusMinus,
      'gamesPlayed': instance.gamesPlayed,
      'gamesPlayedNoStats': instance.gamesPlayedNoStats,
      'isHiddenFromRankings': instance.isHiddenFromRankings,
    };
