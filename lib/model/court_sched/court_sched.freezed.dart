// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'court_sched.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CourtSched _$CourtSchedFromJson(Map<String, dynamic> json) {
  return _CourtSched.fromJson(json);
}

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
      _$CourtSchedCopyWithImpl<$Res, CourtSched>;
  @useResult
  $Res call({int weekdayIndex, TimeRange timeRange, DateTime? endDate});

  $TimeRangeCopyWith<$Res> get timeRange;
}

/// @nodoc
class _$CourtSchedCopyWithImpl<$Res, $Val extends CourtSched>
    implements $CourtSchedCopyWith<$Res> {
  _$CourtSchedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weekdayIndex = null,
    Object? timeRange = null,
    Object? endDate = freezed,
  }) {
    return _then(_value.copyWith(
      weekdayIndex: null == weekdayIndex
          ? _value.weekdayIndex
          : weekdayIndex // ignore: cast_nullable_to_non_nullable
              as int,
      timeRange: null == timeRange
          ? _value.timeRange
          : timeRange // ignore: cast_nullable_to_non_nullable
              as TimeRange,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TimeRangeCopyWith<$Res> get timeRange {
    return $TimeRangeCopyWith<$Res>(_value.timeRange, (value) {
      return _then(_value.copyWith(timeRange: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CourtSchedCopyWith<$Res>
    implements $CourtSchedCopyWith<$Res> {
  factory _$$_CourtSchedCopyWith(
          _$_CourtSched value, $Res Function(_$_CourtSched) then) =
      __$$_CourtSchedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int weekdayIndex, TimeRange timeRange, DateTime? endDate});

  @override
  $TimeRangeCopyWith<$Res> get timeRange;
}

/// @nodoc
class __$$_CourtSchedCopyWithImpl<$Res>
    extends _$CourtSchedCopyWithImpl<$Res, _$_CourtSched>
    implements _$$_CourtSchedCopyWith<$Res> {
  __$$_CourtSchedCopyWithImpl(
      _$_CourtSched _value, $Res Function(_$_CourtSched) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weekdayIndex = null,
    Object? timeRange = null,
    Object? endDate = freezed,
  }) {
    return _then(_$_CourtSched(
      weekdayIndex: null == weekdayIndex
          ? _value.weekdayIndex
          : weekdayIndex // ignore: cast_nullable_to_non_nullable
              as int,
      timeRange: null == timeRange
          ? _value.timeRange
          : timeRange // ignore: cast_nullable_to_non_nullable
              as TimeRange,
      endDate: freezed == endDate
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
            other is _$_CourtSched &&
            (identical(other.weekdayIndex, weekdayIndex) ||
                other.weekdayIndex == weekdayIndex) &&
            (identical(other.timeRange, timeRange) ||
                other.timeRange == timeRange) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, weekdayIndex, timeRange, endDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CourtSchedCopyWith<_$_CourtSched> get copyWith =>
      __$$_CourtSchedCopyWithImpl<_$_CourtSched>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CourtSchedToJson(
      this,
    );
  }
}

abstract class _CourtSched implements CourtSched {
  const factory _CourtSched(
      {required final int weekdayIndex,
      required final TimeRange timeRange,
      final DateTime? endDate}) = _$_CourtSched;

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
  _$$_CourtSchedCopyWith<_$_CourtSched> get copyWith =>
      throw _privateConstructorUsedError;
}
