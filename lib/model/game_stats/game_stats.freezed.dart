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
  switch (json['runtimeType']) {
    case 'default':
      return _GameStats.fromJson(json);
    case 'scoreOnly':
      return GameStatsScoreOnly.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'GameStats',
          'Invalid union type "${json['runtimeType']}"!');
  }
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
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            DateTime recordedAt,
            Map<String, Stats> homeTeamStats,
            Map<String, Stats> awayTeamStats,
            List<GameStatEntry> statEntryHistory,
            bool isLive,
            int? remainingMsOnPaused,
            DateTime? endsAt)
        $default, {
    required TResult Function(
            String id,
            DateTime recordedAt,
            Map<String, Stats> homeTeamStats,
            Map<String, Stats> awayTeamStats,
            bool isLive,
            int? remainingMsOnPaused,
            DateTime? endsAt,
            int homeTeamScore,
            int awayTeamScore)
        scoreOnly,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            DateTime recordedAt,
            Map<String, Stats> homeTeamStats,
            Map<String, Stats> awayTeamStats,
            List<GameStatEntry> statEntryHistory,
            bool isLive,
            int? remainingMsOnPaused,
            DateTime? endsAt)?
        $default, {
    TResult? Function(
            String id,
            DateTime recordedAt,
            Map<String, Stats> homeTeamStats,
            Map<String, Stats> awayTeamStats,
            bool isLive,
            int? remainingMsOnPaused,
            DateTime? endsAt,
            int homeTeamScore,
            int awayTeamScore)?
        scoreOnly,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            DateTime recordedAt,
            Map<String, Stats> homeTeamStats,
            Map<String, Stats> awayTeamStats,
            List<GameStatEntry> statEntryHistory,
            bool isLive,
            int? remainingMsOnPaused,
            DateTime? endsAt)?
        $default, {
    TResult Function(
            String id,
            DateTime recordedAt,
            Map<String, Stats> homeTeamStats,
            Map<String, Stats> awayTeamStats,
            bool isLive,
            int? remainingMsOnPaused,
            DateTime? endsAt,
            int homeTeamScore,
            int awayTeamScore)?
        scoreOnly,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_GameStats value) $default, {
    required TResult Function(GameStatsScoreOnly value) scoreOnly,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_GameStats value)? $default, {
    TResult? Function(GameStatsScoreOnly value)? scoreOnly,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_GameStats value)? $default, {
    TResult Function(GameStatsScoreOnly value)? scoreOnly,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
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
      List<GameStatEntry> statEntryHistory,
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
    Object? statEntryHistory = null,
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
      statEntryHistory: null == statEntryHistory
          ? _value._statEntryHistory
          : statEntryHistory // ignore: cast_nullable_to_non_nullable
              as List<GameStatEntry>,
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
      final List<GameStatEntry> statEntryHistory = const [],
      this.isLive = false,
      this.remainingMsOnPaused,
      this.endsAt,
      final String? $type})
      : _homeTeamStats = homeTeamStats,
        _awayTeamStats = awayTeamStats,
        _statEntryHistory = statEntryHistory,
        $type = $type ?? 'default',
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

  final List<GameStatEntry> _statEntryHistory;
  @override
  @JsonKey()
  List<GameStatEntry> get statEntryHistory {
    if (_statEntryHistory is EqualUnmodifiableListView)
      return _statEntryHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_statEntryHistory);
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

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GameStats(id: $id, recordedAt: $recordedAt, homeTeamStats: $homeTeamStats, awayTeamStats: $awayTeamStats, statEntryHistory: $statEntryHistory, isLive: $isLive, remainingMsOnPaused: $remainingMsOnPaused, endsAt: $endsAt)';
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
      ..add(DiagnosticsProperty('statEntryHistory', statEntryHistory))
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
            const DeepCollectionEquality()
                .equals(other._statEntryHistory, _statEntryHistory) &&
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
      const DeepCollectionEquality().hash(_statEntryHistory),
      isLive,
      remainingMsOnPaused,
      endsAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameStatsCopyWith<_$_GameStats> get copyWith =>
      __$$_GameStatsCopyWithImpl<_$_GameStats>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            DateTime recordedAt,
            Map<String, Stats> homeTeamStats,
            Map<String, Stats> awayTeamStats,
            List<GameStatEntry> statEntryHistory,
            bool isLive,
            int? remainingMsOnPaused,
            DateTime? endsAt)
        $default, {
    required TResult Function(
            String id,
            DateTime recordedAt,
            Map<String, Stats> homeTeamStats,
            Map<String, Stats> awayTeamStats,
            bool isLive,
            int? remainingMsOnPaused,
            DateTime? endsAt,
            int homeTeamScore,
            int awayTeamScore)
        scoreOnly,
  }) {
    return $default(id, recordedAt, homeTeamStats, awayTeamStats,
        statEntryHistory, isLive, remainingMsOnPaused, endsAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            DateTime recordedAt,
            Map<String, Stats> homeTeamStats,
            Map<String, Stats> awayTeamStats,
            List<GameStatEntry> statEntryHistory,
            bool isLive,
            int? remainingMsOnPaused,
            DateTime? endsAt)?
        $default, {
    TResult? Function(
            String id,
            DateTime recordedAt,
            Map<String, Stats> homeTeamStats,
            Map<String, Stats> awayTeamStats,
            bool isLive,
            int? remainingMsOnPaused,
            DateTime? endsAt,
            int homeTeamScore,
            int awayTeamScore)?
        scoreOnly,
  }) {
    return $default?.call(id, recordedAt, homeTeamStats, awayTeamStats,
        statEntryHistory, isLive, remainingMsOnPaused, endsAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            DateTime recordedAt,
            Map<String, Stats> homeTeamStats,
            Map<String, Stats> awayTeamStats,
            List<GameStatEntry> statEntryHistory,
            bool isLive,
            int? remainingMsOnPaused,
            DateTime? endsAt)?
        $default, {
    TResult Function(
            String id,
            DateTime recordedAt,
            Map<String, Stats> homeTeamStats,
            Map<String, Stats> awayTeamStats,
            bool isLive,
            int? remainingMsOnPaused,
            DateTime? endsAt,
            int homeTeamScore,
            int awayTeamScore)?
        scoreOnly,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, recordedAt, homeTeamStats, awayTeamStats,
          statEntryHistory, isLive, remainingMsOnPaused, endsAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_GameStats value) $default, {
    required TResult Function(GameStatsScoreOnly value) scoreOnly,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_GameStats value)? $default, {
    TResult? Function(GameStatsScoreOnly value)? scoreOnly,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_GameStats value)? $default, {
    TResult Function(GameStatsScoreOnly value)? scoreOnly,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

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
      final List<GameStatEntry> statEntryHistory,
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
  List<GameStatEntry> get statEntryHistory;
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

/// @nodoc
abstract class _$$GameStatsScoreOnlyCopyWith<$Res>
    implements $GameStatsCopyWith<$Res> {
  factory _$$GameStatsScoreOnlyCopyWith(_$GameStatsScoreOnly value,
          $Res Function(_$GameStatsScoreOnly) then) =
      __$$GameStatsScoreOnlyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime recordedAt,
      Map<String, Stats> homeTeamStats,
      Map<String, Stats> awayTeamStats,
      bool isLive,
      int? remainingMsOnPaused,
      DateTime? endsAt,
      int homeTeamScore,
      int awayTeamScore});
}

