// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_range.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimeRange _$TimeRangeFromJson(Map<String, dynamic> json) {
  return _TimeRange.fromJson(json);
}

/// @nodoc
mixin _$TimeRange {
  /// DateTime is used for ease of serialization but the 'Date' will be disregarded
  DateTime get startsAt => throw _privateConstructorUsedError;
  DateTime get endsAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeRangeCopyWith<TimeRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeRangeCopyWith<$Res> {
  factory $TimeRangeCopyWith(TimeRange value, $Res Function(TimeRange) then) =
      _$TimeRangeCopyWithImpl<$Res, TimeRange>;
  @useResult
  $Res call({DateTime startsAt, DateTime endsAt});
}

/// @nodoc
class _$TimeRangeCopyWithImpl<$Res, $Val extends TimeRange>
    implements $TimeRangeCopyWith<$Res> {
  _$TimeRangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startsAt = null,
    Object? endsAt = null,
  }) {
    return _then(_value.copyWith(
      startsAt: null == startsAt
          ? _value.startsAt
          : startsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endsAt: null == endsAt
          ? _value.endsAt
          : endsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimeRangeCopyWith<$Res> implements $TimeRangeCopyWith<$Res> {
  factory _$$_TimeRangeCopyWith(
          _$_TimeRange value, $Res Function(_$_TimeRange) then) =
      __$$_TimeRangeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime startsAt, DateTime endsAt});
}

/// @nodoc
class __$$_TimeRangeCopyWithImpl<$Res>
    extends _$TimeRangeCopyWithImpl<$Res, _$_TimeRange>
    implements _$$_TimeRangeCopyWith<$Res> {
  __$$_TimeRangeCopyWithImpl(
      _$_TimeRange _value, $Res Function(_$_TimeRange) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startsAt = null,
    Object? endsAt = null,
  }) {
    return _then(_$_TimeRange(
      startsAt: null == startsAt
          ? _value.startsAt
          : startsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endsAt: null == endsAt
          ? _value.endsAt
          : endsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimeRange extends _TimeRange {
  const _$_TimeRange({required this.startsAt, required this.endsAt})
      : super._();

  factory _$_TimeRange.fromJson(Map<String, dynamic> json) =>
      _$$_TimeRangeFromJson(json);

  /// DateTime is used for ease of serialization but the 'Date' will be disregarded
  @override
  final DateTime startsAt;
  @override
  final DateTime endsAt;

  @override
  String toString() {
    return 'TimeRange(startsAt: $startsAt, endsAt: $endsAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimeRange &&
            (identical(other.startsAt, startsAt) ||
                other.startsAt == startsAt) &&
            (identical(other.endsAt, endsAt) || other.endsAt == endsAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, startsAt, endsAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimeRangeCopyWith<_$_TimeRange> get copyWith =>
      __$$_TimeRangeCopyWithImpl<_$_TimeRange>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimeRangeToJson(
      this,
    );
  }
}

abstract class _TimeRange extends TimeRange {
  const factory _TimeRange(
      {required final DateTime startsAt,
      required final DateTime endsAt}) = _$_TimeRange;
  const _TimeRange._() : super._();

  factory _TimeRange.fromJson(Map<String, dynamic> json) =
      _$_TimeRange.fromJson;

  @override

  /// DateTime is used for ease of serialization but the 'Date' will be disregarded
  DateTime get startsAt;
  @override
  DateTime get endsAt;
  @override
  @JsonKey(ignore: true)
  _$$_TimeRangeCopyWith<_$_TimeRange> get copyWith =>
      throw _privateConstructorUsedError;
}
