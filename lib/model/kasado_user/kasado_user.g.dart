// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kasado_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KasadoUser _$$_KasadoUserFromJson(Map<String, dynamic> json) =>
    _$_KasadoUser(
      id: json['id'] as String,
      displayName: json['displayName'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      photoUrl: json['photoUrl'] as String?,
      teamName: json['teamName'] as String? ?? '',
      hasPaid: json['hasPaid'] as bool? ?? false,
      mvpVoteCount: json['mvpVoteCount'] as int? ?? 0,
      votedMvpId: json['votedMvpId'] as String? ?? '',
    );

Map<String, dynamic> _$$_KasadoUserToJson(_$_KasadoUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'photoUrl': instance.photoUrl,
      'teamName': instance.teamName,
      'hasPaid': instance.hasPaid,
      'mvpVoteCount': instance.mvpVoteCount,
      'votedMvpId': instance.votedMvpId,
    };
