// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Team _$TeamFromJson(Map<String, dynamic> json) {
  return _Team.fromJson(json);
}

/// @nodoc
mixin _$Team {
  String get id => throw _privateConstructorUsedError;
  KasadoUser get teamCaptain => throw _privateConstructorUsedError;
  String get customTeamName => throw _privateConstructorUsedError;
  List<KasadoUser> get players => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeamCopyWith<Team> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamCopyWith<$Res> {
  factory $TeamCopyWith(Team value, $Res Function(Team) then) =
      _$TeamCopyWithImpl<$Res, Team>;
  @useResult
  $Res call(
      {String id,
      KasadoUser teamCaptain,
      String customTeamName,
      List<KasadoUser> players});

  $KasadoUserCopyWith<$Res> get teamCaptain;
}

/// @nodoc
class _$TeamCopyWithImpl<$Res, $Val extends Team>
    implements $TeamCopyWith<$Res> {
  _$TeamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? teamCaptain = null,
    Object? customTeamName = null,
    Object? players = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      teamCaptain: null == teamCaptain
          ? _value.teamCaptain
          : teamCaptain // ignore: cast_nullable_to_non_nullable
              as KasadoUser,
      customTeamName: null == customTeamName
          ? _value.customTeamName
          : customTeamName // ignore: cast_nullable_to_non_nullable
              as String,
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<KasadoUser>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $KasadoUserCopyWith<$Res> get teamCaptain {
    return $KasadoUserCopyWith<$Res>(_value.teamCaptain, (value) {
      return _then(_value.copyWith(teamCaptain: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TeamCopyWith<$Res> implements $TeamCopyWith<$Res> {
  factory _$$_TeamCopyWith(_$_Team value, $Res Function(_$_Team) then) =
      __$$_TeamCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      KasadoUser teamCaptain,
      String customTeamName,
      List<KasadoUser> players});

  @override
  $KasadoUserCopyWith<$Res> get teamCaptain;
}

/// @nodoc
class __$$_TeamCopyWithImpl<$Res> extends _$TeamCopyWithImpl<$Res, _$_Team>
    implements _$$_TeamCopyWith<$Res> {
  __$$_TeamCopyWithImpl(_$_Team _value, $Res Function(_$_Team) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? teamCaptain = null,
    Object? customTeamName = null,
    Object? players = null,
  }) {
    return _then(_$_Team(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      teamCaptain: null == teamCaptain
          ? _value.teamCaptain
          : teamCaptain // ignore: cast_nullable_to_non_nullable
              as KasadoUser,
      customTeamName: null == customTeamName
          ? _value.customTeamName
          : customTeamName // ignore: cast_nullable_to_non_nullable
              as String,
      players: null == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<KasadoUser>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Team extends _Team with DiagnosticableTreeMixin {
  const _$_Team(
      {required this.id,
      required this.teamCaptain,
      this.customTeamName = '',
      final List<KasadoUser> players = const []})
      : _players = players,
        super._();

  factory _$_Team.fromJson(Map<String, dynamic> json) => _$$_TeamFromJson(json);

  @override
  final String id;
  @override
  final KasadoUser teamCaptain;
  @override
  @JsonKey()
  final String customTeamName;
  final List<KasadoUser> _players;
  @override
  @JsonKey()
  List<KasadoUser> get players {
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Team(id: $id, teamCaptain: $teamCaptain, customTeamName: $customTeamName, players: $players)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Team'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('teamCaptain', teamCaptain))
      ..add(DiagnosticsProperty('customTeamName', customTeamName))
      ..add(DiagnosticsProperty('players', players));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Team &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.teamCaptain, teamCaptain) ||
                other.teamCaptain == teamCaptain) &&
            (identical(other.customTeamName, customTeamName) ||
                other.customTeamName == customTeamName) &&
            const DeepCollectionEquality().equals(other._players, _players));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, teamCaptain, customTeamName,
      const DeepCollectionEquality().hash(_players));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TeamCopyWith<_$_Team> get copyWith =>
      __$$_TeamCopyWithImpl<_$_Team>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TeamToJson(
      this,
    );
  }
}

abstract class _Team extends Team {
  const factory _Team(
      {required final String id,
      required final KasadoUser teamCaptain,
      final String customTeamName,
      final List<KasadoUser> players}) = _$_Team;
  const _Team._() : super._();

  factory _Team.fromJson(Map<String, dynamic> json) = _$_Team.fromJson;

  @override
  String get id;
  @override
  KasadoUser get teamCaptain;
  @override
  String get customTeamName;
  @override
  List<KasadoUser> get players;
  @override
  @JsonKey(ignore: true)
  _$$_TeamCopyWith<_$_Team> get copyWith => throw _privateConstructorUsedError;
}
