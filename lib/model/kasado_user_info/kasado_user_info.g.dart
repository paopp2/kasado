// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kasado_user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KasadoUserInfo _$$_KasadoUserInfoFromJson(Map<String, dynamic> json) =>
    _$_KasadoUserInfo(
      id: json['id'] as String,
      user: KasadoUser.fromJson(json['user'] as Map<String, dynamic>),
      isAdmin: json['isAdmin'] as bool? ?? false,
      isSuperAdmin: json['isSuperAdmin'] as bool? ?? false,
      pondo: (json['pondo'] as num?)?.toDouble() ?? 0,
      isTeamCaptain: json['isTeamCaptain'] as bool? ?? false,
      overviewStats: json['overviewStats'] == null
          ? const OverviewStats()
          : OverviewStats.fromJson(
              json['overviewStats'] as Map<String, dynamic>),
      teamId: json['teamId'] as String?,
      tickets: (json['tickets'] as List<dynamic>?)
              ?.map((e) => Ticket.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_KasadoUserInfoToJson(_$_KasadoUserInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user.toJson(),
      'isAdmin': instance.isAdmin,
      'isSuperAdmin': instance.isSuperAdmin,
      'pondo': instance.pondo,
      'isTeamCaptain': instance.isTeamCaptain,
      'overviewStats': instance.overviewStats.toJson(),
      'teamId': instance.teamId,
      'tickets': instance.tickets.map((e) => e.toJson()).toList(),
    };
