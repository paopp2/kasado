// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notif.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Notif _$$_NotifFromJson(Map<String, dynamic> json) => _$_Notif(
      id: json['id'] as String,
      title: json['title'] as String? ?? '',
      body: json['body'] as String,
      yesCount: json['yesCount'] as int? ?? 0,
      noCount: json['noCount'] as int? ?? 0,
      sender: json['sender'] == null
          ? null
          : KasadoUser.fromJson(json['sender'] as Map<String, dynamic>),
      sendToAll: json['sendToAll'] as bool? ?? false,
      getFeedback: json['getFeedback'] as bool? ?? false,
      recipientIds: (json['recipientIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          0,
      sentAt: DateTime.parse(json['sentAt'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_NotifToJson(_$_Notif instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'yesCount': instance.yesCount,
      'noCount': instance.noCount,
      'sender': instance.sender?.toJson(),
      'sendToAll': instance.sendToAll,
      'getFeedback': instance.getFeedback,
      'recipientIds': instance.recipientIds,
      'sentAt': instance.sentAt.toIso8601String(),
      'runtimeType': instance.$type,
    };

_$NotifRef _$$NotifRefFromJson(Map<String, dynamic> json) => _$NotifRef(
      id: json['id'] as String,
      isRead: json['isRead'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NotifRefToJson(_$NotifRef instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isRead': instance.isRead,
      'runtimeType': instance.$type,
    };
