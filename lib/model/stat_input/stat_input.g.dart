// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShotAttempt _$$ShotAttemptFromJson(Map<String, dynamic> json) =>
    _$ShotAttempt(
      player: json['player'] == null
          ? null
          : KasadoUser.fromJson(json['player'] as Map<String, dynamic>),
      playerWhoAssisted: json['playerWhoAssisted'] == null
          ? null
          : KasadoUser.fromJson(
              json['playerWhoAssisted'] as Map<String, dynamic>),
      isThree: json['isThree'] as bool,
      wasMade: json['wasMade'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ShotAttemptToJson(_$ShotAttempt instance) =>
    <String, dynamic>{
      'player': instance.player?.toJson(),
      'playerWhoAssisted': instance.playerWhoAssisted?.toJson(),
      'isThree': instance.isThree,
      'wasMade': instance.wasMade,
      'runtimeType': instance.$type,
    };

_$Block _$$BlockFromJson(Map<String, dynamic> json) => _$Block(
      player: json['player'] == null
          ? null
          : KasadoUser.fromJson(json['player'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$BlockToJson(_$Block instance) => <String, dynamic>{
      'player': instance.player?.toJson(),
      'runtimeType': instance.$type,
    };

_$Steal _$$StealFromJson(Map<String, dynamic> json) => _$Steal(
      player: json['player'] == null
          ? null
          : KasadoUser.fromJson(json['player'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$StealToJson(_$Steal instance) => <String, dynamic>{
      'player': instance.player?.toJson(),
      'runtimeType': instance.$type,
    };

_$FtAttempt _$$FtAttemptFromJson(Map<String, dynamic> json) => _$FtAttempt(
      player: json['player'] == null
          ? null
          : KasadoUser.fromJson(json['player'] as Map<String, dynamic>),
      wasMade: json['wasMade'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FtAttemptToJson(_$FtAttempt instance) =>
    <String, dynamic>{
      'player': instance.player?.toJson(),
      'wasMade': instance.wasMade,
      'runtimeType': instance.$type,
    };

_$Rebound _$$ReboundFromJson(Map<String, dynamic> json) => _$Rebound(
      player: json['player'] == null
          ? null
          : KasadoUser.fromJson(json['player'] as Map<String, dynamic>),
      isDefensive: json['isDefensive'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ReboundToJson(_$Rebound instance) => <String, dynamic>{
      'player': instance.player?.toJson(),
      'isDefensive': instance.isDefensive,
      'runtimeType': instance.$type,
    };

_$Turnover _$$TurnoverFromJson(Map<String, dynamic> json) => _$Turnover(
      player: json['player'] == null
          ? null
          : KasadoUser.fromJson(json['player'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TurnoverToJson(_$Turnover instance) =>
    <String, dynamic>{
      'player': instance.player?.toJson(),
      'runtimeType': instance.$type,
    };
