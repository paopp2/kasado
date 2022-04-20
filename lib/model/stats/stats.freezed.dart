// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Stats _$StatsFromJson(Map<String, dynamic> json) {
  return _Stats.fromJson(json);
}

/// @nodoc
class _$StatsTearOff {
  const _$StatsTearOff();

  _Stats call(
      {String? id,
      required KasadoUser player,
      required CourtSlot courtSlot,
      int threePA = 0,
      int threePM = 0,
      int twoPA = 0,
      int twoPM = 0,
      int ftA = 0,
      int ftM = 0,
      int oReb = 0,
      int dReb = 0,
      int ast = 0,
      int stl = 0,
      int blk = 0,
      bool? hasWonGame}) {
    return _Stats(
      id: id,
      player: player,
      courtSlot: courtSlot,
      threePA: threePA,
      threePM: threePM,
      twoPA: twoPA,
      twoPM: twoPM,
      ftA: ftA,
      ftM: ftM,
      oReb: oReb,
      dReb: dReb,
      ast: ast,
      stl: stl,
      blk: blk,
      hasWonGame: hasWonGame,
    );
  }

  Stats fromJson(Map<String, Object?> json) {
    return Stats.fromJson(json);
  }
}

/// @nodoc
const $Stats = _$StatsTearOff();

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
  bool? get hasWonGame => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatsCopyWith<Stats> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsCopyWith<$Res> {
  factory $StatsCopyWith(Stats value, $Res Function(Stats) then) =
      _$StatsCopyWithImpl<$Res>;
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
      bool? hasWonGame});

  $KasadoUserCopyWith<$Res> get player;
  $CourtSlotCopyWith<$Res> get courtSlot;
}

/// @nodoc
class _$StatsCopyWithImpl<$Res> implements $StatsCopyWith<$Res> {
  _$StatsCopyWithImpl(this._value, this._then);

  final Stats _value;
  // ignore: unused_field
  final $Res Function(Stats) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? player = freezed,
    Object? courtSlot = freezed,
    Object? threePA = freezed,
    Object? threePM = freezed,
    Object? twoPA = freezed,
    Object? twoPM = freezed,
    Object? ftA = freezed,
    Object? ftM = freezed,
    Object? oReb = freezed,
    Object? dReb = freezed,
    Object? ast = freezed,
    Object? stl = freezed,
    Object? blk = freezed,
    Object? hasWonGame = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      player: player == freezed
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as KasadoUser,
      courtSlot: courtSlot == freezed
          ? _value.courtSlot
          : courtSlot // ignore: cast_nullable_to_non_nullable
              as CourtSlot,
      threePA: threePA == freezed
          ? _value.threePA
          : threePA // ignore: cast_nullable_to_non_nullable
              as int,
      threePM: threePM == freezed
          ? _value.threePM
          : threePM // ignore: cast_nullable_to_non_nullable
              as int,
      twoPA: twoPA == freezed
          ? _value.twoPA
          : twoPA // ignore: cast_nullable_to_non_nullable
              as int,
      twoPM: twoPM == freezed
          ? _value.twoPM
          : twoPM // ignore: cast_nullable_to_non_nullable
              as int,
      ftA: ftA == freezed
          ? _value.ftA
          : ftA // ignore: cast_nullable_to_non_nullable
              as int,
      ftM: ftM == freezed
          ? _value.ftM
          : ftM // ignore: cast_nullable_to_non_nullable
              as int,
      oReb: oReb == freezed
          ? _value.oReb
          : oReb // ignore: cast_nullable_to_non_nullable
              as int,
      dReb: dReb == freezed
          ? _value.dReb
          : dReb // ignore: cast_nullable_to_non_nullable
              as int,
      ast: ast == freezed
          ? _value.ast
          : ast // ignore: cast_nullable_to_non_nullable
              as int,
      stl: stl == freezed
          ? _value.stl
          : stl // ignore: cast_nullable_to_non_nullable
              as int,
      blk: blk == freezed
          ? _value.blk
          : blk // ignore: cast_nullable_to_non_nullable
              as int,
      hasWonGame: hasWonGame == freezed
          ? _value.hasWonGame
          : hasWonGame // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  $KasadoUserCopyWith<$Res> get player {
    return $KasadoUserCopyWith<$Res>(_value.player, (value) {
      return _then(_value.copyWith(player: value));
    });
  }

  @override
  $CourtSlotCopyWith<$Res> get courtSlot {
    return $CourtSlotCopyWith<$Res>(_value.courtSlot, (value) {
      return _then(_value.copyWith(courtSlot: value));
    });
  }
}

/// @nodoc
abstract class _$StatsCopyWith<$Res> implements $StatsCopyWith<$Res> {
  factory _$StatsCopyWith(_Stats value, $Res Function(_Stats) then) =
      __$StatsCopyWithImpl<$Res>;
  @override
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
      bool? hasWonGame});

  @override
  $KasadoUserCopyWith<$Res> get player;
  @override
  $CourtSlotCopyWith<$Res> get courtSlot;
}

