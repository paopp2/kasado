// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'court_sched.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CourtSched _$$_CourtSchedFromJson(Map<String, dynamic> json) =>
    _$_CourtSched(
      weekdayIndex: json['weekdayIndex'] as int,
      timeRange: TimeRange.fromJson(json['timeRange'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CourtSchedToJson(_$_CourtSched instance) =>
    <String, dynamic>{
      'weekdayIndex': instance.weekdayIndex,
      'timeRange': instance.timeRange.toJson(),
    };
