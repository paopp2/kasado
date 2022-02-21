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
      required List<KasadoUser> players,
      required TimeRange timeRange,
      bool isClosedByAdmin = false}) {
    return _CourtSlot(
      courtId: courtId,
      players: players,
      timeRange: timeRange,
      isClosedByAdmin: isClosedByAdmin,
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
  List<KasadoUser> get players => throw _privateConstructorUsedError;
  TimeRange get timeRange => throw _privateConstructorUsedError;
  bool get isClosedByAdmin => throw _privateConstructorUsedError;

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
      List<KasadoUser> players,
      TimeRange timeRange,
      bool isClosedByAdmin});

  $TimeRangeCopyWith<$Res> get timeRange;
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
    Object? players = freezed,
    Object? timeRange = freezed,
    Object? isClosedByAdmin = freezed,
  }) {
    return _then(_value.copyWith(
      courtId: courtId == freezed
          ? _value.courtId
          : courtId // ignore: cast_nullable_to_non_nullable
              as String,
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<KasadoUser>,
      timeRange: timeRange == freezed
          ? _value.timeRange
          : timeRange // ignore: cast_nullable_to_non_nullable
              as TimeRange,
      isClosedByAdmin: isClosedByAdmin == freezed
          ? _value.isClosedByAdmin
          : isClosedByAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $TimeRangeCopyWith<$Res> get timeRange {
    return $TimeRangeCopyWith<$Res>(_value.timeRange, (value) {
      return _then(_value.copyWith(timeRange: value));
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
      {String courtId,
      List<KasadoUser> players,
      TimeRange timeRange,
      bool isClosedByAdmin});

  @override
  $TimeRangeCopyWith<$Res> get timeRange;
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
    Object? players = freezed,
    Object? timeRange = freezed,
    Object? isClosedByAdmin = freezed,
  }) {
    return _then(_CourtSlot(
      courtId: courtId == freezed
          ? _value.courtId
          : courtId // ignore: cast_nullable_to_non_nullable
              as String,
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<KasadoUser>,
      timeRange: timeRange == freezed
          ? _value.timeRange
          : timeRange // ignore: cast_nullable_to_non_nullable
              as TimeRange,
      isClosedByAdmin: isClosedByAdmin == freezed
          ? _value.isClosedByAdmin
          : isClosedByAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CourtSlot extends _CourtSlot with DiagnosticableTreeMixin {
  const _$_CourtSlot(
      {required this.courtId,
      required this.players,
      required this.timeRange,
      this.isClosedByAdmin = false})
      : super._();

  factory _$_CourtSlot.fromJson(Map<String, dynamic> json) =>
      _$$_CourtSlotFromJson(json);

  @override
  final String courtId;
  @override
  final List<KasadoUser> players;
  @override
  final TimeRange timeRange;
  @JsonKey()
  @override
  final bool isClosedByAdmin;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CourtSlot(courtId: $courtId, players: $players, timeRange: $timeRange, isClosedByAdmin: $isClosedByAdmin)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CourtSlot'))
      ..add(DiagnosticsProperty('courtId', courtId))
      ..add(DiagnosticsProperty('players', players))
      ..add(DiagnosticsProperty('timeRange', timeRange))
      ..add(DiagnosticsProperty('isClosedByAdmin', isClosedByAdmin));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CourtSlot &&
            const DeepCollectionEquality().equals(other.courtId, courtId) &&
            const DeepCollectionEquality().equals(other.players, players) &&
            const DeepCollectionEquality().equals(other.timeRange, timeRange) &&
            const DeepCollectionEquality()
                .equals(other.isClosedByAdmin, isClosedByAdmin));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(courtId),
      const DeepCollectionEquality().hash(players),
      const DeepCollectionEquality().hash(timeRange),
      const DeepCollectionEquality().hash(isClosedByAdmin));

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
      {required String courtId,
      required List<KasadoUser> players,
      required TimeRange timeRange,
      bool isClosedByAdmin}) = _$_CourtSlot;
  const _CourtSlot._() : super._();

  factory _CourtSlot.fromJson(Map<String, dynamic> json) =
      _$_CourtSlot.fromJson;

  @override
  String get courtId;
  @override
  List<KasadoUser> get players;
  @override
  TimeRange get timeRange;
  @override
  bool get isClosedByAdmin;
  @override
  @JsonKey(ignore: true)
  _$CourtSlotCopyWith<_CourtSlot> get copyWith =>
      throw _privateConstructorUsedError;
}