/// @nodoc
class __$StatsCopyWithImpl<$Res> extends _$StatsCopyWithImpl<$Res>
    implements _$StatsCopyWith<$Res> {
  __$StatsCopyWithImpl(_Stats _value, $Res Function(_Stats) _then)
      : super(_value, (v) => _then(v as _Stats));

  @override
  _Stats get _value => super._value as _Stats;

  @override
  $Res call({
    Object? id = freezed,
    Object? player = freezed,
    Object? courtSlot = freezed,
    Object? threePA = freezed,
    Object? threePM = freezed,
    Object? twoPA = freezed,
    Object? twoPM = freezed,
    Object? ftA = freezed,
    Object? ftM = freezed,
    Object? oReb = freezed,
    Object? dReb = freezed,
    Object? ast = freezed,
    Object? stl = freezed,
    Object? blk = freezed,
    Object? hasWonGame = freezed,
  }) {
    return _then(_Stats(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      player: player == freezed
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as KasadoUser,
      courtSlot: courtSlot == freezed
          ? _value.courtSlot
          : courtSlot // ignore: cast_nullable_to_non_nullable
              as CourtSlot,
      threePA: threePA == freezed
          ? _value.threePA
          : threePA // ignore: cast_nullable_to_non_nullable
              as int,
      threePM: threePM == freezed
          ? _value.threePM
          : threePM // ignore: cast_nullable_to_non_nullable
              as int,
      twoPA: twoPA == freezed
          ? _value.twoPA
          : twoPA // ignore: cast_nullable_to_non_nullable
              as int,
      twoPM: twoPM == freezed
          ? _value.twoPM
          : twoPM // ignore: cast_nullable_to_non_nullable
              as int,
      ftA: ftA == freezed
          ? _value.ftA
          : ftA // ignore: cast_nullable_to_non_nullable
              as int,
      ftM: ftM == freezed
          ? _value.ftM
          : ftM // ignore: cast_nullable_to_non_nullable
              as int,
      oReb: oReb == freezed
          ? _value.oReb
          : oReb // ignore: cast_nullable_to_non_nullable
              as int,
      dReb: dReb == freezed
          ? _value.dReb
          : dReb // ignore: cast_nullable_to_non_nullable
              as int,
      ast: ast == freezed
          ? _value.ast
          : ast // ignore: cast_nullable_to_non_nullable
              as int,
      stl: stl == freezed
          ? _value.stl
          : stl // ignore: cast_nullable_to_non_nullable
              as int,
      blk: blk == freezed
          ? _value.blk
          : blk // ignore: cast_nullable_to_non_nullable
              as int,
      hasWonGame: hasWonGame == freezed
          ? _value.hasWonGame
          : hasWonGame // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      this.hasWonGame})
      : super._();

  factory _$_Stats.fromJson(Map<String, dynamic> json) =>
      _$$_StatsFromJson(json);

  @override
  final String? id;
  @override
  final KasadoUser player;
  @override
  final CourtSlot courtSlot;
  @JsonKey()
  @override
  final int threePA;
  @JsonKey()
  @override
  final int threePM;
  @JsonKey()
  @override
  final int twoPA;
  @JsonKey()
  @override
  final int twoPM;
  @JsonKey()
  @override
  final int ftA;
  @JsonKey()
  @override
  final int ftM;
  @JsonKey()
  @override
  final int oReb;
  @JsonKey()
  @override
  final int dReb;
  @JsonKey()
  @override
  final int ast;
  @JsonKey()
  @override
  final int stl;
  @JsonKey()
  @override
  final int blk;
  @override
  final bool? hasWonGame;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Stats(id: $id, player: $player, courtSlot: $courtSlot, threePA: $threePA, threePM: $threePM, twoPA: $twoPA, twoPM: $twoPM, ftA: $ftA, ftM: $ftM, oReb: $oReb, dReb: $dReb, ast: $ast, stl: $stl, blk: $blk, hasWonGame: $hasWonGame)';
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
      ..add(DiagnosticsProperty('hasWonGame', hasWonGame));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Stats &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.player, player) &&
            const DeepCollectionEquality().equals(other.courtSlot, courtSlot) &&
            const DeepCollectionEquality().equals(other.threePA, threePA) &&
            const DeepCollectionEquality().equals(other.threePM, threePM) &&
            const DeepCollectionEquality().equals(other.twoPA, twoPA) &&
            const DeepCollectionEquality().equals(other.twoPM, twoPM) &&
            const DeepCollectionEquality().equals(other.ftA, ftA) &&
            const DeepCollectionEquality().equals(other.ftM, ftM) &&
            const DeepCollectionEquality().equals(other.oReb, oReb) &&
            const DeepCollectionEquality().equals(other.dReb, dReb) &&
            const DeepCollectionEquality().equals(other.ast, ast) &&
            const DeepCollectionEquality().equals(other.stl, stl) &&
            const DeepCollectionEquality().equals(other.blk, blk) &&
            const DeepCollectionEquality()
                .equals(other.hasWonGame, hasWonGame));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(player),
      const DeepCollectionEquality().hash(courtSlot),
      const DeepCollectionEquality().hash(threePA),
      const DeepCollectionEquality().hash(threePM),
      const DeepCollectionEquality().hash(twoPA),
      const DeepCollectionEquality().hash(twoPM),
      const DeepCollectionEquality().hash(ftA),
      const DeepCollectionEquality().hash(ftM),
      const DeepCollectionEquality().hash(oReb),
      const DeepCollectionEquality().hash(dReb),
      const DeepCollectionEquality().hash(ast),
      const DeepCollectionEquality().hash(stl),
      const DeepCollectionEquality().hash(blk),
      const DeepCollectionEquality().hash(hasWonGame));

  @JsonKey(ignore: true)
  @override
  _$StatsCopyWith<_Stats> get copyWith =>
      __$StatsCopyWithImpl<_Stats>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StatsToJson(this);
  }
}

abstract class _Stats extends Stats {
  const factory _Stats(
      {String? id,
      required KasadoUser player,
      required CourtSlot courtSlot,
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
      bool? hasWonGame}) = _$_Stats;
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
  bool? get hasWonGame;
  @override
  @JsonKey(ignore: true)
  _$StatsCopyWith<_Stats> get copyWith => throw _privateConstructorUsedError;
}
