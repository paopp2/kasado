// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'court_slot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CourtSlot _$CourtSlotFromJson(Map<String, dynamic> json) {
  return _CourtSlot.fromJson(json);
}

/// @nodoc
mixin _$CourtSlot {
  String get slotId => throw _privateConstructorUsedError;
  String get courtId => throw _privateConstructorUsedError;
  TimeRange get timeRange =>
      throw _privateConstructorUsedError; // TODO: Assert courtName and ticketPrice as required
// (Firestore might have to be edited manually to avoid null errors)
  String get courtName => throw _privateConstructorUsedError;
  double get ticketPrice => throw _privateConstructorUsedError;
  List<KasadoUser> get players => throw _privateConstructorUsedError;
  bool get isClosedByAdmin => throw _privateConstructorUsedError;
  String? get liveGameStatsId => throw _privateConstructorUsedError;
  List<KasadoUser>? get stageHomeTeamPlayers =>
      throw _privateConstructorUsedError;
  List<KasadoUser>? get stageAwayTeamPlayers =>
      throw _privateConstructorUsedError;
  Map<String, SlotPlayerInfo> get slotInfoPerPlayer =>
      throw _privateConstructorUsedError;
  int get maxPlayerCount => throw _privateConstructorUsedError;
  int get minPlayerCount => throw _privateConstructorUsedError;
  List<String> get playerIdQueue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourtSlotCopyWith<CourtSlot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourtSlotCopyWith<$Res> {
  factory $CourtSlotCopyWith(CourtSlot value, $Res Function(CourtSlot) then) =
      _$CourtSlotCopyWithImpl<$Res, CourtSlot>;
  @useResult
  $Res call(
      {String slotId,
      String courtId,
      TimeRange timeRange,
      String courtName,
      double ticketPrice,
      List<KasadoUser> players,
      bool isClosedByAdmin,
      String? liveGameStatsId,
      List<KasadoUser>? stageHomeTeamPlayers,
      List<KasadoUser>? stageAwayTeamPlayers,
      Map<String, SlotPlayerInfo> slotInfoPerPlayer,
      int maxPlayerCount,
      int minPlayerCount,
      List<String> playerIdQueue});

  $TimeRangeCopyWith<$Res> get timeRange;
}

/// @nodoc
class _$CourtSlotCopyWithImpl<$Res, $Val extends CourtSlot>
    implements $CourtSlotCopyWith<$Res> {
  _$CourtSlotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slotId = null,
    Object? courtId = null,
    Object? timeRange = null,
    Object? courtName = null,
    Object? ticketPrice = null,
    Object? players = null,
    Object? isClosedByAdmin = null,
    Object? liveGameStatsId = freezed,
    Object? stageHomeTeamPlayers = freezed,
    Object? stageAwayTeamPlayers = freezed,
    Object? slotInfoPerPlayer = null,
    Object? maxPlayerCount = null,
    Object? minPlayerCount = null,
    Object? playerIdQueue = null,
  }) {
    return _then(_value.copyWith(
      slotId: null == slotId
          ? _value.slotId
          : slotId // ignore: cast_nullable_to_non_nullable
              as String,
      courtId: null == courtId
          ? _value.courtId
          : courtId // ignore: cast_nullable_to_non_nullable
              as String,
      timeRange: null == timeRange
          ? _value.timeRange
          : timeRange // ignore: cast_nullable_to_non_nullable
              as TimeRange,
      courtName: null == courtName
          ? _value.courtName
          : courtName // ignore: cast_nullable_to_non_nullable
              as String,
      ticketPrice: null == ticketPrice
          ? _value.ticketPrice
          : ticketPrice // ignore: cast_nullable_to_non_nullable
              as double,
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<KasadoUser>,
      isClosedByAdmin: null == isClosedByAdmin
          ? _value.isClosedByAdmin
          : isClosedByAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      liveGameStatsId: freezed == liveGameStatsId
          ? _value.liveGameStatsId
          : liveGameStatsId // ignore: cast_nullable_to_non_nullable
              as String?,
      stageHomeTeamPlayers: freezed == stageHomeTeamPlayers
          ? _value.stageHomeTeamPlayers
          : stageHomeTeamPlayers // ignore: cast_nullable_to_non_nullable
              as List<KasadoUser>?,
      stageAwayTeamPlayers: freezed == stageAwayTeamPlayers
          ? _value.stageAwayTeamPlayers
          : stageAwayTeamPlayers // ignore: cast_nullable_to_non_nullable
              as List<KasadoUser>?,
      slotInfoPerPlayer: null == slotInfoPerPlayer
          ? _value.slotInfoPerPlayer
          : slotInfoPerPlayer // ignore: cast_nullable_to_non_nullable
              as Map<String, SlotPlayerInfo>,
      maxPlayerCount: null == maxPlayerCount
          ? _value.maxPlayerCount
          : maxPlayerCount // ignore: cast_nullable_to_non_nullable
              as int,
      minPlayerCount: null == minPlayerCount
          ? _value.minPlayerCount
          : minPlayerCount // ignore: cast_nullable_to_non_nullable
              as int,
      playerIdQueue: null == playerIdQueue
          ? _value.playerIdQueue
          : playerIdQueue // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TimeRangeCopyWith<$Res> get timeRange {
    return $TimeRangeCopyWith<$Res>(_value.timeRange, (value) {
      return _then(_value.copyWith(timeRange: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CourtSlotCopyWith<$Res> implements $CourtSlotCopyWith<$Res> {
  factory _$$_CourtSlotCopyWith(
          _$_CourtSlot value, $Res Function(_$_CourtSlot) then) =
      __$$_CourtSlotCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String slotId,
      String courtId,
      TimeRange timeRange,
      String courtName,
      double ticketPrice,
      List<KasadoUser> players,
      bool isClosedByAdmin,
      String? liveGameStatsId,
      List<KasadoUser>? stageHomeTeamPlayers,
      List<KasadoUser>? stageAwayTeamPlayers,
      Map<String, SlotPlayerInfo> slotInfoPerPlayer,
      int maxPlayerCount,
      int minPlayerCount,
      List<String> playerIdQueue});

  @override
  $TimeRangeCopyWith<$Res> get timeRange;
}

/// @nodoc
class __$$_CourtSlotCopyWithImpl<$Res>
    extends _$CourtSlotCopyWithImpl<$Res, _$_CourtSlot>
    implements _$$_CourtSlotCopyWith<$Res> {
  __$$_CourtSlotCopyWithImpl(
      _$_CourtSlot _value, $Res Function(_$_CourtSlot) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slotId = null,
    Object? courtId = null,
    Object? timeRange = null,
    Object? courtName = null,
    Object? ticketPrice = null,
    Object? players = null,
    Object? isClosedByAdmin = null,
    Object? liveGameStatsId = freezed,
    Object? stageHomeTeamPlayers = freezed,
    Object? stageAwayTeamPlayers = freezed,
    Object? slotInfoPerPlayer = null,
    Object? maxPlayerCount = null,
    Object? minPlayerCount = null,
    Object? playerIdQueue = null,
  }) {
    return _then(_$_CourtSlot(
      slotId: null == slotId
          ? _value.slotId
          : slotId // ignore: cast_nullable_to_non_nullable
              as String,
      courtId: null == courtId
          ? _value.courtId
          : courtId // ignore: cast_nullable_to_non_nullable
              as String,
      timeRange: null == timeRange
          ? _value.timeRange
          : timeRange // ignore: cast_nullable_to_non_nullable
              as TimeRange,
      courtName: null == courtName
          ? _value.courtName
          : courtName // ignore: cast_nullable_to_non_nullable
              as String,
      ticketPrice: null == ticketPrice
          ? _value.ticketPrice
          : ticketPrice // ignore: cast_nullable_to_non_nullable
              as double,
      players: null == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<KasadoUser>,
      isClosedByAdmin: null == isClosedByAdmin
          ? _value.isClosedByAdmin
          : isClosedByAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      liveGameStatsId: freezed == liveGameStatsId
          ? _value.liveGameStatsId
          : liveGameStatsId // ignore: cast_nullable_to_non_nullable
              as String?,
      stageHomeTeamPlayers: freezed == stageHomeTeamPlayers
          ? _value._stageHomeTeamPlayers
          : stageHomeTeamPlayers // ignore: cast_nullable_to_non_nullable
              as List<KasadoUser>?,
      stageAwayTeamPlayers: freezed == stageAwayTeamPlayers
          ? _value._stageAwayTeamPlayers
          : stageAwayTeamPlayers // ignore: cast_nullable_to_non_nullable
              as List<KasadoUser>?,
      slotInfoPerPlayer: null == slotInfoPerPlayer
          ? _value._slotInfoPerPlayer
          : slotInfoPerPlayer // ignore: cast_nullable_to_non_nullable
              as Map<String, SlotPlayerInfo>,
      maxPlayerCount: null == maxPlayerCount
          ? _value.maxPlayerCount
          : maxPlayerCount // ignore: cast_nullable_to_non_nullable
              as int,
      minPlayerCount: null == minPlayerCount
          ? _value.minPlayerCount
          : minPlayerCount // ignore: cast_nullable_to_non_nullable
              as int,
      playerIdQueue: null == playerIdQueue
          ? _value._playerIdQueue
          : playerIdQueue // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      this.courtName = 'Pitogo Basketball Court',
      this.ticketPrice = 30,
      final List<KasadoUser> players = const [],
      this.isClosedByAdmin = false,
      this.liveGameStatsId = null,
      final List<KasadoUser>? stageHomeTeamPlayers = const [],
      final List<KasadoUser>? stageAwayTeamPlayers = const [],
      final Map<String, SlotPlayerInfo> slotInfoPerPlayer = const {},
      this.maxPlayerCount = 25,
      this.minPlayerCount = 15,
      final List<String> playerIdQueue = const []})
      : _players = players,
        _stageHomeTeamPlayers = stageHomeTeamPlayers,
        _stageAwayTeamPlayers = stageAwayTeamPlayers,
        _slotInfoPerPlayer = slotInfoPerPlayer,
        _playerIdQueue = playerIdQueue,
        super._();

  factory _$_CourtSlot.fromJson(Map<String, dynamic> json) =>
      _$$_CourtSlotFromJson(json);

  @override
  final String slotId;
  @override
  final String courtId;
  @override
  final TimeRange timeRange;
// TODO: Assert courtName and ticketPrice as required
// (Firestore might have to be edited manually to avoid null errors)
  @override
  @JsonKey()
  final String courtName;
  @override
  @JsonKey()
  final double ticketPrice;
  final List<KasadoUser> _players;
  @override
  @JsonKey()
  List<KasadoUser> get players {
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  @override
  @JsonKey()
  final bool isClosedByAdmin;
  @override
  @JsonKey()
  final String? liveGameStatsId;
  final List<KasadoUser>? _stageHomeTeamPlayers;
  @override
  @JsonKey()
  List<KasadoUser>? get stageHomeTeamPlayers {
    final value = _stageHomeTeamPlayers;
    if (value == null) return null;
    if (_stageHomeTeamPlayers is EqualUnmodifiableListView)
      return _stageHomeTeamPlayers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<KasadoUser>? _stageAwayTeamPlayers;
  @override
  @JsonKey()
  List<KasadoUser>? get stageAwayTeamPlayers {
    final value = _stageAwayTeamPlayers;
    if (value == null) return null;
    if (_stageAwayTeamPlayers is EqualUnmodifiableListView)
      return _stageAwayTeamPlayers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, SlotPlayerInfo> _slotInfoPerPlayer;
  @override
  @JsonKey()
  Map<String, SlotPlayerInfo> get slotInfoPerPlayer {
    if (_slotInfoPerPlayer is EqualUnmodifiableMapView)
      return _slotInfoPerPlayer;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_slotInfoPerPlayer);
  }

  @override
  @JsonKey()
  final int maxPlayerCount;
  @override
  @JsonKey()
  final int minPlayerCount;
  final List<String> _playerIdQueue;
  @override
  @JsonKey()
  List<String> get playerIdQueue {
    if (_playerIdQueue is EqualUnmodifiableListView) return _playerIdQueue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playerIdQueue);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CourtSlot(slotId: $slotId, courtId: $courtId, timeRange: $timeRange, courtName: $courtName, ticketPrice: $ticketPrice, players: $players, isClosedByAdmin: $isClosedByAdmin, liveGameStatsId: $liveGameStatsId, stageHomeTeamPlayers: $stageHomeTeamPlayers, stageAwayTeamPlayers: $stageAwayTeamPlayers, slotInfoPerPlayer: $slotInfoPerPlayer, maxPlayerCount: $maxPlayerCount, minPlayerCount: $minPlayerCount, playerIdQueue: $playerIdQueue)';
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
      ..add(DiagnosticsProperty('ticketPrice', ticketPrice))
      ..add(DiagnosticsProperty('players', players))
      ..add(DiagnosticsProperty('isClosedByAdmin', isClosedByAdmin))
      ..add(DiagnosticsProperty('liveGameStatsId', liveGameStatsId))
      ..add(DiagnosticsProperty('stageHomeTeamPlayers', stageHomeTeamPlayers))
      ..add(DiagnosticsProperty('stageAwayTeamPlayers', stageAwayTeamPlayers))
      ..add(DiagnosticsProperty('slotInfoPerPlayer', slotInfoPerPlayer))
      ..add(DiagnosticsProperty('maxPlayerCount', maxPlayerCount))
      ..add(DiagnosticsProperty('minPlayerCount', minPlayerCount))
      ..add(DiagnosticsProperty('playerIdQueue', playerIdQueue));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CourtSlot &&
            (identical(other.slotId, slotId) || other.slotId == slotId) &&
            (identical(other.courtId, courtId) || other.courtId == courtId) &&
            (identical(other.timeRange, timeRange) ||
                other.timeRange == timeRange) &&
            (identical(other.courtName, courtName) ||
                other.courtName == courtName) &&
            (identical(other.ticketPrice, ticketPrice) ||
                other.ticketPrice == ticketPrice) &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            (identical(other.isClosedByAdmin, isClosedByAdmin) ||
                other.isClosedByAdmin == isClosedByAdmin) &&
            (identical(other.liveGameStatsId, liveGameStatsId) ||
                other.liveGameStatsId == liveGameStatsId) &&
            const DeepCollectionEquality()
                .equals(other._stageHomeTeamPlayers, _stageHomeTeamPlayers) &&
            const DeepCollectionEquality()
                .equals(other._stageAwayTeamPlayers, _stageAwayTeamPlayers) &&
            const DeepCollectionEquality()
                .equals(other._slotInfoPerPlayer, _slotInfoPerPlayer) &&
            (identical(other.maxPlayerCount, maxPlayerCount) ||
                other.maxPlayerCount == maxPlayerCount) &&
            (identical(other.minPlayerCount, minPlayerCount) ||
                other.minPlayerCount == minPlayerCount) &&
            const DeepCollectionEquality()
                .equals(other._playerIdQueue, _playerIdQueue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      slotId,
      courtId,
      timeRange,
      courtName,
      ticketPrice,
      const DeepCollectionEquality().hash(_players),
      isClosedByAdmin,
      liveGameStatsId,
      const DeepCollectionEquality().hash(_stageHomeTeamPlayers),
      const DeepCollectionEquality().hash(_stageAwayTeamPlayers),
      const DeepCollectionEquality().hash(_slotInfoPerPlayer),
      maxPlayerCount,
      minPlayerCount,
      const DeepCollectionEquality().hash(_playerIdQueue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CourtSlotCopyWith<_$_CourtSlot> get copyWith =>
      __$$_CourtSlotCopyWithImpl<_$_CourtSlot>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CourtSlotToJson(
      this,
    );
  }
}

abstract class _CourtSlot extends CourtSlot {
  const factory _CourtSlot(
      {required final String slotId,
      required final String courtId,
      required final TimeRange timeRange,
      final String courtName,
      final double ticketPrice,
      final List<KasadoUser> players,
      final bool isClosedByAdmin,
      final String? liveGameStatsId,
      final List<KasadoUser>? stageHomeTeamPlayers,
      final List<KasadoUser>? stageAwayTeamPlayers,
      final Map<String, SlotPlayerInfo> slotInfoPerPlayer,
      final int maxPlayerCount,
      final int minPlayerCount,
      final List<String> playerIdQueue}) = _$_CourtSlot;
  const _CourtSlot._() : super._();

  factory _CourtSlot.fromJson(Map<String, dynamic> json) =
      _$_CourtSlot.fromJson;

  @override
  String get slotId;
  @override
  String get courtId;
  @override
  TimeRange get timeRange;
  @override // TODO: Assert courtName and ticketPrice as required
// (Firestore might have to be edited manually to avoid null errors)
  String get courtName;
  @override
  double get ticketPrice;
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
  int get maxPlayerCount;
  @override
  int get minPlayerCount;
  @override
  List<String> get playerIdQueue;
  @override
  @JsonKey(ignore: true)
  _$$_CourtSlotCopyWith<_$_CourtSlot> get copyWith =>
      throw _privateConstructorUsedError;
}
