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
      userBio: json['userBio'] == null
          ? null
          : UserBio.fromJson(json['userBio'] as Map<String, dynamic>),
      teamName: json['teamName'] as String? ?? '',
      hasPaid: json['hasPaid'] as bool? ?? false,
    );

Map<String, dynamic> _$$_KasadoUserToJson(_$_KasadoUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'photoUrl': instance.photoUrl,
      'userBio': instance.userBio?.toJson(),
      'teamName': instance.teamName,
      'hasPaid': instance.hasPaid,
    };
