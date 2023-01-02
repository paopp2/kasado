// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameStats _$GameStatsFromJson(Map<String, dynamic> json) {
  return _GameStats.fromJson(json);
}

/// @nodoc
mixin _$GameStats {
  String get id => throw _privateConstructorUsedError;
  DateTime get recordedAt => throw _privateConstructorUsedError;
  Map<String, Stats> get homeTeamStats => throw _privateConstructorUsedError;
  Map<String, Stats> get awayTeamStats => throw _privateConstructorUsedError;
  bool get isLive => throw _privateConstructorUsedError;
  int? get remainingMsOnPaused =>
      throw _privateConstructorUsedError; // 900000 milliseconds == 15 mins
// Set as nullable for backward compatibility (property nonexistent before)
  DateTime? get endsAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameStatsCopyWith<GameStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStatsCopyWith<$Res> {
  factory $GameStatsCopyWith(GameStats value, $Res Function(GameStats) then) =
      _$GameStatsCopyWithImpl<$Res, GameStats>;
  @useResult
  $Res call(
      {String id,
      DateTime recordedAt,
      Map<String, Stats> homeTeamStats,
      Map<String, Stats> awayTeamStats,
      bool isLive,
      int? remainingMsOnPaused,
      DateTime? endsAt});
}

/// @nodoc
class _$GameStatsCopyWithImpl<$Res, $Val extends GameStats>
    implements $GameStatsCopyWith<$Res> {
  _$GameStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? recordedAt = null,
    Object? homeTeamStats = null,
    Object? awayTeamStats = null,
    Object? isLive = null,
    Object? remainingMsOnPaused = freezed,
    Object? endsAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      recordedAt: null == recordedAt
          ? _value.recordedAt
          : recordedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      homeTeamStats: null == homeTeamStats
          ? _value.homeTeamStats
          : homeTeamStats // ignore: cast_nullable_to_non_nullable
              as Map<String, Stats>,
      awayTeamStats: null == awayTeamStats
          ? _value.awayTeamStats
          : awayTeamStats // ignore: cast_nullable_to_non_nullable
              as Map<String, Stats>,
      isLive: null == isLive
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool,
      remainingMsOnPaused: freezed == remainingMsOnPaused
          ? _value.remainingMsOnPaused
          : remainingMsOnPaused // ignore: cast_nullable_to_non_nullable
              as int?,
      endsAt: freezed == endsAt
          ? _value.endsAt
          : endsAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GameStatsCopyWith<$Res> implements $GameStatsCopyWith<$Res> {
  factory _$$_GameStatsCopyWith(
          _$_GameStats value, $Res Function(_$_GameStats) then) =
      __$$_GameStatsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime recordedAt,
      Map<String, Stats> homeTeamStats,
      Map<String, Stats> awayTeamStats,
      bool isLive,
      int? remainingMsOnPaused,
      DateTime? endsAt});
}

