// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Ticket _$$_TicketFromJson(Map<String, dynamic> json) => _$_Ticket(
      id: json['id'] as String,
      courtName: json['courtName'] as String,
      courtSlot: CourtSlot.fromJson(json['courtSlot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TicketToJson(_$_Ticket instance) => <String, dynamic>{
      'id': instance.id,
      'courtName': instance.courtName,
      'courtSlot': instance.courtSlot.toJson(),
    };
