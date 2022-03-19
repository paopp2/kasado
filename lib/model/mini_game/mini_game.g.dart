// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mini_game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MiniGame _$$_MiniGameFromJson(Map<String, dynamic> json) => _$_MiniGame(
      homeTeamStats: (json['homeTeamStats'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Stats.fromJson(e as Map<String, dynamic>)),
      ),
      awayTeamStats: (json['awayTeamStats'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Stats.fromJson(e as Map<String, dynamic>)),
      ),
      isHomeWinner: json['isHomeWinner'] as bool?,
    );

Map<String, dynamic> _$$_MiniGameToJson(_$_MiniGame instance) =>
    <String, dynamic>{
      'homeTeamStats':
          instance.homeTeamStats.map((k, e) => MapEntry(k, e.toJson())),
      'awayTeamStats':
          instance.awayTeamStats.map((k, e) => MapEntry(k, e.toJson())),
      'isHomeWinner': instance.isHomeWinner,
    };
