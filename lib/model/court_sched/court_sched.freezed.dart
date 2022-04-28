// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'court_sched.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CourtSched _$CourtSchedFromJson(Map<String, dynamic> json) {
  return _CourtSched.fromJson(json);
}

/// @nodoc
class _$CourtSchedTearOff {
  const _$CourtSchedTearOff();

  _CourtSched call(
      {required int weekdayIndex,
      required TimeRange timeRange,
      DateTime? endDate}) {
    return _CourtSched(
      weekdayIndex: weekdayIndex,
      timeRange: timeRange,
      endDate: endDate,
    );
  }

  CourtSched fromJson(Map<String, Object?> json) {
    return CourtSched.fromJson(json);
  }
}

/// @nodoc
const $CourtSched = _$CourtSchedTearOff();

/// @nodoc
mixin _$CourtSched {
  int get weekdayIndex => throw _privateConstructorUsedError;
  TimeRange get timeRange => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourtSchedCopyWith<CourtSched> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourtSchedCopyWith<$Res> {
  factory $CourtSchedCopyWith(
          CourtSched value, $Res Function(CourtSched) then) =
      _$CourtSchedCopyWithImpl<$Res>;
  $Res call({int weekdayIndex, TimeRange timeRange, DateTime? endDate});

  $TimeRangeCopyWith<$Res> get timeRange;
}

/// @nodoc
class _$CourtSchedCopyWithImpl<$Res> implements $CourtSchedCopyWith<$Res> {
  _$CourtSchedCopyWithImpl(this._value, this._then);

  final CourtSched _value;
  // ignore: unused_field
  final $Res Function(CourtSched) _then;

  @override
  $Res call({
    Object? weekdayIndex = freezed,
    Object? timeRange = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_value.copyWith(
      weekdayIndex: weekdayIndex == freezed
          ? _value.weekdayIndex
          : weekdayIndex // ignore: cast_nullable_to_non_nullable
              as int,
      timeRange: timeRange == freezed
          ? _value.timeRange
          : timeRange // ignore: cast_nullable_to_non_nullable
              as TimeRange,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  @override
  $TimeRangeCopyWith<$Res> get timeRange {
    return $TimeRangeCopyWith<$Res>(_value.timeRange, (value) {
      return _then(_value.copyWith(timeRange: value));
    });
  }
}

/// @nodoc
abstract class _$CourtSchedCopyWith<$Res> implements $CourtSchedCopyWith<$Res> {
  factory _$CourtSchedCopyWith(
          _CourtSched value, $Res Function(_CourtSched) then) =
      __$CourtSchedCopyWithImpl<$Res>;
  @override
  $Res call({int weekdayIndex, TimeRange timeRange, DateTime? endDate});

  @override
  $TimeRangeCopyWith<$Res> get timeRange;
}

/// @nodoc
class __$CourtSchedCopyWithImpl<$Res> extends _$CourtSchedCopyWithImpl<$Res>
    implements _$CourtSchedCopyWith<$Res> {
  __$CourtSchedCopyWithImpl(
      _CourtSched _value, $Res Function(_CourtSched) _then)
      : super(_value, (v) => _then(v as _CourtSched));

  @override
  _CourtSched get _value => super._value as _CourtSched;

  @override
  $Res call({
    Object? weekdayIndex = freezed,
    Object? timeRange = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_CourtSched(
      weekdayIndex: weekdayIndex == freezed
          ? _value.weekdayIndex
          : weekdayIndex // ignore: cast_nullable_to_non_nullable
              as int,
      timeRange: timeRange == freezed
          ? _value.timeRange
          : timeRange // ignore: cast_nullable_to_non_nullable
              as TimeRange,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CourtSched with DiagnosticableTreeMixin implements _CourtSched {
  const _$_CourtSched(
      {required this.weekdayIndex, required this.timeRange, this.endDate});

  factory _$_CourtSched.fromJson(Map<String, dynamic> json) =>
      _$$_CourtSchedFromJson(json);

  @override
  final int weekdayIndex;
  @override
  final TimeRange timeRange;
  @override
  final DateTime? endDate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CourtSched(weekdayIndex: $weekdayIndex, timeRange: $timeRange, endDate: $endDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CourtSched'))
      ..add(DiagnosticsProperty('weekdayIndex', weekdayIndex))
      ..add(DiagnosticsProperty('timeRange', timeRange))
      ..add(DiagnosticsProperty('endDate', endDate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CourtSched &&
            const DeepCollectionEquality()
                .equals(other.weekdayIndex, weekdayIndex) &&
            const DeepCollectionEquality().equals(other.timeRange, timeRange) &&
            const DeepCollectionEquality().equals(other.endDate, endDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(weekdayIndex),
      const DeepCollectionEquality().hash(timeRange),
      const DeepCollectionEquality().hash(endDate));

  @JsonKey(ignore: true)
  @override
  _$CourtSchedCopyWith<_CourtSched> get copyWith =>
      __$CourtSchedCopyWithImpl<_CourtSched>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CourtSchedToJson(this);
  }
}

abstract class _CourtSched implements CourtSched {
  const factory _CourtSched(
      {required int weekdayIndex,
      required TimeRange timeRange,
      DateTime? endDate}) = _$_CourtSched;

  factory _CourtSched.fromJson(Map<String, dynamic> json) =
      _$_CourtSched.fromJson;

  @override
  int get weekdayIndex;
  @override
  TimeRange get timeRange;
  @override
  DateTime? get endDate;
  @override
  @JsonKey(ignore: true)
  _$CourtSchedCopyWith<_CourtSched> get copyWith =>
      throw _privateConstructorUsedError;
}
