// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'game_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameStats _$GameStatsFromJson(Map<String, dynamic> json) {
  return _GameStats.fromJson(json);
}

/// @nodoc
class _$GameStatsTearOff {
  const _$GameStatsTearOff();

  _GameStats call(
      {required String id,
      required DateTime recordedAt,
      required Map<String, Stats> homeTeamStats,
      required Map<String, Stats> awayTeamStats,
      bool isLive = false,
      int? remainingMsOnPaused,
      DateTime? endsAt}) {
    return _GameStats(
      id: id,
      recordedAt: recordedAt,
      homeTeamStats: homeTeamStats,
      awayTeamStats: awayTeamStats,
      isLive: isLive,
      remainingMsOnPaused: remainingMsOnPaused,
      endsAt: endsAt,
    );
  }

  GameStats fromJson(Map<String, Object?> json) {
    return GameStats.fromJson(json);
  }
}

/// @nodoc
const $GameStats = _$GameStatsTearOff();

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
      _$GameStatsCopyWithImpl<$Res>;
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
class _$GameStatsCopyWithImpl<$Res> implements $GameStatsCopyWith<$Res> {
  _$GameStatsCopyWithImpl(this._value, this._then);

  final GameStats _value;
  // ignore: unused_field
  final $Res Function(GameStats) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? recordedAt = freezed,
    Object? homeTeamStats = freezed,
    Object? awayTeamStats = freezed,
    Object? isLive = freezed,
    Object? remainingMsOnPaused = freezed,
    Object? endsAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      recordedAt: recordedAt == freezed
          ? _value.recordedAt
          : recordedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      homeTeamStats: homeTeamStats == freezed
          ? _value.homeTeamStats
          : homeTeamStats // ignore: cast_nullable_to_non_nullable
              as Map<String, Stats>,
      awayTeamStats: awayTeamStats == freezed
          ? _value.awayTeamStats
          : awayTeamStats // ignore: cast_nullable_to_non_nullable
              as Map<String, Stats>,
      isLive: isLive == freezed
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool,
      remainingMsOnPaused: remainingMsOnPaused == freezed
          ? _value.remainingMsOnPaused
          : remainingMsOnPaused // ignore: cast_nullable_to_non_nullable
              as int?,
      endsAt: endsAt == freezed
          ? _value.endsAt
          : endsAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$GameStatsCopyWith<$Res> implements $GameStatsCopyWith<$Res> {
  factory _$GameStatsCopyWith(
          _GameStats value, $Res Function(_GameStats) then) =
      __$GameStatsCopyWithImpl<$Res>;
  @override
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
class __$GameStatsCopyWithImpl<$Res> extends _$GameStatsCopyWithImpl<$Res>
    implements _$GameStatsCopyWith<$Res> {
  __$GameStatsCopyWithImpl(_GameStats _value, $Res Function(_GameStats) _then)
      : super(_value, (v) => _then(v as _GameStats));

  @override
  _GameStats get _value => super._value as _GameStats;

  @override
  $Res call({
    Object? id = freezed,
    Object? recordedAt = freezed,
    Object? homeTeamStats = freezed,
    Object? awayTeamStats = freezed,
    Object? isLive = freezed,
    Object? remainingMsOnPaused = freezed,
    Object? endsAt = freezed,
  }) {
    return _then(_GameStats(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      recordedAt: recordedAt == freezed
          ? _value.recordedAt
          : recordedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      homeTeamStats: homeTeamStats == freezed
          ? _value.homeTeamStats
          : homeTeamStats // ignore: cast_nullable_to_non_nullable
              as Map<String, Stats>,
      awayTeamStats: awayTeamStats == freezed
          ? _value.awayTeamStats
          : awayTeamStats // ignore: cast_nullable_to_non_nullable
              as Map<String, Stats>,
      isLive: isLive == freezed
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool,
      remainingMsOnPaused: remainingMsOnPaused == freezed
          ? _value.remainingMsOnPaused
          : remainingMsOnPaused // ignore: cast_nullable_to_non_nullable
              as int?,
      endsAt: endsAt == freezed
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
      required this.homeTeamStats,
      required this.awayTeamStats,
      this.isLive = false,
      this.remainingMsOnPaused,
      this.endsAt})
      : super._();

  factory _$_GameStats.fromJson(Map<String, dynamic> json) =>
      _$$_GameStatsFromJson(json);

  @override
  final String id;
  @override
  final DateTime recordedAt;
  @override
  final Map<String, Stats> homeTeamStats;
  @override
  final Map<String, Stats> awayTeamStats;
  @JsonKey()
  @override
  final bool isLive;
  @override
  final int? remainingMsOnPaused;
  @override // 900000 milliseconds == 15 mins
// Set as nullable for backward compatibility (property nonexistent before)
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
            other is _GameStats &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.recordedAt, recordedAt) &&
            const DeepCollectionEquality()
                .equals(other.homeTeamStats, homeTeamStats) &&
            const DeepCollectionEquality()
                .equals(other.awayTeamStats, awayTeamStats) &&
            const DeepCollectionEquality().equals(other.isLive, isLive) &&
            const DeepCollectionEquality()
                .equals(other.remainingMsOnPaused, remainingMsOnPaused) &&
            const DeepCollectionEquality().equals(other.endsAt, endsAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(recordedAt),
      const DeepCollectionEquality().hash(homeTeamStats),
      const DeepCollectionEquality().hash(awayTeamStats),
      const DeepCollectionEquality().hash(isLive),
      const DeepCollectionEquality().hash(remainingMsOnPaused),
      const DeepCollectionEquality().hash(endsAt));

  @JsonKey(ignore: true)
  @override
  _$GameStatsCopyWith<_GameStats> get copyWith =>
      __$GameStatsCopyWithImpl<_GameStats>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameStatsToJson(this);
  }
}

abstract class _GameStats extends GameStats {
  const factory _GameStats(
      {required String id,
      required DateTime recordedAt,
      required Map<String, Stats> homeTeamStats,
      required Map<String, Stats> awayTeamStats,
      bool isLive,
      int? remainingMsOnPaused,
      DateTime? endsAt}) = _$_GameStats;
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
  _$GameStatsCopyWith<_GameStats> get copyWith =>
      throw _privateConstructorUsedError;
}
