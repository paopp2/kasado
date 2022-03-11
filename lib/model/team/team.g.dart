// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Team _$$_TeamFromJson(Map<String, dynamic> json) => _$_Team(
      id: json['id'] as String,
      teamCaptain:
          KasadoUser.fromJson(json['teamCaptain'] as Map<String, dynamic>),
      players: (json['players'] as List<dynamic>?)
              ?.map((e) => KasadoUser.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      reservedAt: json['reservedAt'] == null
          ? null
          : CourtSlot.fromJson(json['reservedAt'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TeamToJson(_$_Team instance) => <String, dynamic>{
      'id': instance.id,
      'teamCaptain': instance.teamCaptain.toJson(),
      'players': instance.players.map((e) => e.toJson()).toList(),
      'reservedAt': instance.reservedAt?.toJson(),
    };
