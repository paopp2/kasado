// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GameStats _$$_GameStatsFromJson(Map<String, dynamic> json) => _$_GameStats(
      id: json['id'] as String,
      homeTeamStats: (json['homeTeamStats'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Stats.fromJson(e as Map<String, dynamic>)),
      ),
      awayTeamStats: (json['awayTeamStats'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Stats.fromJson(e as Map<String, dynamic>)),
      ),
      isHomeWinner: json['isHomeWinner'] as bool?,
    );

Map<String, dynamic> _$$_GameStatsToJson(_$_GameStats instance) =>
    <String, dynamic>{
      'id': instance.id,
      'homeTeamStats':
          instance.homeTeamStats.map((k, e) => MapEntry(k, e.toJson())),
      'awayTeamStats':
          instance.awayTeamStats.map((k, e) => MapEntry(k, e.toJson())),
      'isHomeWinner': instance.isHomeWinner,
    };
