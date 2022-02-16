// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'time_range.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimeRange _$TimeRangeFromJson(Map<String, dynamic> json) {
  return _TimeRange.fromJson(json);
}

/// @nodoc
class _$TimeRangeTearOff {
  const _$TimeRangeTearOff();

  _TimeRange call({required DateTime startsAt, required DateTime endsAt}) {
    return _TimeRange(
      startsAt: startsAt,
      endsAt: endsAt,
    );
  }

  TimeRange fromJson(Map<String, Object?> json) {
    return TimeRange.fromJson(json);
  }
}

/// @nodoc
const $TimeRange = _$TimeRangeTearOff();

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
      _$TimeRangeCopyWithImpl<$Res>;
  $Res call({DateTime startsAt, DateTime endsAt});
}

/// @nodoc
class _$TimeRangeCopyWithImpl<$Res> implements $TimeRangeCopyWith<$Res> {
  _$TimeRangeCopyWithImpl(this._value, this._then);

  final TimeRange _value;
  // ignore: unused_field
  final $Res Function(TimeRange) _then;

  @override
  $Res call({
    Object? startsAt = freezed,
    Object? endsAt = freezed,
  }) {
    return _then(_value.copyWith(
      startsAt: startsAt == freezed
          ? _value.startsAt
          : startsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endsAt: endsAt == freezed
          ? _value.endsAt
          : endsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$TimeRangeCopyWith<$Res> implements $TimeRangeCopyWith<$Res> {
  factory _$TimeRangeCopyWith(
          _TimeRange value, $Res Function(_TimeRange) then) =
      __$TimeRangeCopyWithImpl<$Res>;
  @override
  $Res call({DateTime startsAt, DateTime endsAt});
}

/// @nodoc
class __$TimeRangeCopyWithImpl<$Res> extends _$TimeRangeCopyWithImpl<$Res>
    implements _$TimeRangeCopyWith<$Res> {
  __$TimeRangeCopyWithImpl(_TimeRange _value, $Res Function(_TimeRange) _then)
      : super(_value, (v) => _then(v as _TimeRange));

  @override
  _TimeRange get _value => super._value as _TimeRange;

  @override
  $Res call({
    Object? startsAt = freezed,
    Object? endsAt = freezed,
  }) {
    return _then(_TimeRange(
      startsAt: startsAt == freezed
          ? _value.startsAt
          : startsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endsAt: endsAt == freezed
          ? _value.endsAt
          : endsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimeRange extends _TimeRange with DiagnosticableTreeMixin {
  const _$_TimeRange({required this.startsAt, required this.endsAt})
      : super._();

  factory _$_TimeRange.fromJson(Map<String, dynamic> json) =>
      _$$_TimeRangeFromJson(json);

  @override

  /// DateTime is used for ease of serialization but the 'Date' will be disregarded
  final DateTime startsAt;
  @override
  final DateTime endsAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimeRange(startsAt: $startsAt, endsAt: $endsAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimeRange'))
      ..add(DiagnosticsProperty('startsAt', startsAt))
      ..add(DiagnosticsProperty('endsAt', endsAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TimeRange &&
            const DeepCollectionEquality().equals(other.startsAt, startsAt) &&
            const DeepCollectionEquality().equals(other.endsAt, endsAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(startsAt),
      const DeepCollectionEquality().hash(endsAt));

  @JsonKey(ignore: true)
  @override
  _$TimeRangeCopyWith<_TimeRange> get copyWith =>
      __$TimeRangeCopyWithImpl<_TimeRange>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimeRangeToJson(this);
  }
}

abstract class _TimeRange extends TimeRange {
  const factory _TimeRange(
      {required DateTime startsAt, required DateTime endsAt}) = _$_TimeRange;
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
  _$TimeRangeCopyWith<_TimeRange> get copyWith =>
      throw _privateConstructorUsedError;
}
