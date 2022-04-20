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
      {required String slotId,
      required String courtId,
      required TimeRange timeRange,
      required String courtName,
      List<KasadoUser> players = const [],
      bool isClosedByAdmin = false,
      String? liveGameStatsId = null,
      List<KasadoUser>? stageHomeTeamPlayers = const [],
      List<KasadoUser>? stageAwayTeamPlayers = const [],
      Map<String, SlotPlayerInfo> slotInfoPerPlayer = const {}}) {
    return _CourtSlot(
      slotId: slotId,
      courtId: courtId,
      timeRange: timeRange,
      courtName: courtName,
      players: players,
      isClosedByAdmin: isClosedByAdmin,
      liveGameStatsId: liveGameStatsId,
      stageHomeTeamPlayers: stageHomeTeamPlayers,
      stageAwayTeamPlayers: stageAwayTeamPlayers,
      slotInfoPerPlayer: slotInfoPerPlayer,
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
  String get slotId => throw _privateConstructorUsedError;
  String get courtId => throw _privateConstructorUsedError;
  TimeRange get timeRange => throw _privateConstructorUsedError;
  String get courtName => throw _privateConstructorUsedError;
  List<KasadoUser> get players => throw _privateConstructorUsedError;
  bool get isClosedByAdmin => throw _privateConstructorUsedError;
  String? get liveGameStatsId => throw _privateConstructorUsedError;
  List<KasadoUser>? get stageHomeTeamPlayers =>
      throw _privateConstructorUsedError;
  List<KasadoUser>? get stageAwayTeamPlayers =>
      throw _privateConstructorUsedError;
  Map<String, SlotPlayerInfo> get slotInfoPerPlayer =>
      throw _privateConstructorUsedError;

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
      {String slotId,
      String courtId,
      TimeRange timeRange,
      String courtName,
      List<KasadoUser> players,
      bool isClosedByAdmin,
      String? liveGameStatsId,
      List<KasadoUser>? stageHomeTeamPlayers,
      List<KasadoUser>? stageAwayTeamPlayers,
      Map<String, SlotPlayerInfo> slotInfoPerPlayer});

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
    Object? slotId = freezed,
    Object? courtId = freezed,
    Object? timeRange = freezed,
    Object? courtName = freezed,
    Object? players = freezed,
    Object? isClosedByAdmin = freezed,
    Object? liveGameStatsId = freezed,
    Object? stageHomeTeamPlayers = freezed,
    Object? stageAwayTeamPlayers = freezed,
    Object? slotInfoPerPlayer = freezed,
  }) {
    return _then(_value.copyWith(
      slotId: slotId == freezed
          ? _value.slotId
          : slotId // ignore: cast_nullable_to_non_nullable
              as String,
      courtId: courtId == freezed
          ? _value.courtId
          : courtId // ignore: cast_nullable_to_non_nullable
              as String,
      timeRange: timeRange == freezed
          ? _value.timeRange
          : timeRange // ignore: cast_nullable_to_non_nullable
              as TimeRange,
      courtName: courtName == freezed
          ? _value.courtName
          : courtName // ignore: cast_nullable_to_non_nullable
              as String,
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<KasadoUser>,
      isClosedByAdmin: isClosedByAdmin == freezed
          ? _value.isClosedByAdmin
          : isClosedByAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      liveGameStatsId: liveGameStatsId == freezed
          ? _value.liveGameStatsId
          : liveGameStatsId // ignore: cast_nullable_to_non_nullable
              as String?,
      stageHomeTeamPlayers: stageHomeTeamPlayers == freezed
          ? _value.stageHomeTeamPlayers
          : stageHomeTeamPlayers // ignore: cast_nullable_to_non_nullable
              as List<KasadoUser>?,
      stageAwayTeamPlayers: stageAwayTeamPlayers == freezed
          ? _value.stageAwayTeamPlayers
          : stageAwayTeamPlayers // ignore: cast_nullable_to_non_nullable
              as List<KasadoUser>?,
      slotInfoPerPlayer: slotInfoPerPlayer == freezed
          ? _value.slotInfoPerPlayer
          : slotInfoPerPlayer // ignore: cast_nullable_to_non_nullable
              as Map<String, SlotPlayerInfo>,
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
      {String slotId,
      String courtId,
      TimeRange timeRange,
      String courtName,
      List<KasadoUser> players,
      bool isClosedByAdmin,
      String? liveGameStatsId,
      List<KasadoUser>? stageHomeTeamPlayers,
      List<KasadoUser>? stageAwayTeamPlayers,
      Map<String, SlotPlayerInfo> slotInfoPerPlayer});

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
    Object? slotId = freezed,
    Object? courtId = freezed,
    Object? timeRange = freezed,
    Object? courtName = freezed,
    Object? players = freezed,
    Object? isClosedByAdmin = freezed,
    Object? liveGameStatsId = freezed,
    Object? stageHomeTeamPlayers = freezed,
    Object? stageAwayTeamPlayers = freezed,
    Object? slotInfoPerPlayer = freezed,
  }) {
    return _then(_CourtSlot(
      slotId: slotId == freezed
          ? _value.slotId
          : slotId // ignore: cast_nullable_to_non_nullable
              as String,
      courtId: courtId == freezed
          ? _value.courtId
          : courtId // ignore: cast_nullable_to_non_nullable
              as String,
      timeRange: timeRange == freezed
          ? _value.timeRange
          : timeRange // ignore: cast_nullable_to_non_nullable
              as TimeRange,
      courtName: courtName == freezed
          ? _value.courtName
          : courtName // ignore: cast_nullable_to_non_nullable
              as String,
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<KasadoUser>,
      isClosedByAdmin: isClosedByAdmin == freezed
          ? _value.isClosedByAdmin
          : isClosedByAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      liveGameStatsId: liveGameStatsId == freezed
          ? _value.liveGameStatsId
          : liveGameStatsId // ignore: cast_nullable_to_non_nullable
              as String?,
      stageHomeTeamPlayers: stageHomeTeamPlayers == freezed
          ? _value.stageHomeTeamPlayers
          : stageHomeTeamPlayers // ignore: cast_nullable_to_non_nullable
              as List<KasadoUser>?,
      stageAwayTeamPlayers: stageAwayTeamPlayers == freezed
          ? _value.stageAwayTeamPlayers
          : stageAwayTeamPlayers // ignore: cast_nullable_to_non_nullable
              as List<KasadoUser>?,
      slotInfoPerPlayer: slotInfoPerPlayer == freezed
          ? _value.slotInfoPerPlayer
          : slotInfoPerPlayer // ignore: cast_nullable_to_non_nullable
              as Map<String, SlotPlayerInfo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CourtSlot extends _CourtSlot with DiagnosticableTreeMixin {
  const _$_CourtSlot(
      {required this.slotId,
      required this.courtId,
      required this.timeRange,
      required this.courtName,
      this.players = const [],
      this.isClosedByAdmin = false,
      this.liveGameStatsId = null,
      this.stageHomeTeamPlayers = const [],
      this.stageAwayTeamPlayers = const [],
      this.slotInfoPerPlayer = const {}})
      : super._();

  factory _$_CourtSlot.fromJson(Map<String, dynamic> json) =>
      _$$_CourtSlotFromJson(json);

  @override
  final String slotId;
  @override
  final String courtId;
  @override
  final TimeRange timeRange;
  @override
  final String courtName;
  @JsonKey()
  @override
  final List<KasadoUser> players;
  @JsonKey()
  @override
  final bool isClosedByAdmin;
  @JsonKey()
  @override
  final String? liveGameStatsId;
  @JsonKey()
  @override
  final List<KasadoUser>? stageHomeTeamPlayers;
  @JsonKey()
  @override
  final List<KasadoUser>? stageAwayTeamPlayers;
  @JsonKey()
  @override
  final Map<String, SlotPlayerInfo> slotInfoPerPlayer;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CourtSlot(slotId: $slotId, courtId: $courtId, timeRange: $timeRange, courtName: $courtName, players: $players, isClosedByAdmin: $isClosedByAdmin, liveGameStatsId: $liveGameStatsId, stageHomeTeamPlayers: $stageHomeTeamPlayers, stageAwayTeamPlayers: $stageAwayTeamPlayers, slotInfoPerPlayer: $slotInfoPerPlayer)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CourtSlot'))
      ..add(DiagnosticsProperty('slotId', slotId))
      ..add(DiagnosticsProperty('courtId', courtId))
      ..add(DiagnosticsProperty('timeRange', timeRange))
      ..add(DiagnosticsProperty('courtName', courtName))
      ..add(DiagnosticsProperty('players', players))
      ..add(DiagnosticsProperty('isClosedByAdmin', isClosedByAdmin))
      ..add(DiagnosticsProperty('liveGameStatsId', liveGameStatsId))
      ..add(DiagnosticsProperty('stageHomeTeamPlayers', stageHomeTeamPlayers))
      ..add(DiagnosticsProperty('stageAwayTeamPlayers', stageAwayTeamPlayers))
      ..add(DiagnosticsProperty('slotInfoPerPlayer', slotInfoPerPlayer));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CourtSlot &&
            const DeepCollectionEquality().equals(other.slotId, slotId) &&
            const DeepCollectionEquality().equals(other.courtId, courtId) &&
            const DeepCollectionEquality().equals(other.timeRange, timeRange) &&
            const DeepCollectionEquality().equals(other.courtName, courtName) &&
            const DeepCollectionEquality().equals(other.players, players) &&
            const DeepCollectionEquality()
                .equals(other.isClosedByAdmin, isClosedByAdmin) &&
            const DeepCollectionEquality()
                .equals(other.liveGameStatsId, liveGameStatsId) &&
            const DeepCollectionEquality()
                .equals(other.stageHomeTeamPlayers, stageHomeTeamPlayers) &&
            const DeepCollectionEquality()
                .equals(other.stageAwayTeamPlayers, stageAwayTeamPlayers) &&
            const DeepCollectionEquality()
                .equals(other.slotInfoPerPlayer, slotInfoPerPlayer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(slotId),
      const DeepCollectionEquality().hash(courtId),
      const DeepCollectionEquality().hash(timeRange),
      const DeepCollectionEquality().hash(courtName),
      const DeepCollectionEquality().hash(players),
      const DeepCollectionEquality().hash(isClosedByAdmin),
      const DeepCollectionEquality().hash(liveGameStatsId),
      const DeepCollectionEquality().hash(stageHomeTeamPlayers),
      const DeepCollectionEquality().hash(stageAwayTeamPlayers),
      const DeepCollectionEquality().hash(slotInfoPerPlayer));

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
      {required String slotId,
      required String courtId,
      required TimeRange timeRange,
      required String courtName,
      List<KasadoUser> players,
      bool isClosedByAdmin,
      String? liveGameStatsId,
      List<KasadoUser>? stageHomeTeamPlayers,
      List<KasadoUser>? stageAwayTeamPlayers,
      Map<String, SlotPlayerInfo> slotInfoPerPlayer}) = _$_CourtSlot;
  const _CourtSlot._() : super._();

  factory _CourtSlot.fromJson(Map<String, dynamic> json) =
      _$_CourtSlot.fromJson;

  @override
  String get slotId;
  @override
  String get courtId;
  @override
  TimeRange get timeRange;
  @override
  String get courtName;
  @override
  List<KasadoUser> get players;
  @override
  bool get isClosedByAdmin;
  @override
  String? get liveGameStatsId;
  @override
  List<KasadoUser>? get stageHomeTeamPlayers;
  @override
  List<KasadoUser>? get stageAwayTeamPlayers;
  @override
  Map<String, SlotPlayerInfo> get slotInfoPerPlayer;
  @override
  @JsonKey(ignore: true)
  _$CourtSlotCopyWith<_CourtSlot> get copyWith =>
      throw _privateConstructorUsedError;
}
