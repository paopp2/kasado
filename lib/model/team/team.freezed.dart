// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'team.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Team _$TeamFromJson(Map<String, dynamic> json) {
  return _Team.fromJson(json);
}

/// @nodoc
class _$TeamTearOff {
  const _$TeamTearOff();

  _Team call(
      {required String id,
      KasadoUser? teamCaptain,
      List<KasadoUser> players = const [],
      CourtSlot? nextGame}) {
    return _Team(
      id: id,
      teamCaptain: teamCaptain,
      players: players,
      nextGame: nextGame,
    );
  }

  Team fromJson(Map<String, Object?> json) {
    return Team.fromJson(json);
  }
}

/// @nodoc
const $Team = _$TeamTearOff();

/// @nodoc
mixin _$Team {
  String get id => throw _privateConstructorUsedError;
  KasadoUser? get teamCaptain => throw _privateConstructorUsedError;
  List<KasadoUser> get players => throw _privateConstructorUsedError;
  CourtSlot? get nextGame => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeamCopyWith<Team> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamCopyWith<$Res> {
  factory $TeamCopyWith(Team value, $Res Function(Team) then) =
      _$TeamCopyWithImpl<$Res>;
  $Res call(
      {String id,
      KasadoUser? teamCaptain,
      List<KasadoUser> players,
      CourtSlot? nextGame});

  $KasadoUserCopyWith<$Res>? get teamCaptain;
  $CourtSlotCopyWith<$Res>? get nextGame;
}

/// @nodoc
class _$TeamCopyWithImpl<$Res> implements $TeamCopyWith<$Res> {
  _$TeamCopyWithImpl(this._value, this._then);

  final Team _value;
  // ignore: unused_field
  final $Res Function(Team) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? teamCaptain = freezed,
    Object? players = freezed,
    Object? nextGame = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      teamCaptain: teamCaptain == freezed
          ? _value.teamCaptain
          : teamCaptain // ignore: cast_nullable_to_non_nullable
              as KasadoUser?,
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<KasadoUser>,
      nextGame: nextGame == freezed
          ? _value.nextGame
          : nextGame // ignore: cast_nullable_to_non_nullable
              as CourtSlot?,
    ));
  }

  @override
  $KasadoUserCopyWith<$Res>? get teamCaptain {
    if (_value.teamCaptain == null) {
      return null;
    }

    return $KasadoUserCopyWith<$Res>(_value.teamCaptain!, (value) {
      return _then(_value.copyWith(teamCaptain: value));
    });
  }

  @override
  $CourtSlotCopyWith<$Res>? get nextGame {
    if (_value.nextGame == null) {
      return null;
    }

    return $CourtSlotCopyWith<$Res>(_value.nextGame!, (value) {
      return _then(_value.copyWith(nextGame: value));
    });
  }
}

/// @nodoc
abstract class _$TeamCopyWith<$Res> implements $TeamCopyWith<$Res> {
  factory _$TeamCopyWith(_Team value, $Res Function(_Team) then) =
      __$TeamCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      KasadoUser? teamCaptain,
      List<KasadoUser> players,
      CourtSlot? nextGame});

  @override
  $KasadoUserCopyWith<$Res>? get teamCaptain;
  @override
  $CourtSlotCopyWith<$Res>? get nextGame;
}

/// @nodoc
class __$TeamCopyWithImpl<$Res> extends _$TeamCopyWithImpl<$Res>
    implements _$TeamCopyWith<$Res> {
  __$TeamCopyWithImpl(_Team _value, $Res Function(_Team) _then)
      : super(_value, (v) => _then(v as _Team));

  @override
  _Team get _value => super._value as _Team;

  @override
  $Res call({
    Object? id = freezed,
    Object? teamCaptain = freezed,
    Object? players = freezed,
    Object? nextGame = freezed,
  }) {
    return _then(_Team(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      teamCaptain: teamCaptain == freezed
          ? _value.teamCaptain
          : teamCaptain // ignore: cast_nullable_to_non_nullable
              as KasadoUser?,
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<KasadoUser>,
      nextGame: nextGame == freezed
          ? _value.nextGame
          : nextGame // ignore: cast_nullable_to_non_nullable
              as CourtSlot?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Team with DiagnosticableTreeMixin implements _Team {
  const _$_Team(
      {required this.id,
      this.teamCaptain,
      this.players = const [],
      this.nextGame});

  factory _$_Team.fromJson(Map<String, dynamic> json) => _$$_TeamFromJson(json);

  @override
  final String id;
  @override
  final KasadoUser? teamCaptain;
  @JsonKey()
  @override
  final List<KasadoUser> players;
  @override
  final CourtSlot? nextGame;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Team(id: $id, teamCaptain: $teamCaptain, players: $players, nextGame: $nextGame)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Team'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('teamCaptain', teamCaptain))
      ..add(DiagnosticsProperty('players', players))
      ..add(DiagnosticsProperty('nextGame', nextGame));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Team &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.teamCaptain, teamCaptain) &&
            const DeepCollectionEquality().equals(other.players, players) &&
            const DeepCollectionEquality().equals(other.nextGame, nextGame));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(teamCaptain),
      const DeepCollectionEquality().hash(players),
      const DeepCollectionEquality().hash(nextGame));

  @JsonKey(ignore: true)
  @override
  _$TeamCopyWith<_Team> get copyWith =>
      __$TeamCopyWithImpl<_Team>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TeamToJson(this);
  }
}

abstract class _Team implements Team {
  const factory _Team(
      {required String id,
      KasadoUser? teamCaptain,
      List<KasadoUser> players,
      CourtSlot? nextGame}) = _$_Team;

  factory _Team.fromJson(Map<String, dynamic> json) = _$_Team.fromJson;

  @override
  String get id;
  @override
  KasadoUser? get teamCaptain;
  @override
  List<KasadoUser> get players;
  @override
  CourtSlot? get nextGame;
  @override
  @JsonKey(ignore: true)
  _$TeamCopyWith<_Team> get copyWith => throw _privateConstructorUsedError;
}