/// @nodoc
class __$$_GameStatsCopyWithImpl<$Res>
    extends _$GameStatsCopyWithImpl<$Res, _$_GameStats>
    implements _$$_GameStatsCopyWith<$Res> {
  __$$_GameStatsCopyWithImpl(
      _$_GameStats _value, $Res Function(_$_GameStats) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? recordedAt = null,
    Object? homeTeamStats = null,
    Object? awayTeamStats = null,
    Object? isLive = null,
    Object? remainingMsOnPaused = freezed,
    Object? endsAt = freezed,
  }) {
    return _then(_$_GameStats(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      recordedAt: null == recordedAt
          ? _value.recordedAt
          : recordedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      homeTeamStats: null == homeTeamStats
          ? _value._homeTeamStats
          : homeTeamStats // ignore: cast_nullable_to_non_nullable
              as Map<String, Stats>,
      awayTeamStats: null == awayTeamStats
          ? _value._awayTeamStats
          : awayTeamStats // ignore: cast_nullable_to_non_nullable
              as Map<String, Stats>,
      isLive: null == isLive
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool,
      remainingMsOnPaused: freezed == remainingMsOnPaused
          ? _value.remainingMsOnPaused
          : remainingMsOnPaused // ignore: cast_nullable_to_non_nullable
              as int?,
      endsAt: freezed == endsAt
          ? _value.endsAt
          : endsAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GameStats extends _GameStats with DiagnosticableTreeMixin {
  const _$_GameStats(
      {required this.id,
      required this.recordedAt,
      required final Map<String, Stats> homeTeamStats,
      required final Map<String, Stats> awayTeamStats,
      this.isLive = false,
      this.remainingMsOnPaused,
      this.endsAt})
      : _homeTeamStats = homeTeamStats,
        _awayTeamStats = awayTeamStats,
        super._();

  factory _$_GameStats.fromJson(Map<String, dynamic> json) =>
      _$$_GameStatsFromJson(json);

  @override
  final String id;
  @override
  final DateTime recordedAt;
  final Map<String, Stats> _homeTeamStats;
  @override
  Map<String, Stats> get homeTeamStats {
    if (_homeTeamStats is EqualUnmodifiableMapView) return _homeTeamStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_homeTeamStats);
  }

  final Map<String, Stats> _awayTeamStats;
  @override
  Map<String, Stats> get awayTeamStats {
    if (_awayTeamStats is EqualUnmodifiableMapView) return _awayTeamStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_awayTeamStats);
  }

  @override
  @JsonKey()
  final bool isLive;
  @override
  final int? remainingMsOnPaused;
// 900000 milliseconds == 15 mins
// Set as nullable for backward compatibility (property nonexistent before)
  @override
  final DateTime? endsAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GameStats(id: $id, recordedAt: $recordedAt, homeTeamStats: $homeTeamStats, awayTeamStats: $awayTeamStats, isLive: $isLive, remainingMsOnPaused: $remainingMsOnPaused, endsAt: $endsAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GameStats'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('recordedAt', recordedAt))
      ..add(DiagnosticsProperty('homeTeamStats', homeTeamStats))
      ..add(DiagnosticsProperty('awayTeamStats', awayTeamStats))
      ..add(DiagnosticsProperty('isLive', isLive))
      ..add(DiagnosticsProperty('remainingMsOnPaused', remainingMsOnPaused))
      ..add(DiagnosticsProperty('endsAt', endsAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameStats &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.recordedAt, recordedAt) ||
                other.recordedAt == recordedAt) &&
            const DeepCollectionEquality()
                .equals(other._homeTeamStats, _homeTeamStats) &&
            const DeepCollectionEquality()
                .equals(other._awayTeamStats, _awayTeamStats) &&
            (identical(other.isLive, isLive) || other.isLive == isLive) &&
            (identical(other.remainingMsOnPaused, remainingMsOnPaused) ||
                other.remainingMsOnPaused == remainingMsOnPaused) &&
            (identical(other.endsAt, endsAt) || other.endsAt == endsAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      recordedAt,
      const DeepCollectionEquality().hash(_homeTeamStats),
      const DeepCollectionEquality().hash(_awayTeamStats),
      isLive,
      remainingMsOnPaused,
      endsAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameStatsCopyWith<_$_GameStats> get copyWith =>
      __$$_GameStatsCopyWithImpl<_$_GameStats>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameStatsToJson(
      this,
    );
  }
}

abstract class _GameStats extends GameStats {
  const factory _GameStats(
      {required final String id,
      required final DateTime recordedAt,
      required final Map<String, Stats> homeTeamStats,
      required final Map<String, Stats> awayTeamStats,
      final bool isLive,
      final int? remainingMsOnPaused,
      final DateTime? endsAt}) = _$_GameStats;
  const _GameStats._() : super._();

  factory _GameStats.fromJson(Map<String, dynamic> json) =
      _$_GameStats.fromJson;

  @override
  String get id;
  @override
  DateTime get recordedAt;
  @override
  Map<String, Stats> get homeTeamStats;
  @override
  Map<String, Stats> get awayTeamStats;
  @override
  bool get isLive;
  @override
  int? get remainingMsOnPaused;
  @override // 900000 milliseconds == 15 mins
// Set as nullable for backward compatibility (property nonexistent before)
  DateTime? get endsAt;
  @override
  @JsonKey(ignore: true)
  _$$_GameStatsCopyWith<_$_GameStats> get copyWith =>
      throw _privateConstructorUsedError;
}
