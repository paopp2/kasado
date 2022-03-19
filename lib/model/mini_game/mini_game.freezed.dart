// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mini_game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MiniGame _$MiniGameFromJson(Map<String, dynamic> json) {
  return _MiniGame.fromJson(json);
}

/// @nodoc
class _$MiniGameTearOff {
  const _$MiniGameTearOff();

  _MiniGame call(
      {required Map<String, Stats> homeTeamStats,
      required Map<String, Stats> awayTeamStats,
      bool? isHomeWinner}) {
    return _MiniGame(
      homeTeamStats: homeTeamStats,
      awayTeamStats: awayTeamStats,
      isHomeWinner: isHomeWinner,
    );
  }

  MiniGame fromJson(Map<String, Object?> json) {
    return MiniGame.fromJson(json);
  }
}

/// @nodoc
const $MiniGame = _$MiniGameTearOff();

/// @nodoc
mixin _$MiniGame {
  Map<String, Stats> get homeTeamStats => throw _privateConstructorUsedError;
  Map<String, Stats> get awayTeamStats => throw _privateConstructorUsedError;
  bool? get isHomeWinner => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MiniGameCopyWith<MiniGame> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MiniGameCopyWith<$Res> {
  factory $MiniGameCopyWith(MiniGame value, $Res Function(MiniGame) then) =
      _$MiniGameCopyWithImpl<$Res>;
  $Res call(
      {Map<String, Stats> homeTeamStats,
      Map<String, Stats> awayTeamStats,
      bool? isHomeWinner});
}

/// @nodoc
class _$MiniGameCopyWithImpl<$Res> implements $MiniGameCopyWith<$Res> {
  _$MiniGameCopyWithImpl(this._value, this._then);

  final MiniGame _value;
  // ignore: unused_field
  final $Res Function(MiniGame) _then;

  @override
  $Res call({
    Object? homeTeamStats = freezed,
    Object? awayTeamStats = freezed,
    Object? isHomeWinner = freezed,
  }) {
    return _then(_value.copyWith(
      homeTeamStats: homeTeamStats == freezed
          ? _value.homeTeamStats
          : homeTeamStats // ignore: cast_nullable_to_non_nullable
              as Map<String, Stats>,
      awayTeamStats: awayTeamStats == freezed
          ? _value.awayTeamStats
          : awayTeamStats // ignore: cast_nullable_to_non_nullable
              as Map<String, Stats>,
      isHomeWinner: isHomeWinner == freezed
          ? _value.isHomeWinner
          : isHomeWinner // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$MiniGameCopyWith<$Res> implements $MiniGameCopyWith<$Res> {
  factory _$MiniGameCopyWith(_MiniGame value, $Res Function(_MiniGame) then) =
      __$MiniGameCopyWithImpl<$Res>;
  @override
  $Res call(
      {Map<String, Stats> homeTeamStats,
      Map<String, Stats> awayTeamStats,
      bool? isHomeWinner});
}

/// @nodoc
class __$MiniGameCopyWithImpl<$Res> extends _$MiniGameCopyWithImpl<$Res>
    implements _$MiniGameCopyWith<$Res> {
  __$MiniGameCopyWithImpl(_MiniGame _value, $Res Function(_MiniGame) _then)
      : super(_value, (v) => _then(v as _MiniGame));

  @override
  _MiniGame get _value => super._value as _MiniGame;

  @override
  $Res call({
    Object? homeTeamStats = freezed,
    Object? awayTeamStats = freezed,
    Object? isHomeWinner = freezed,
  }) {
    return _then(_MiniGame(
      homeTeamStats: homeTeamStats == freezed
          ? _value.homeTeamStats
          : homeTeamStats // ignore: cast_nullable_to_non_nullable
              as Map<String, Stats>,
      awayTeamStats: awayTeamStats == freezed
          ? _value.awayTeamStats
          : awayTeamStats // ignore: cast_nullable_to_non_nullable
              as Map<String, Stats>,
      isHomeWinner: isHomeWinner == freezed
          ? _value.isHomeWinner
          : isHomeWinner // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MiniGame extends _MiniGame with DiagnosticableTreeMixin {
  const _$_MiniGame(
      {required this.homeTeamStats,
      required this.awayTeamStats,
      this.isHomeWinner})
      : super._();

  factory _$_MiniGame.fromJson(Map<String, dynamic> json) =>
      _$$_MiniGameFromJson(json);

  @override
  final Map<String, Stats> homeTeamStats;
  @override
  final Map<String, Stats> awayTeamStats;
  @override
  final bool? isHomeWinner;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MiniGame(homeTeamStats: $homeTeamStats, awayTeamStats: $awayTeamStats, isHomeWinner: $isHomeWinner)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MiniGame'))
      ..add(DiagnosticsProperty('homeTeamStats', homeTeamStats))
      ..add(DiagnosticsProperty('awayTeamStats', awayTeamStats))
      ..add(DiagnosticsProperty('isHomeWinner', isHomeWinner));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MiniGame &&
            const DeepCollectionEquality()
                .equals(other.homeTeamStats, homeTeamStats) &&
            const DeepCollectionEquality()
                .equals(other.awayTeamStats, awayTeamStats) &&
            const DeepCollectionEquality()
                .equals(other.isHomeWinner, isHomeWinner));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(homeTeamStats),
      const DeepCollectionEquality().hash(awayTeamStats),
      const DeepCollectionEquality().hash(isHomeWinner));

  @JsonKey(ignore: true)
  @override
  _$MiniGameCopyWith<_MiniGame> get copyWith =>
      __$MiniGameCopyWithImpl<_MiniGame>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MiniGameToJson(this);
  }
}

abstract class _MiniGame extends MiniGame {
  const factory _MiniGame(
      {required Map<String, Stats> homeTeamStats,
      required Map<String, Stats> awayTeamStats,
      bool? isHomeWinner}) = _$_MiniGame;
  const _MiniGame._() : super._();

  factory _MiniGame.fromJson(Map<String, dynamic> json) = _$_MiniGame.fromJson;

  @override
  Map<String, Stats> get homeTeamStats;
  @override
  Map<String, Stats> get awayTeamStats;
  @override
  bool? get isHomeWinner;
  @override
  @JsonKey(ignore: true)
  _$MiniGameCopyWith<_MiniGame> get copyWith =>
      throw _privateConstructorUsedError;
}
