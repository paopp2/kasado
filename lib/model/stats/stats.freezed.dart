// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Stats _$StatsFromJson(Map<String, dynamic> json) {
  return _Stats.fromJson(json);
}

/// @nodoc
mixin _$Stats {
  String? get id => throw _privateConstructorUsedError;
  KasadoUser get player => throw _privateConstructorUsedError;
  CourtSlot get courtSlot => throw _privateConstructorUsedError;
  int get threePA => throw _privateConstructorUsedError;
  int get threePM => throw _privateConstructorUsedError;
  int get twoPA => throw _privateConstructorUsedError;
  int get twoPM => throw _privateConstructorUsedError;
  int get ftA => throw _privateConstructorUsedError;
  int get ftM => throw _privateConstructorUsedError;
  int get oReb => throw _privateConstructorUsedError;
  int get dReb => throw _privateConstructorUsedError;
  int get ast => throw _privateConstructorUsedError;
  int get stl => throw _privateConstructorUsedError;
  int get blk => throw _privateConstructorUsedError;
  int get turnover => throw _privateConstructorUsedError;
  bool? get hasWonGame => throw _privateConstructorUsedError;
  DateTime? get savedAt => throw _privateConstructorUsedError;
  bool get noStats => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatsCopyWith<Stats> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsCopyWith<$Res> {
  factory $StatsCopyWith(Stats value, $Res Function(Stats) then) =
      _$StatsCopyWithImpl<$Res, Stats>;
  @useResult
  $Res call(
      {String? id,
      KasadoUser player,
      CourtSlot courtSlot,
      int threePA,
      int threePM,
      int twoPA,
      int twoPM,
      int ftA,
      int ftM,
      int oReb,
      int dReb,
      int ast,
      int stl,
      int blk,
      int turnover,
      bool? hasWonGame,
      DateTime? savedAt,
      bool noStats});

  $KasadoUserCopyWith<$Res> get player;
  $CourtSlotCopyWith<$Res> get courtSlot;
}

/// @nodoc
class _$StatsCopyWithImpl<$Res, $Val extends Stats>
    implements $StatsCopyWith<$Res> {
  _$StatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? player = null,
    Object? courtSlot = null,
    Object? threePA = null,
    Object? threePM = null,
    Object? twoPA = null,
    Object? twoPM = null,
    Object? ftA = null,
    Object? ftM = null,
    Object? oReb = null,
    Object? dReb = null,
    Object? ast = null,
    Object? stl = null,
    Object? blk = null,
    Object? turnover = null,
    Object? hasWonGame = freezed,
    Object? savedAt = freezed,
    Object? noStats = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as KasadoUser,
      courtSlot: null == courtSlot
          ? _value.courtSlot
          : courtSlot // ignore: cast_nullable_to_non_nullable
              as CourtSlot,
      threePA: null == threePA
          ? _value.threePA
          : threePA // ignore: cast_nullable_to_non_nullable
              as int,
      threePM: null == threePM
          ? _value.threePM
          : threePM // ignore: cast_nullable_to_non_nullable
              as int,
      twoPA: null == twoPA
          ? _value.twoPA
          : twoPA // ignore: cast_nullable_to_non_nullable
              as int,
      twoPM: null == twoPM
          ? _value.twoPM
          : twoPM // ignore: cast_nullable_to_non_nullable
              as int,
      ftA: null == ftA
          ? _value.ftA
          : ftA // ignore: cast_nullable_to_non_nullable
              as int,
      ftM: null == ftM
          ? _value.ftM
          : ftM // ignore: cast_nullable_to_non_nullable
              as int,
      oReb: null == oReb
          ? _value.oReb
          : oReb // ignore: cast_nullable_to_non_nullable
              as int,
      dReb: null == dReb
          ? _value.dReb
          : dReb // ignore: cast_nullable_to_non_nullable
              as int,
      ast: null == ast
          ? _value.ast
          : ast // ignore: cast_nullable_to_non_nullable
              as int,
      stl: null == stl
          ? _value.stl
          : stl // ignore: cast_nullable_to_non_nullable
              as int,
      blk: null == blk
          ? _value.blk
          : blk // ignore: cast_nullable_to_non_nullable
              as int,
      turnover: null == turnover
          ? _value.turnover
          : turnover // ignore: cast_nullable_to_non_nullable
              as int,
      hasWonGame: freezed == hasWonGame
          ? _value.hasWonGame
          : hasWonGame // ignore: cast_nullable_to_non_nullable
              as bool?,
      savedAt: freezed == savedAt
          ? _value.savedAt
          : savedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      noStats: null == noStats
          ? _value.noStats
          : noStats // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $KasadoUserCopyWith<$Res> get player {
    return $KasadoUserCopyWith<$Res>(_value.player, (value) {
      return _then(_value.copyWith(player: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CourtSlotCopyWith<$Res> get courtSlot {
    return $CourtSlotCopyWith<$Res>(_value.courtSlot, (value) {
      return _then(_value.copyWith(courtSlot: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_StatsCopyWith<$Res> implements $StatsCopyWith<$Res> {
  factory _$$_StatsCopyWith(_$_Stats value, $Res Function(_$_Stats) then) =
      __$$_StatsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      KasadoUser player,
      CourtSlot courtSlot,
      int threePA,
      int threePM,
      int twoPA,
      int twoPM,
      int ftA,
      int ftM,
      int oReb,
      int dReb,
      int ast,
      int stl,
      int blk,
      int turnover,
      bool? hasWonGame,
      DateTime? savedAt,
      bool noStats});

  @override
  $KasadoUserCopyWith<$Res> get player;
  @override
  $CourtSlotCopyWith<$Res> get courtSlot;
}

/// @nodoc
class __$$_StatsCopyWithImpl<$Res> extends _$StatsCopyWithImpl<$Res, _$_Stats>
    implements _$$_StatsCopyWith<$Res> {
  __$$_StatsCopyWithImpl(_$_Stats _value, $Res Function(_$_Stats) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? player = null,
    Object? courtSlot = null,
    Object? threePA = null,
    Object? threePM = null,
    Object? twoPA = null,
    Object? twoPM = null,
    Object? ftA = null,
    Object? ftM = null,
    Object? oReb = null,
    Object? dReb = null,
    Object? ast = null,
    Object? stl = null,
    Object? blk = null,
    Object? turnover = null,
    Object? hasWonGame = freezed,
    Object? savedAt = freezed,
    Object? noStats = null,
  }) {
    return _then(_$_Stats(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as KasadoUser,
      courtSlot: null == courtSlot
          ? _value.courtSlot
          : courtSlot // ignore: cast_nullable_to_non_nullable
              as CourtSlot,
      threePA: null == threePA
          ? _value.threePA
          : threePA // ignore: cast_nullable_to_non_nullable
              as int,
      threePM: null == threePM
          ? _value.threePM
          : threePM // ignore: cast_nullable_to_non_nullable
              as int,
      twoPA: null == twoPA
          ? _value.twoPA
          : twoPA // ignore: cast_nullable_to_non_nullable
              as int,
      twoPM: null == twoPM
          ? _value.twoPM
          : twoPM // ignore: cast_nullable_to_non_nullable
              as int,
      ftA: null == ftA
          ? _value.ftA
          : ftA // ignore: cast_nullable_to_non_nullable
              as int,
      ftM: null == ftM
          ? _value.ftM
          : ftM // ignore: cast_nullable_to_non_nullable
              as int,
      oReb: null == oReb
          ? _value.oReb
          : oReb // ignore: cast_nullable_to_non_nullable
              as int,
      dReb: null == dReb
          ? _value.dReb
          : dReb // ignore: cast_nullable_to_non_nullable
              as int,
      ast: null == ast
          ? _value.ast
          : ast // ignore: cast_nullable_to_non_nullable
              as int,
      stl: null == stl
          ? _value.stl
          : stl // ignore: cast_nullable_to_non_nullable
              as int,
      blk: null == blk
          ? _value.blk
          : blk // ignore: cast_nullable_to_non_nullable
              as int,
      turnover: null == turnover
          ? _value.turnover
          : turnover // ignore: cast_nullable_to_non_nullable
              as int,
      hasWonGame: freezed == hasWonGame
          ? _value.hasWonGame
          : hasWonGame // ignore: cast_nullable_to_non_nullable
              as bool?,
      savedAt: freezed == savedAt
          ? _value.savedAt
          : savedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      noStats: null == noStats
          ? _value.noStats
          : noStats // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Stats extends _Stats with DiagnosticableTreeMixin {
  const _$_Stats(
      {this.id,
      required this.player,
      required this.courtSlot,
      this.threePA = 0,
      this.threePM = 0,
      this.twoPA = 0,
      this.twoPM = 0,
      this.ftA = 0,
      this.ftM = 0,
      this.oReb = 0,
      this.dReb = 0,
      this.ast = 0,
      this.stl = 0,
      this.blk = 0,
      this.turnover = 0,
      this.hasWonGame,
      this.savedAt,
      this.noStats = false})
      : super._();

  factory _$_Stats.fromJson(Map<String, dynamic> json) =>
      _$$_StatsFromJson(json);

  @override
  final String? id;
  @override
  final KasadoUser player;
  @override
  final CourtSlot courtSlot;
  @override
  @JsonKey()
  final int threePA;
  @override
  @JsonKey()
  final int threePM;
  @override
  @JsonKey()
  final int twoPA;
  @override
  @JsonKey()
  final int twoPM;
  @override
  @JsonKey()
  final int ftA;
  @override
  @JsonKey()
  final int ftM;
  @override
  @JsonKey()
  final int oReb;
  @override
  @JsonKey()
  final int dReb;
  @override
  @JsonKey()
  final int ast;
  @override
  @JsonKey()
  final int stl;
  @override
  @JsonKey()
  final int blk;
  @override
  @JsonKey()
  final int turnover;
  @override
  final bool? hasWonGame;
  @override
  final DateTime? savedAt;
  @override
  @JsonKey()
  final bool noStats;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Stats(id: $id, player: $player, courtSlot: $courtSlot, threePA: $threePA, threePM: $threePM, twoPA: $twoPA, twoPM: $twoPM, ftA: $ftA, ftM: $ftM, oReb: $oReb, dReb: $dReb, ast: $ast, stl: $stl, blk: $blk, turnover: $turnover, hasWonGame: $hasWonGame, savedAt: $savedAt, noStats: $noStats)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Stats'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('player', player))
      ..add(DiagnosticsProperty('courtSlot', courtSlot))
      ..add(DiagnosticsProperty('threePA', threePA))
      ..add(DiagnosticsProperty('threePM', threePM))
      ..add(DiagnosticsProperty('twoPA', twoPA))
      ..add(DiagnosticsProperty('twoPM', twoPM))
      ..add(DiagnosticsProperty('ftA', ftA))
      ..add(DiagnosticsProperty('ftM', ftM))
      ..add(DiagnosticsProperty('oReb', oReb))
      ..add(DiagnosticsProperty('dReb', dReb))
      ..add(DiagnosticsProperty('ast', ast))
      ..add(DiagnosticsProperty('stl', stl))
      ..add(DiagnosticsProperty('blk', blk))
      ..add(DiagnosticsProperty('turnover', turnover))
      ..add(DiagnosticsProperty('hasWonGame', hasWonGame))
      ..add(DiagnosticsProperty('savedAt', savedAt))
      ..add(DiagnosticsProperty('noStats', noStats));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Stats &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.player, player) || other.player == player) &&
            (identical(other.courtSlot, courtSlot) ||
                other.courtSlot == courtSlot) &&
            (identical(other.threePA, threePA) || other.threePA == threePA) &&
            (identical(other.threePM, threePM) || other.threePM == threePM) &&
            (identical(other.twoPA, twoPA) || other.twoPA == twoPA) &&
            (identical(other.twoPM, twoPM) || other.twoPM == twoPM) &&
            (identical(other.ftA, ftA) || other.ftA == ftA) &&
            (identical(other.ftM, ftM) || other.ftM == ftM) &&
            (identical(other.oReb, oReb) || other.oReb == oReb) &&
            (identical(other.dReb, dReb) || other.dReb == dReb) &&
            (identical(other.ast, ast) || other.ast == ast) &&
            (identical(other.stl, stl) || other.stl == stl) &&
            (identical(other.blk, blk) || other.blk == blk) &&
            (identical(other.turnover, turnover) ||
                other.turnover == turnover) &&
            (identical(other.hasWonGame, hasWonGame) ||
                other.hasWonGame == hasWonGame) &&
            (identical(other.savedAt, savedAt) || other.savedAt == savedAt) &&
            (identical(other.noStats, noStats) || other.noStats == noStats));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      player,
      courtSlot,
      threePA,
      threePM,
      twoPA,
      twoPM,
      ftA,
      ftM,
      oReb,
      dReb,
      ast,
      stl,
      blk,
      turnover,
      hasWonGame,
      savedAt,
      noStats);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StatsCopyWith<_$_Stats> get copyWith =>
      __$$_StatsCopyWithImpl<_$_Stats>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StatsToJson(
      this,
    );
  }
}

abstract class _Stats extends Stats {
  const factory _Stats(
      {final String? id,
      required final KasadoUser player,
      required final CourtSlot courtSlot,
      final int threePA,
      final int threePM,
      final int twoPA,
      final int twoPM,
      final int ftA,
      final int ftM,
      final int oReb,
      final int dReb,
      final int ast,
      final int stl,
      final int blk,
      final int turnover,
      final bool? hasWonGame,
      final DateTime? savedAt,
      final bool noStats}) = _$_Stats;
  const _Stats._() : super._();

  factory _Stats.fromJson(Map<String, dynamic> json) = _$_Stats.fromJson;

  @override
  String? get id;
  @override
  KasadoUser get player;
  @override
  CourtSlot get courtSlot;
  @override
  int get threePA;
  @override
  int get threePM;
  @override
  int get twoPA;
  @override
  int get twoPM;
  @override
  int get ftA;
  @override
  int get ftM;
  @override
  int get oReb;
  @override
  int get dReb;
  @override
  int get ast;
  @override
  int get stl;
  @override
  int get blk;
  @override
  int get turnover;
  @override
  bool? get hasWonGame;
  @override
  DateTime? get savedAt;
  @override
  bool get noStats;
  @override
  @JsonKey(ignore: true)
  _$$_StatsCopyWith<_$_Stats> get copyWith =>
      throw _privateConstructorUsedError;
}
