// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'overview_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OverviewStats _$OverviewStatsFromJson(Map<String, dynamic> json) {
  return _OverviewStats.fromJson(json);
}

/// @nodoc
class _$OverviewStatsTearOff {
  const _$OverviewStatsTearOff();

  _OverviewStats call({int mvpVoteCount = 0}) {
    return _OverviewStats(
      mvpVoteCount: mvpVoteCount,
    );
  }

  OverviewStats fromJson(Map<String, Object?> json) {
    return OverviewStats.fromJson(json);
  }
}

/// @nodoc
const $OverviewStats = _$OverviewStatsTearOff();

/// @nodoc
mixin _$OverviewStats {
  int get mvpVoteCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OverviewStatsCopyWith<OverviewStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OverviewStatsCopyWith<$Res> {
  factory $OverviewStatsCopyWith(
          OverviewStats value, $Res Function(OverviewStats) then) =
      _$OverviewStatsCopyWithImpl<$Res>;
  $Res call({int mvpVoteCount});
}

/// @nodoc
class _$OverviewStatsCopyWithImpl<$Res>
    implements $OverviewStatsCopyWith<$Res> {
  _$OverviewStatsCopyWithImpl(this._value, this._then);

  final OverviewStats _value;
  // ignore: unused_field
  final $Res Function(OverviewStats) _then;

  @override
  $Res call({
    Object? mvpVoteCount = freezed,
  }) {
    return _then(_value.copyWith(
      mvpVoteCount: mvpVoteCount == freezed
          ? _value.mvpVoteCount
          : mvpVoteCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$OverviewStatsCopyWith<$Res>
    implements $OverviewStatsCopyWith<$Res> {
  factory _$OverviewStatsCopyWith(
          _OverviewStats value, $Res Function(_OverviewStats) then) =
      __$OverviewStatsCopyWithImpl<$Res>;
  @override
  $Res call({int mvpVoteCount});
}

/// @nodoc
class __$OverviewStatsCopyWithImpl<$Res>
    extends _$OverviewStatsCopyWithImpl<$Res>
    implements _$OverviewStatsCopyWith<$Res> {
  __$OverviewStatsCopyWithImpl(
      _OverviewStats _value, $Res Function(_OverviewStats) _then)
      : super(_value, (v) => _then(v as _OverviewStats));

  @override
  _OverviewStats get _value => super._value as _OverviewStats;

  @override
  $Res call({
    Object? mvpVoteCount = freezed,
  }) {
    return _then(_OverviewStats(
      mvpVoteCount: mvpVoteCount == freezed
          ? _value.mvpVoteCount
          : mvpVoteCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OverviewStats extends _OverviewStats with DiagnosticableTreeMixin {
  const _$_OverviewStats({this.mvpVoteCount = 0}) : super._();

  factory _$_OverviewStats.fromJson(Map<String, dynamic> json) =>
      _$$_OverviewStatsFromJson(json);

  @JsonKey()
  @override
  final int mvpVoteCount;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OverviewStats(mvpVoteCount: $mvpVoteCount)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OverviewStats'))
      ..add(DiagnosticsProperty('mvpVoteCount', mvpVoteCount));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OverviewStats &&
            const DeepCollectionEquality()
                .equals(other.mvpVoteCount, mvpVoteCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(mvpVoteCount));

  @JsonKey(ignore: true)
  @override
  _$OverviewStatsCopyWith<_OverviewStats> get copyWith =>
      __$OverviewStatsCopyWithImpl<_OverviewStats>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OverviewStatsToJson(this);
  }
}

abstract class _OverviewStats extends OverviewStats {
  const factory _OverviewStats({int mvpVoteCount}) = _$_OverviewStats;
  const _OverviewStats._() : super._();

  factory _OverviewStats.fromJson(Map<String, dynamic> json) =
      _$_OverviewStats.fromJson;

  @override
  int get mvpVoteCount;
  @override
  @JsonKey(ignore: true)
  _$OverviewStatsCopyWith<_OverviewStats> get copyWith =>
      throw _privateConstructorUsedError;
}
