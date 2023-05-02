// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overview_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OverviewStats _$$_OverviewStatsFromJson(Map<String, dynamic> json) =>
    _$_OverviewStats(
      json['player'] == null
          ? null
          : KasadoUser.fromJson(json['player'] as Map<String, dynamic>),
      mmr: json['mmr'] as int? ?? 0,
      totalThreePA: json['totalThreePA'] as int? ?? 0,
      totalThreePM: json['totalThreePM'] as int? ?? 0,
      totalTwoPA: json['totalTwoPA'] as int? ?? 0,
      totalTwoPM: json['totalTwoPM'] as int? ?? 0,
      totalFta: json['totalFta'] as int? ?? 0,
      totalFtm: json['totalFtm'] as int? ?? 0,
      totalOReb: json['totalOReb'] as int? ?? 0,
      totalDReb: json['totalDReb'] as int? ?? 0,
      totalAst: json['totalAst'] as int? ?? 0,
      totalStl: json['totalStl'] as int? ?? 0,
      totalBlk: json['totalBlk'] as int? ?? 0,
      totalTO: json['totalTO'] as int? ?? 0,
      totalWins: json['totalWins'] as int? ?? 0,
      totalPlusMinus: json['totalPlusMinus'] as int? ?? 0,
      gamesPlayed: json['gamesPlayed'] as int? ?? 0,
      gamesPlayedNoStats: json['gamesPlayedNoStats'] as int? ?? 0,
      isHiddenFromRankings: json['isHiddenFromRankings'] as bool? ?? false,
    );

Map<String, dynamic> _$$_OverviewStatsToJson(_$_OverviewStats instance) =>
    <String, dynamic>{
      'player': instance.player?.toJson(),
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
