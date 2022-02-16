// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'court_slot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CourtSlot _$CourtSlotFromJson(Map<String, dynamic> json) {
  return _CourtSlot.fromJson(json);
}

/// @nodoc
class _$CourtSlotTearOff {
  const _$CourtSlotTearOff();

  _CourtSlot call(
      {required Court court,
      required List<KasadoUser> players,
      required DateTime startsAt,
      required DateTime endsAt}) {
    return _CourtSlot(
      court: court,
      players: players,
      startsAt: startsAt,
      endsAt: endsAt,
    );
  }

  CourtSlot fromJson(Map<String, Object?> json) {
    return CourtSlot.fromJson(json);
  }
}

/// @nodoc
const $CourtSlot = _$CourtSlotTearOff();

/// @nodoc
mixin _$CourtSlot {
  Court get court => throw _privateConstructorUsedError;
  List<KasadoUser> get players => throw _privateConstructorUsedError;
  DateTime get startsAt => throw _privateConstructorUsedError;
  DateTime get endsAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourtSlotCopyWith<CourtSlot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourtSlotCopyWith<$Res> {
  factory $CourtSlotCopyWith(CourtSlot value, $Res Function(CourtSlot) then) =
      _$CourtSlotCopyWithImpl<$Res>;
  $Res call(
      {Court court,
      List<KasadoUser> players,
      DateTime startsAt,
      DateTime endsAt});

  $CourtCopyWith<$Res> get court;
}

/// @nodoc
class _$CourtSlotCopyWithImpl<$Res> implements $CourtSlotCopyWith<$Res> {
  _$CourtSlotCopyWithImpl(this._value, this._then);

  final CourtSlot _value;
  // ignore: unused_field
  final $Res Function(CourtSlot) _then;

  @override
  $Res call({
    Object? court = freezed,
    Object? players = freezed,
    Object? startsAt = freezed,
    Object? endsAt = freezed,
  }) {
    return _then(_value.copyWith(
      court: court == freezed
          ? _value.court
          : court // ignore: cast_nullable_to_non_nullable
              as Court,
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<KasadoUser>,
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

  @override
  $CourtCopyWith<$Res> get court {
    return $CourtCopyWith<$Res>(_value.court, (value) {
      return _then(_value.copyWith(court: value));
    });
  }
}

/// @nodoc
abstract class _$CourtSlotCopyWith<$Res> implements $CourtSlotCopyWith<$Res> {
  factory _$CourtSlotCopyWith(
          _CourtSlot value, $Res Function(_CourtSlot) then) =
      __$CourtSlotCopyWithImpl<$Res>;
  @override
  $Res call(
      {Court court,
      List<KasadoUser> players,
      DateTime startsAt,
      DateTime endsAt});

  @override
  $CourtCopyWith<$Res> get court;
}

/// @nodoc
class __$CourtSlotCopyWithImpl<$Res> extends _$CourtSlotCopyWithImpl<$Res>
    implements _$CourtSlotCopyWith<$Res> {
  __$CourtSlotCopyWithImpl(_CourtSlot _value, $Res Function(_CourtSlot) _then)
      : super(_value, (v) => _then(v as _CourtSlot));

  @override
  _CourtSlot get _value => super._value as _CourtSlot;

  @override
  $Res call({
    Object? court = freezed,
    Object? players = freezed,
    Object? startsAt = freezed,
    Object? endsAt = freezed,
  }) {
    return _then(_CourtSlot(
      court: court == freezed
          ? _value.court
          : court // ignore: cast_nullable_to_non_nullable
              as Court,
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<KasadoUser>,
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
class _$_CourtSlot extends _CourtSlot with DiagnosticableTreeMixin {
  const _$_CourtSlot(
      {required this.court,
      required this.players,
      required this.startsAt,
      required this.endsAt})
      : super._();

  factory _$_CourtSlot.fromJson(Map<String, dynamic> json) =>
      _$$_CourtSlotFromJson(json);

  @override
  final Court court;
  @override
  final List<KasadoUser> players;
  @override
  final DateTime startsAt;
  @override
  final DateTime endsAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CourtSlot(court: $court, players: $players, startsAt: $startsAt, endsAt: $endsAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CourtSlot'))
      ..add(DiagnosticsProperty('court', court))
      ..add(DiagnosticsProperty('players', players))
      ..add(DiagnosticsProperty('startsAt', startsAt))
      ..add(DiagnosticsProperty('endsAt', endsAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CourtSlot &&
            const DeepCollectionEquality().equals(other.court, court) &&
            const DeepCollectionEquality().equals(other.players, players) &&
            const DeepCollectionEquality().equals(other.startsAt, startsAt) &&
            const DeepCollectionEquality().equals(other.endsAt, endsAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(court),
      const DeepCollectionEquality().hash(players),
      const DeepCollectionEquality().hash(startsAt),
      const DeepCollectionEquality().hash(endsAt));

  @JsonKey(ignore: true)
  @override
  _$CourtSlotCopyWith<_CourtSlot> get copyWith =>
      __$CourtSlotCopyWithImpl<_CourtSlot>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CourtSlotToJson(this);
  }
}

abstract class _CourtSlot extends CourtSlot {
  const factory _CourtSlot(
      {required Court court,
      required List<KasadoUser> players,
      required DateTime startsAt,
      required DateTime endsAt}) = _$_CourtSlot;
  const _CourtSlot._() : super._();

  factory _CourtSlot.fromJson(Map<String, dynamic> json) =
      _$_CourtSlot.fromJson;

  @override
  Court get court;
  @override
  List<KasadoUser> get players;
  @override
  DateTime get startsAt;
  @override
  DateTime get endsAt;
  @override
  @JsonKey(ignore: true)
  _$CourtSlotCopyWith<_CourtSlot> get copyWith =>
      throw _privateConstructorUsedError;
}
