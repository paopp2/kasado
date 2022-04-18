// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GameStats _$$_GameStatsFromJson(Map<String, dynamic> json) => _$_GameStats(
      id: json['id'] as String,
      recordedAt: DateTime.parse(json['recordedAt'] as String),
      homeTeamStats: (json['homeTeamStats'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Stats.fromJson(e as Map<String, dynamic>)),
      ),
      awayTeamStats: (json['awayTeamStats'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Stats.fromJson(e as Map<String, dynamic>)),
      ),
      isLive: json['isLive'] as bool? ?? false,
      remainingMsOnPaused: json['remainingMsOnPaused'] as int?,
      endsAt: json['endsAt'] == null
          ? null
          : DateTime.parse(json['endsAt'] as String),
    );

Map<String, dynamic> _$$_GameStatsToJson(_$_GameStats instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recordedAt': instance.recordedAt.toIso8601String(),
      'homeTeamStats':
          instance.homeTeamStats.map((k, e) => MapEntry(k, e.toJson())),
      'awayTeamStats':
          instance.awayTeamStats.map((k, e) => MapEntry(k, e.toJson())),
      'isLive': instance.isLive,
      'remainingMsOnPaused': instance.remainingMsOnPaused,
      'endsAt': instance.endsAt?.toIso8601String(),
    };
