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
      {required String courtId,
      required String courtName,
      required String courtPhotoUrl,
      required List<KasadoUser> players,
      required double ticketPrice}) {
    return _CourtSlot(
      courtId: courtId,
      courtName: courtName,
      courtPhotoUrl: courtPhotoUrl,
      players: players,
      ticketPrice: ticketPrice,
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
  String get courtId => throw _privateConstructorUsedError;
  String get courtName => throw _privateConstructorUsedError;
  String get courtPhotoUrl => throw _privateConstructorUsedError;
  List<KasadoUser> get players => throw _privateConstructorUsedError;
  double get ticketPrice => throw _privateConstructorUsedError;

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
      {String courtId,
      String courtName,
      String courtPhotoUrl,
      List<KasadoUser> players,
      double ticketPrice});
}

/// @nodoc
class _$CourtSlotCopyWithImpl<$Res> implements $CourtSlotCopyWith<$Res> {
  _$CourtSlotCopyWithImpl(this._value, this._then);

  final CourtSlot _value;
  // ignore: unused_field
  final $Res Function(CourtSlot) _then;

  @override
  $Res call({
    Object? courtId = freezed,
    Object? courtName = freezed,
    Object? courtPhotoUrl = freezed,
    Object? players = freezed,
    Object? ticketPrice = freezed,
  }) {
    return _then(_value.copyWith(
      courtId: courtId == freezed
          ? _value.courtId
          : courtId // ignore: cast_nullable_to_non_nullable
              as String,
      courtName: courtName == freezed
          ? _value.courtName
          : courtName // ignore: cast_nullable_to_non_nullable
              as String,
      courtPhotoUrl: courtPhotoUrl == freezed
          ? _value.courtPhotoUrl
          : courtPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<KasadoUser>,
      ticketPrice: ticketPrice == freezed
          ? _value.ticketPrice
          : ticketPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$CourtSlotCopyWith<$Res> implements $CourtSlotCopyWith<$Res> {
  factory _$CourtSlotCopyWith(
          _CourtSlot value, $Res Function(_CourtSlot) then) =
      __$CourtSlotCopyWithImpl<$Res>;
  @override
  $Res call(
      {String courtId,
      String courtName,
      String courtPhotoUrl,
      List<KasadoUser> players,
      double ticketPrice});
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
    Object? courtId = freezed,
    Object? courtName = freezed,
    Object? courtPhotoUrl = freezed,
    Object? players = freezed,
    Object? ticketPrice = freezed,
  }) {
    return _then(_CourtSlot(
      courtId: courtId == freezed
          ? _value.courtId
          : courtId // ignore: cast_nullable_to_non_nullable
              as String,
      courtName: courtName == freezed
          ? _value.courtName
          : courtName // ignore: cast_nullable_to_non_nullable
              as String,
      courtPhotoUrl: courtPhotoUrl == freezed
          ? _value.courtPhotoUrl
          : courtPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<KasadoUser>,
      ticketPrice: ticketPrice == freezed
          ? _value.ticketPrice
          : ticketPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CourtSlot with DiagnosticableTreeMixin implements _CourtSlot {
  const _$_CourtSlot(
      {required this.courtId,
      required this.courtName,
      required this.courtPhotoUrl,
      required this.players,
      required this.ticketPrice});

  factory _$_CourtSlot.fromJson(Map<String, dynamic> json) =>
      _$$_CourtSlotFromJson(json);

  @override
  final String courtId;
  @override
  final String courtName;
  @override
  final String courtPhotoUrl;
  @override
  final List<KasadoUser> players;
  @override
  final double ticketPrice;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CourtSlot(courtId: $courtId, courtName: $courtName, courtPhotoUrl: $courtPhotoUrl, players: $players, ticketPrice: $ticketPrice)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CourtSlot'))
      ..add(DiagnosticsProperty('courtId', courtId))
      ..add(DiagnosticsProperty('courtName', courtName))
      ..add(DiagnosticsProperty('courtPhotoUrl', courtPhotoUrl))
      ..add(DiagnosticsProperty('players', players))
      ..add(DiagnosticsProperty('ticketPrice', ticketPrice));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CourtSlot &&
            const DeepCollectionEquality().equals(other.courtId, courtId) &&
            const DeepCollectionEquality().equals(other.courtName, courtName) &&
            const DeepCollectionEquality()
                .equals(other.courtPhotoUrl, courtPhotoUrl) &&
            const DeepCollectionEquality().equals(other.players, players) &&
            const DeepCollectionEquality()
                .equals(other.ticketPrice, ticketPrice));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(courtId),
      const DeepCollectionEquality().hash(courtName),
      const DeepCollectionEquality().hash(courtPhotoUrl),
      const DeepCollectionEquality().hash(players),
      const DeepCollectionEquality().hash(ticketPrice));

  @JsonKey(ignore: true)
  @override
  _$CourtSlotCopyWith<_CourtSlot> get copyWith =>
      __$CourtSlotCopyWithImpl<_CourtSlot>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CourtSlotToJson(this);
  }
}

abstract class _CourtSlot implements CourtSlot {
  const factory _CourtSlot(
      {required String courtId,
      required String courtName,
      required String courtPhotoUrl,
      required List<KasadoUser> players,
      required double ticketPrice}) = _$_CourtSlot;

  factory _CourtSlot.fromJson(Map<String, dynamic> json) =
      _$_CourtSlot.fromJson;

  @override
  String get courtId;
  @override
  String get courtName;
  @override
  String get courtPhotoUrl;
  @override
  List<KasadoUser> get players;
  @override
  double get ticketPrice;
  @override
  @JsonKey(ignore: true)
  _$CourtSlotCopyWith<_CourtSlot> get copyWith =>
      throw _privateConstructorUsedError;
}