/// @nodoc
class __$$GameStatsScoreOnlyCopyWithImpl<$Res>
    extends _$GameStatsCopyWithImpl<$Res, _$GameStatsScoreOnly>
    implements _$$GameStatsScoreOnlyCopyWith<$Res> {
  __$$GameStatsScoreOnlyCopyWithImpl(
      _$GameStatsScoreOnly _value, $Res Function(_$GameStatsScoreOnly) _then)
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
    Object? homeTeamScore = null,
    Object? awayTeamScore = null,
  }) {
    return _then(_$GameStatsScoreOnly(
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
      homeTeamScore: null == homeTeamScore
          ? _value.homeTeamScore
          : homeTeamScore // ignore: cast_nullable_to_non_nullable
              as int,
      awayTeamScore: null == awayTeamScore
          ? _value.awayTeamScore
          : awayTeamScore // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameStatsScoreOnly extends GameStatsScoreOnly
    with DiagnosticableTreeMixin {
  const _$GameStatsScoreOnly(
      {required this.id,
      required this.recordedAt,
      required final Map<String, Stats> homeTeamStats,
      required final Map<String, Stats> awayTeamStats,
      this.isLive = false,
      this.remainingMsOnPaused,
      this.endsAt,
      this.homeTeamScore = 0,
      this.awayTeamScore = 0,
      final String? $type})
      : _homeTeamStats = homeTeamStats,
        _awayTeamStats = awayTeamStats,
        $type = $type ?? 'scoreOnly',
        super._();

  factory _$GameStatsScoreOnly.fromJson(Map<String, dynamic> json) =>
      _$$GameStatsScoreOnlyFromJson(json);

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
  @JsonKey()
  final int homeTeamScore;
  @override
  @JsonKey()
  final int awayTeamScore;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GameStats.scoreOnly(id: $id, recordedAt: $recordedAt, homeTeamStats: $homeTeamStats, awayTeamStats: $awayTeamStats, isLive: $isLive, remainingMsOnPaused: $remainingMsOnPaused, endsAt: $endsAt, homeTeamScore: $homeTeamScore, awayTeamScore: $awayTeamScore)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GameStats.scoreOnly'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('recordedAt', recordedAt))
      ..add(DiagnosticsProperty('homeTeamStats', homeTeamStats))
      ..add(DiagnosticsProperty('awayTeamStats', awayTeamStats))
      ..add(DiagnosticsProperty('isLive', isLive))
      ..add(DiagnosticsProperty('remainingMsOnPaused', remainingMsOnPaused))
      ..add(DiagnosticsProperty('endsAt', endsAt))
      ..add(DiagnosticsProperty('homeTeamScore', homeTeamScore))
      ..add(DiagnosticsProperty('awayTeamScore', awayTeamScore));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStatsScoreOnly &&
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
            (identical(other.endsAt, endsAt) || other.endsAt == endsAt) &&
            (identical(other.homeTeamScore, homeTeamScore) ||
                other.homeTeamScore == homeTeamScore) &&
            (identical(other.awayTeamScore, awayTeamScore) ||
                other.awayTeamScore == awayTeamScore));
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
      endsAt,
      homeTeamScore,
      awayTeamScore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStatsScoreOnlyCopyWith<_$GameStatsScoreOnly> get copyWith =>
      __$$GameStatsScoreOnlyCopyWithImpl<_$GameStatsScoreOnly>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            DateTime recordedAt,
            Map<String, Stats> homeTeamStats,
            Map<String, Stats> awayTeamStats,
            List<GameStatEntry> statEntryHistory,
            bool isLive,
            int? remainingMsOnPaused,
            DateTime? endsAt)
        $default, {
    required TResult Function(
            String id,
            DateTime recordedAt,
            Map<String, Stats> homeTeamStats,
            Map<String, Stats> awayTeamStats,
            bool isLive,
            int? remainingMsOnPaused,
            DateTime? endsAt,
            int homeTeamScore,
            int awayTeamScore)
        scoreOnly,
  }) {
    return scoreOnly(id, recordedAt, homeTeamStats, awayTeamStats, isLive,
        remainingMsOnPaused, endsAt, homeTeamScore, awayTeamScore);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            DateTime recordedAt,
            Map<String, Stats> homeTeamStats,
            Map<String, Stats> awayTeamStats,
            List<GameStatEntry> statEntryHistory,
            bool isLive,
            int? remainingMsOnPaused,
            DateTime? endsAt)?
        $default, {
    TResult? Function(
            String id,
            DateTime recordedAt,
            Map<String, Stats> homeTeamStats,
            Map<String, Stats> awayTeamStats,
            bool isLive,
            int? remainingMsOnPaused,
            DateTime? endsAt,
            int homeTeamScore,
            int awayTeamScore)?
        scoreOnly,
  }) {
    return scoreOnly?.call(id, recordedAt, homeTeamStats, awayTeamStats, isLive,
        remainingMsOnPaused, endsAt, homeTeamScore, awayTeamScore);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            DateTime recordedAt,
            Map<String, Stats> homeTeamStats,
            Map<String, Stats> awayTeamStats,
            List<GameStatEntry> statEntryHistory,
            bool isLive,
            int? remainingMsOnPaused,
            DateTime? endsAt)?
        $default, {
    TResult Function(
            String id,
            DateTime recordedAt,
            Map<String, Stats> homeTeamStats,
            Map<String, Stats> awayTeamStats,
            bool isLive,
            int? remainingMsOnPaused,
            DateTime? endsAt,
            int homeTeamScore,
            int awayTeamScore)?
        scoreOnly,
    required TResult orElse(),
  }) {
    if (scoreOnly != null) {
      return scoreOnly(id, recordedAt, homeTeamStats, awayTeamStats, isLive,
          remainingMsOnPaused, endsAt, homeTeamScore, awayTeamScore);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_GameStats value) $default, {
    required TResult Function(GameStatsScoreOnly value) scoreOnly,
  }) {
    return scoreOnly(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_GameStats value)? $default, {
    TResult? Function(GameStatsScoreOnly value)? scoreOnly,
  }) {
    return scoreOnly?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_GameStats value)? $default, {
    TResult Function(GameStatsScoreOnly value)? scoreOnly,
    required TResult orElse(),
  }) {
    if (scoreOnly != null) {
      return scoreOnly(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GameStatsScoreOnlyToJson(
      this,
    );
  }
}

abstract class GameStatsScoreOnly extends GameStats {
  const factory GameStatsScoreOnly(
      {required final String id,
      required final DateTime recordedAt,
      required final Map<String, Stats> homeTeamStats,
      required final Map<String, Stats> awayTeamStats,
      final bool isLive,
      final int? remainingMsOnPaused,
      final DateTime? endsAt,
      final int homeTeamScore,
      final int awayTeamScore}) = _$GameStatsScoreOnly;
  const GameStatsScoreOnly._() : super._();

  factory GameStatsScoreOnly.fromJson(Map<String, dynamic> json) =
      _$GameStatsScoreOnly.fromJson;

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
  int get homeTeamScore;
  int get awayTeamScore;
  @override
  @JsonKey(ignore: true)
  _$$GameStatsScoreOnlyCopyWith<_$GameStatsScoreOnly> get copyWith =>
      throw _privateConstructorUsedError;
}
