// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stat_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StatInput _$StatInputFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'shotAttempt':
      return ShotAttempt.fromJson(json);
    case 'block':
      return Block.fromJson(json);
    case 'steal':
      return Steal.fromJson(json);
    case 'ftAttempt':
      return FtAttempt.fromJson(json);
    case 'rebound':
      return Rebound.fromJson(json);
    case 'turnover':
      return Turnover.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'StatInput',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
class _$StatInputTearOff {
  const _$StatInputTearOff();

  ShotAttempt shotAttempt(
      {required KasadoUser? player,
      required KasadoUser? playerWhoAssisted,
      required bool isThree,
      required bool wasMade}) {
    return ShotAttempt(
      player: player,
      playerWhoAssisted: playerWhoAssisted,
      isThree: isThree,
      wasMade: wasMade,
    );
  }

  Block block({required KasadoUser? player}) {
    return Block(
      player: player,
    );
  }

  Steal steal({required KasadoUser? player}) {
    return Steal(
      player: player,
    );
  }

  FtAttempt ftAttempt({required KasadoUser? player, required bool wasMade}) {
    return FtAttempt(
      player: player,
      wasMade: wasMade,
    );
  }

  Rebound rebound({required KasadoUser? player, required bool isDefensive}) {
    return Rebound(
      player: player,
      isDefensive: isDefensive,
    );
  }

  Turnover turnover({required KasadoUser? player}) {
    return Turnover(
      player: player,
    );
  }

  StatInput fromJson(Map<String, Object?> json) {
    return StatInput.fromJson(json);
  }
}

/// @nodoc
const $StatInput = _$StatInputTearOff();

/// @nodoc
mixin _$StatInput {
  KasadoUser? get player => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KasadoUser? player, KasadoUser? playerWhoAssisted,
            bool isThree, bool wasMade)
        shotAttempt,
    required TResult Function(KasadoUser? player) block,
    required TResult Function(KasadoUser? player) steal,
    required TResult Function(KasadoUser? player, bool wasMade) ftAttempt,
    required TResult Function(KasadoUser? player, bool isDefensive) rebound,
    required TResult Function(KasadoUser? player) turnover,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(KasadoUser? player, KasadoUser? playerWhoAssisted,
            bool isThree, bool wasMade)?
        shotAttempt,
    TResult Function(KasadoUser? player)? block,
    TResult Function(KasadoUser? player)? steal,
    TResult Function(KasadoUser? player, bool wasMade)? ftAttempt,
    TResult Function(KasadoUser? player, bool isDefensive)? rebound,
    TResult Function(KasadoUser? player)? turnover,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KasadoUser? player, KasadoUser? playerWhoAssisted,
            bool isThree, bool wasMade)?
        shotAttempt,
    TResult Function(KasadoUser? player)? block,
    TResult Function(KasadoUser? player)? steal,
    TResult Function(KasadoUser? player, bool wasMade)? ftAttempt,
    TResult Function(KasadoUser? player, bool isDefensive)? rebound,
    TResult Function(KasadoUser? player)? turnover,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShotAttempt value) shotAttempt,
    required TResult Function(Block value) block,
    required TResult Function(Steal value) steal,
    required TResult Function(FtAttempt value) ftAttempt,
    required TResult Function(Rebound value) rebound,
    required TResult Function(Turnover value) turnover,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ShotAttempt value)? shotAttempt,
    TResult Function(Block value)? block,
    TResult Function(Steal value)? steal,
    TResult Function(FtAttempt value)? ftAttempt,
    TResult Function(Rebound value)? rebound,
    TResult Function(Turnover value)? turnover,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShotAttempt value)? shotAttempt,
    TResult Function(Block value)? block,
    TResult Function(Steal value)? steal,
    TResult Function(FtAttempt value)? ftAttempt,
    TResult Function(Rebound value)? rebound,
    TResult Function(Turnover value)? turnover,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatInputCopyWith<StatInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatInputCopyWith<$Res> {
  factory $StatInputCopyWith(StatInput value, $Res Function(StatInput) then) =
      _$StatInputCopyWithImpl<$Res>;
  $Res call({KasadoUser? player});

  $KasadoUserCopyWith<$Res>? get player;
}

/// @nodoc
class _$StatInputCopyWithImpl<$Res> implements $StatInputCopyWith<$Res> {
  _$StatInputCopyWithImpl(this._value, this._then);

  final StatInput _value;
  // ignore: unused_field
  final $Res Function(StatInput) _then;

  @override
  $Res call({
    Object? player = freezed,
  }) {
    return _then(_value.copyWith(
      player: player == freezed
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as KasadoUser?,
    ));
  }

  @override
  $KasadoUserCopyWith<$Res>? get player {
    if (_value.player == null) {
      return null;
    }

    return $KasadoUserCopyWith<$Res>(_value.player!, (value) {
      return _then(_value.copyWith(player: value));
    });
  }
}

/// @nodoc
abstract class $ShotAttemptCopyWith<$Res> implements $StatInputCopyWith<$Res> {
  factory $ShotAttemptCopyWith(
          ShotAttempt value, $Res Function(ShotAttempt) then) =
      _$ShotAttemptCopyWithImpl<$Res>;
  @override
  $Res call(
      {KasadoUser? player,
      KasadoUser? playerWhoAssisted,
      bool isThree,
      bool wasMade});

  @override
  $KasadoUserCopyWith<$Res>? get player;
  $KasadoUserCopyWith<$Res>? get playerWhoAssisted;
}

/// @nodoc
class _$ShotAttemptCopyWithImpl<$Res> extends _$StatInputCopyWithImpl<$Res>
    implements $ShotAttemptCopyWith<$Res> {
  _$ShotAttemptCopyWithImpl(
      ShotAttempt _value, $Res Function(ShotAttempt) _then)
      : super(_value, (v) => _then(v as ShotAttempt));

  @override
  ShotAttempt get _value => super._value as ShotAttempt;

  @override
  $Res call({
    Object? player = freezed,
    Object? playerWhoAssisted = freezed,
    Object? isThree = freezed,
    Object? wasMade = freezed,
  }) {
    return _then(ShotAttempt(
      player: player == freezed
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as KasadoUser?,
      playerWhoAssisted: playerWhoAssisted == freezed
          ? _value.playerWhoAssisted
          : playerWhoAssisted // ignore: cast_nullable_to_non_nullable
              as KasadoUser?,
      isThree: isThree == freezed
          ? _value.isThree
          : isThree // ignore: cast_nullable_to_non_nullable
              as bool,
      wasMade: wasMade == freezed
          ? _value.wasMade
          : wasMade // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $KasadoUserCopyWith<$Res>? get playerWhoAssisted {
    if (_value.playerWhoAssisted == null) {
      return null;
    }

    return $KasadoUserCopyWith<$Res>(_value.playerWhoAssisted!, (value) {
      return _then(_value.copyWith(playerWhoAssisted: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$ShotAttempt extends ShotAttempt with DiagnosticableTreeMixin {
  const _$ShotAttempt(
      {required this.player,
      required this.playerWhoAssisted,
      required this.isThree,
      required this.wasMade,
      String? $type})
      : $type = $type ?? 'shotAttempt',
        super._();

  factory _$ShotAttempt.fromJson(Map<String, dynamic> json) =>
      _$$ShotAttemptFromJson(json);

  @override
  final KasadoUser? player;
  @override
  final KasadoUser? playerWhoAssisted;
  @override
  final bool isThree;
  @override // isTwo if otherwise
  final bool wasMade;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StatInput.shotAttempt(player: $player, playerWhoAssisted: $playerWhoAssisted, isThree: $isThree, wasMade: $wasMade)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StatInput.shotAttempt'))
      ..add(DiagnosticsProperty('player', player))
      ..add(DiagnosticsProperty('playerWhoAssisted', playerWhoAssisted))
      ..add(DiagnosticsProperty('isThree', isThree))
      ..add(DiagnosticsProperty('wasMade', wasMade));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShotAttempt &&
            const DeepCollectionEquality().equals(other.player, player) &&
            const DeepCollectionEquality()
                .equals(other.playerWhoAssisted, playerWhoAssisted) &&
            const DeepCollectionEquality().equals(other.isThree, isThree) &&
            const DeepCollectionEquality().equals(other.wasMade, wasMade));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(player),
      const DeepCollectionEquality().hash(playerWhoAssisted),
      const DeepCollectionEquality().hash(isThree),
      const DeepCollectionEquality().hash(wasMade));

  @JsonKey(ignore: true)
  @override
  $ShotAttemptCopyWith<ShotAttempt> get copyWith =>
      _$ShotAttemptCopyWithImpl<ShotAttempt>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KasadoUser? player, KasadoUser? playerWhoAssisted,
            bool isThree, bool wasMade)
        shotAttempt,
    required TResult Function(KasadoUser? player) block,
    required TResult Function(KasadoUser? player) steal,
    required TResult Function(KasadoUser? player, bool wasMade) ftAttempt,
    required TResult Function(KasadoUser? player, bool isDefensive) rebound,
    required TResult Function(KasadoUser? player) turnover,
  }) {
    return shotAttempt(player, playerWhoAssisted, isThree, wasMade);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(KasadoUser? player, KasadoUser? playerWhoAssisted,
            bool isThree, bool wasMade)?
        shotAttempt,
    TResult Function(KasadoUser? player)? block,
    TResult Function(KasadoUser? player)? steal,
    TResult Function(KasadoUser? player, bool wasMade)? ftAttempt,
    TResult Function(KasadoUser? player, bool isDefensive)? rebound,
    TResult Function(KasadoUser? player)? turnover,
  }) {
    return shotAttempt?.call(player, playerWhoAssisted, isThree, wasMade);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KasadoUser? player, KasadoUser? playerWhoAssisted,
            bool isThree, bool wasMade)?
        shotAttempt,
    TResult Function(KasadoUser? player)? block,
    TResult Function(KasadoUser? player)? steal,
    TResult Function(KasadoUser? player, bool wasMade)? ftAttempt,
    TResult Function(KasadoUser? player, bool isDefensive)? rebound,
    TResult Function(KasadoUser? player)? turnover,
    required TResult orElse(),
  }) {
    if (shotAttempt != null) {
      return shotAttempt(player, playerWhoAssisted, isThree, wasMade);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShotAttempt value) shotAttempt,
    required TResult Function(Block value) block,
    required TResult Function(Steal value) steal,
    required TResult Function(FtAttempt value) ftAttempt,
    required TResult Function(Rebound value) rebound,
    required TResult Function(Turnover value) turnover,
  }) {
    return shotAttempt(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ShotAttempt value)? shotAttempt,
    TResult Function(Block value)? block,
    TResult Function(Steal value)? steal,
    TResult Function(FtAttempt value)? ftAttempt,
    TResult Function(Rebound value)? rebound,
    TResult Function(Turnover value)? turnover,
  }) {
    return shotAttempt?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShotAttempt value)? shotAttempt,
    TResult Function(Block value)? block,
    TResult Function(Steal value)? steal,
    TResult Function(FtAttempt value)? ftAttempt,
    TResult Function(Rebound value)? rebound,
    TResult Function(Turnover value)? turnover,
    required TResult orElse(),
  }) {
    if (shotAttempt != null) {
      return shotAttempt(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ShotAttemptToJson(this);
  }
}

abstract class ShotAttempt extends StatInput {
  const factory ShotAttempt(
      {required KasadoUser? player,
      required KasadoUser? playerWhoAssisted,
      required bool isThree,
      required bool wasMade}) = _$ShotAttempt;
  const ShotAttempt._() : super._();

  factory ShotAttempt.fromJson(Map<String, dynamic> json) =
      _$ShotAttempt.fromJson;

  @override
  KasadoUser? get player;
  KasadoUser? get playerWhoAssisted;
  bool get isThree; // isTwo if otherwise
  bool get wasMade;
  @override
  @JsonKey(ignore: true)
  $ShotAttemptCopyWith<ShotAttempt> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockCopyWith<$Res> implements $StatInputCopyWith<$Res> {
  factory $BlockCopyWith(Block value, $Res Function(Block) then) =
      _$BlockCopyWithImpl<$Res>;
  @override
  $Res call({KasadoUser? player});

  @override
  $KasadoUserCopyWith<$Res>? get player;
}

/// @nodoc
class _$BlockCopyWithImpl<$Res> extends _$StatInputCopyWithImpl<$Res>
    implements $BlockCopyWith<$Res> {
  _$BlockCopyWithImpl(Block _value, $Res Function(Block) _then)
      : super(_value, (v) => _then(v as Block));

  @override
  Block get _value => super._value as Block;

  @override
  $Res call({
    Object? player = freezed,
  }) {
    return _then(Block(
      player: player == freezed
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as KasadoUser?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Block extends Block with DiagnosticableTreeMixin {
  const _$Block({required this.player, String? $type})
      : $type = $type ?? 'block',
        super._();

  factory _$Block.fromJson(Map<String, dynamic> json) => _$$BlockFromJson(json);

  @override
  final KasadoUser? player;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StatInput.block(player: $player)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StatInput.block'))
      ..add(DiagnosticsProperty('player', player));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Block &&
            const DeepCollectionEquality().equals(other.player, player));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(player));

  @JsonKey(ignore: true)
  @override
  $BlockCopyWith<Block> get copyWith =>
      _$BlockCopyWithImpl<Block>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KasadoUser? player, KasadoUser? playerWhoAssisted,
            bool isThree, bool wasMade)
        shotAttempt,
    required TResult Function(KasadoUser? player) block,
    required TResult Function(KasadoUser? player) steal,
    required TResult Function(KasadoUser? player, bool wasMade) ftAttempt,
    required TResult Function(KasadoUser? player, bool isDefensive) rebound,
    required TResult Function(KasadoUser? player) turnover,
  }) {
    return block(player);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(KasadoUser? player, KasadoUser? playerWhoAssisted,
            bool isThree, bool wasMade)?
        shotAttempt,
    TResult Function(KasadoUser? player)? block,
    TResult Function(KasadoUser? player)? steal,
    TResult Function(KasadoUser? player, bool wasMade)? ftAttempt,
    TResult Function(KasadoUser? player, bool isDefensive)? rebound,
    TResult Function(KasadoUser? player)? turnover,
  }) {
    return block?.call(player);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KasadoUser? player, KasadoUser? playerWhoAssisted,
            bool isThree, bool wasMade)?
        shotAttempt,
    TResult Function(KasadoUser? player)? block,
    TResult Function(KasadoUser? player)? steal,
    TResult Function(KasadoUser? player, bool wasMade)? ftAttempt,
    TResult Function(KasadoUser? player, bool isDefensive)? rebound,
    TResult Function(KasadoUser? player)? turnover,
    required TResult orElse(),
  }) {
    if (block != null) {
      return block(player);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShotAttempt value) shotAttempt,
    required TResult Function(Block value) block,
    required TResult Function(Steal value) steal,
    required TResult Function(FtAttempt value) ftAttempt,
    required TResult Function(Rebound value) rebound,
    required TResult Function(Turnover value) turnover,
  }) {
    return block(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ShotAttempt value)? shotAttempt,
    TResult Function(Block value)? block,
    TResult Function(Steal value)? steal,
    TResult Function(FtAttempt value)? ftAttempt,
    TResult Function(Rebound value)? rebound,
    TResult Function(Turnover value)? turnover,
  }) {
    return block?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShotAttempt value)? shotAttempt,
    TResult Function(Block value)? block,
    TResult Function(Steal value)? steal,
    TResult Function(FtAttempt value)? ftAttempt,
    TResult Function(Rebound value)? rebound,
    TResult Function(Turnover value)? turnover,
    required TResult orElse(),
  }) {
    if (block != null) {
      return block(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$BlockToJson(this);
  }
}

abstract class Block extends StatInput {
  const factory Block({required KasadoUser? player}) = _$Block;
  const Block._() : super._();

  factory Block.fromJson(Map<String, dynamic> json) = _$Block.fromJson;

  @override
  KasadoUser? get player;
  @override
  @JsonKey(ignore: true)
  $BlockCopyWith<Block> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StealCopyWith<$Res> implements $StatInputCopyWith<$Res> {
  factory $StealCopyWith(Steal value, $Res Function(Steal) then) =
      _$StealCopyWithImpl<$Res>;
  @override
  $Res call({KasadoUser? player});

  @override
  $KasadoUserCopyWith<$Res>? get player;
}

/// @nodoc
class _$StealCopyWithImpl<$Res> extends _$StatInputCopyWithImpl<$Res>
    implements $StealCopyWith<$Res> {
  _$StealCopyWithImpl(Steal _value, $Res Function(Steal) _then)
      : super(_value, (v) => _then(v as Steal));

  @override
  Steal get _value => super._value as Steal;

  @override
  $Res call({
    Object? player = freezed,
  }) {
    return _then(Steal(
      player: player == freezed
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as KasadoUser?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Steal extends Steal with DiagnosticableTreeMixin {
  const _$Steal({required this.player, String? $type})
      : $type = $type ?? 'steal',
        super._();

  factory _$Steal.fromJson(Map<String, dynamic> json) => _$$StealFromJson(json);

  @override
  final KasadoUser? player;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StatInput.steal(player: $player)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StatInput.steal'))
      ..add(DiagnosticsProperty('player', player));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Steal &&
            const DeepCollectionEquality().equals(other.player, player));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(player));

  @JsonKey(ignore: true)
  @override
  $StealCopyWith<Steal> get copyWith =>
      _$StealCopyWithImpl<Steal>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KasadoUser? player, KasadoUser? playerWhoAssisted,
            bool isThree, bool wasMade)
        shotAttempt,
    required TResult Function(KasadoUser? player) block,
    required TResult Function(KasadoUser? player) steal,
    required TResult Function(KasadoUser? player, bool wasMade) ftAttempt,
    required TResult Function(KasadoUser? player, bool isDefensive) rebound,
    required TResult Function(KasadoUser? player) turnover,
  }) {
    return steal(player);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(KasadoUser? player, KasadoUser? playerWhoAssisted,
            bool isThree, bool wasMade)?
        shotAttempt,
    TResult Function(KasadoUser? player)? block,
    TResult Function(KasadoUser? player)? steal,
    TResult Function(KasadoUser? player, bool wasMade)? ftAttempt,
    TResult Function(KasadoUser? player, bool isDefensive)? rebound,
    TResult Function(KasadoUser? player)? turnover,
  }) {
    return steal?.call(player);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KasadoUser? player, KasadoUser? playerWhoAssisted,
            bool isThree, bool wasMade)?
        shotAttempt,
    TResult Function(KasadoUser? player)? block,
    TResult Function(KasadoUser? player)? steal,
    TResult Function(KasadoUser? player, bool wasMade)? ftAttempt,
    TResult Function(KasadoUser? player, bool isDefensive)? rebound,
    TResult Function(KasadoUser? player)? turnover,
    required TResult orElse(),
  }) {
    if (steal != null) {
      return steal(player);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShotAttempt value) shotAttempt,
    required TResult Function(Block value) block,
    required TResult Function(Steal value) steal,
    required TResult Function(FtAttempt value) ftAttempt,
    required TResult Function(Rebound value) rebound,
    required TResult Function(Turnover value) turnover,
  }) {
    return steal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ShotAttempt value)? shotAttempt,
    TResult Function(Block value)? block,
    TResult Function(Steal value)? steal,
    TResult Function(FtAttempt value)? ftAttempt,
    TResult Function(Rebound value)? rebound,
    TResult Function(Turnover value)? turnover,
  }) {
    return steal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShotAttempt value)? shotAttempt,
    TResult Function(Block value)? block,
    TResult Function(Steal value)? steal,
    TResult Function(FtAttempt value)? ftAttempt,
    TResult Function(Rebound value)? rebound,
    TResult Function(Turnover value)? turnover,
    required TResult orElse(),
  }) {
    if (steal != null) {
      return steal(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$StealToJson(this);
  }
}

abstract class Steal extends StatInput {
  const factory Steal({required KasadoUser? player}) = _$Steal;
  const Steal._() : super._();

  factory Steal.fromJson(Map<String, dynamic> json) = _$Steal.fromJson;

  @override
  KasadoUser? get player;
  @override
  @JsonKey(ignore: true)
  $StealCopyWith<Steal> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FtAttemptCopyWith<$Res> implements $StatInputCopyWith<$Res> {
  factory $FtAttemptCopyWith(FtAttempt value, $Res Function(FtAttempt) then) =
      _$FtAttemptCopyWithImpl<$Res>;
  @override
  $Res call({KasadoUser? player, bool wasMade});

  @override
  $KasadoUserCopyWith<$Res>? get player;
}

/// @nodoc
class _$FtAttemptCopyWithImpl<$Res> extends _$StatInputCopyWithImpl<$Res>
    implements $FtAttemptCopyWith<$Res> {
  _$FtAttemptCopyWithImpl(FtAttempt _value, $Res Function(FtAttempt) _then)
      : super(_value, (v) => _then(v as FtAttempt));

  @override
  FtAttempt get _value => super._value as FtAttempt;

  @override
  $Res call({
    Object? player = freezed,
    Object? wasMade = freezed,
  }) {
    return _then(FtAttempt(
      player: player == freezed
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as KasadoUser?,
      wasMade: wasMade == freezed
          ? _value.wasMade
          : wasMade // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FtAttempt extends FtAttempt with DiagnosticableTreeMixin {
  const _$FtAttempt(
      {required this.player, required this.wasMade, String? $type})
      : $type = $type ?? 'ftAttempt',
        super._();

  factory _$FtAttempt.fromJson(Map<String, dynamic> json) =>
      _$$FtAttemptFromJson(json);

  @override
  final KasadoUser? player;
  @override
  final bool wasMade;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StatInput.ftAttempt(player: $player, wasMade: $wasMade)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StatInput.ftAttempt'))
      ..add(DiagnosticsProperty('player', player))
      ..add(DiagnosticsProperty('wasMade', wasMade));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FtAttempt &&
            const DeepCollectionEquality().equals(other.player, player) &&
            const DeepCollectionEquality().equals(other.wasMade, wasMade));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(player),
      const DeepCollectionEquality().hash(wasMade));

  @JsonKey(ignore: true)
  @override
  $FtAttemptCopyWith<FtAttempt> get copyWith =>
      _$FtAttemptCopyWithImpl<FtAttempt>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KasadoUser? player, KasadoUser? playerWhoAssisted,
            bool isThree, bool wasMade)
        shotAttempt,
    required TResult Function(KasadoUser? player) block,
    required TResult Function(KasadoUser? player) steal,
    required TResult Function(KasadoUser? player, bool wasMade) ftAttempt,
    required TResult Function(KasadoUser? player, bool isDefensive) rebound,
    required TResult Function(KasadoUser? player) turnover,
  }) {
    return ftAttempt(player, wasMade);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(KasadoUser? player, KasadoUser? playerWhoAssisted,
            bool isThree, bool wasMade)?
        shotAttempt,
    TResult Function(KasadoUser? player)? block,
    TResult Function(KasadoUser? player)? steal,
    TResult Function(KasadoUser? player, bool wasMade)? ftAttempt,
    TResult Function(KasadoUser? player, bool isDefensive)? rebound,
    TResult Function(KasadoUser? player)? turnover,
  }) {
    return ftAttempt?.call(player, wasMade);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KasadoUser? player, KasadoUser? playerWhoAssisted,
            bool isThree, bool wasMade)?
        shotAttempt,
    TResult Function(KasadoUser? player)? block,
    TResult Function(KasadoUser? player)? steal,
    TResult Function(KasadoUser? player, bool wasMade)? ftAttempt,
    TResult Function(KasadoUser? player, bool isDefensive)? rebound,
    TResult Function(KasadoUser? player)? turnover,
    required TResult orElse(),
  }) {
    if (ftAttempt != null) {
      return ftAttempt(player, wasMade);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShotAttempt value) shotAttempt,
    required TResult Function(Block value) block,
    required TResult Function(Steal value) steal,
    required TResult Function(FtAttempt value) ftAttempt,
    required TResult Function(Rebound value) rebound,
    required TResult Function(Turnover value) turnover,
  }) {
    return ftAttempt(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ShotAttempt value)? shotAttempt,
    TResult Function(Block value)? block,
    TResult Function(Steal value)? steal,
    TResult Function(FtAttempt value)? ftAttempt,
    TResult Function(Rebound value)? rebound,
    TResult Function(Turnover value)? turnover,
  }) {
    return ftAttempt?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShotAttempt value)? shotAttempt,
    TResult Function(Block value)? block,
    TResult Function(Steal value)? steal,
    TResult Function(FtAttempt value)? ftAttempt,
    TResult Function(Rebound value)? rebound,
    TResult Function(Turnover value)? turnover,
    required TResult orElse(),
  }) {
    if (ftAttempt != null) {
      return ftAttempt(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FtAttemptToJson(this);
  }
}

abstract class FtAttempt extends StatInput {
  const factory FtAttempt(
      {required KasadoUser? player, required bool wasMade}) = _$FtAttempt;
  const FtAttempt._() : super._();

  factory FtAttempt.fromJson(Map<String, dynamic> json) = _$FtAttempt.fromJson;

  @override
  KasadoUser? get player;
  bool get wasMade;
  @override
  @JsonKey(ignore: true)
  $FtAttemptCopyWith<FtAttempt> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReboundCopyWith<$Res> implements $StatInputCopyWith<$Res> {
  factory $ReboundCopyWith(Rebound value, $Res Function(Rebound) then) =
      _$ReboundCopyWithImpl<$Res>;
  @override
  $Res call({KasadoUser? player, bool isDefensive});

  @override
  $KasadoUserCopyWith<$Res>? get player;
}

/// @nodoc
class _$ReboundCopyWithImpl<$Res> extends _$StatInputCopyWithImpl<$Res>
    implements $ReboundCopyWith<$Res> {
  _$ReboundCopyWithImpl(Rebound _value, $Res Function(Rebound) _then)
      : super(_value, (v) => _then(v as Rebound));

  @override
  Rebound get _value => super._value as Rebound;

  @override
  $Res call({
    Object? player = freezed,
    Object? isDefensive = freezed,
  }) {
    return _then(Rebound(
      player: player == freezed
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as KasadoUser?,
      isDefensive: isDefensive == freezed
          ? _value.isDefensive
          : isDefensive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Rebound extends Rebound with DiagnosticableTreeMixin {
  const _$Rebound(
      {required this.player, required this.isDefensive, String? $type})
      : $type = $type ?? 'rebound',
        super._();

  factory _$Rebound.fromJson(Map<String, dynamic> json) =>
      _$$ReboundFromJson(json);

  @override
  final KasadoUser? player;
  @override
  final bool isDefensive;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StatInput.rebound(player: $player, isDefensive: $isDefensive)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StatInput.rebound'))
      ..add(DiagnosticsProperty('player', player))
      ..add(DiagnosticsProperty('isDefensive', isDefensive));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Rebound &&
            const DeepCollectionEquality().equals(other.player, player) &&
            const DeepCollectionEquality()
                .equals(other.isDefensive, isDefensive));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(player),
      const DeepCollectionEquality().hash(isDefensive));

  @JsonKey(ignore: true)
  @override
  $ReboundCopyWith<Rebound> get copyWith =>
      _$ReboundCopyWithImpl<Rebound>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KasadoUser? player, KasadoUser? playerWhoAssisted,
            bool isThree, bool wasMade)
        shotAttempt,
    required TResult Function(KasadoUser? player) block,
    required TResult Function(KasadoUser? player) steal,
    required TResult Function(KasadoUser? player, bool wasMade) ftAttempt,
    required TResult Function(KasadoUser? player, bool isDefensive) rebound,
    required TResult Function(KasadoUser? player) turnover,
  }) {
    return rebound(player, isDefensive);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(KasadoUser? player, KasadoUser? playerWhoAssisted,
            bool isThree, bool wasMade)?
        shotAttempt,
    TResult Function(KasadoUser? player)? block,
    TResult Function(KasadoUser? player)? steal,
    TResult Function(KasadoUser? player, bool wasMade)? ftAttempt,
    TResult Function(KasadoUser? player, bool isDefensive)? rebound,
    TResult Function(KasadoUser? player)? turnover,
  }) {
    return rebound?.call(player, isDefensive);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KasadoUser? player, KasadoUser? playerWhoAssisted,
            bool isThree, bool wasMade)?
        shotAttempt,
    TResult Function(KasadoUser? player)? block,
    TResult Function(KasadoUser? player)? steal,
    TResult Function(KasadoUser? player, bool wasMade)? ftAttempt,
    TResult Function(KasadoUser? player, bool isDefensive)? rebound,
    TResult Function(KasadoUser? player)? turnover,
    required TResult orElse(),
  }) {
    if (rebound != null) {
      return rebound(player, isDefensive);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShotAttempt value) shotAttempt,
    required TResult Function(Block value) block,
    required TResult Function(Steal value) steal,
    required TResult Function(FtAttempt value) ftAttempt,
    required TResult Function(Rebound value) rebound,
    required TResult Function(Turnover value) turnover,
  }) {
    return rebound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ShotAttempt value)? shotAttempt,
    TResult Function(Block value)? block,
    TResult Function(Steal value)? steal,
    TResult Function(FtAttempt value)? ftAttempt,
    TResult Function(Rebound value)? rebound,
    TResult Function(Turnover value)? turnover,
  }) {
    return rebound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShotAttempt value)? shotAttempt,
    TResult Function(Block value)? block,
    TResult Function(Steal value)? steal,
    TResult Function(FtAttempt value)? ftAttempt,
    TResult Function(Rebound value)? rebound,
    TResult Function(Turnover value)? turnover,
    required TResult orElse(),
  }) {
    if (rebound != null) {
      return rebound(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ReboundToJson(this);
  }
}

abstract class Rebound extends StatInput {
  const factory Rebound(
      {required KasadoUser? player, required bool isDefensive}) = _$Rebound;
  const Rebound._() : super._();

  factory Rebound.fromJson(Map<String, dynamic> json) = _$Rebound.fromJson;

  @override
  KasadoUser? get player;
  bool get isDefensive;
  @override
  @JsonKey(ignore: true)
  $ReboundCopyWith<Rebound> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TurnoverCopyWith<$Res> implements $StatInputCopyWith<$Res> {
  factory $TurnoverCopyWith(Turnover value, $Res Function(Turnover) then) =
      _$TurnoverCopyWithImpl<$Res>;
  @override
  $Res call({KasadoUser? player});

  @override
  $KasadoUserCopyWith<$Res>? get player;
}

/// @nodoc
class _$TurnoverCopyWithImpl<$Res> extends _$StatInputCopyWithImpl<$Res>
    implements $TurnoverCopyWith<$Res> {
  _$TurnoverCopyWithImpl(Turnover _value, $Res Function(Turnover) _then)
      : super(_value, (v) => _then(v as Turnover));

  @override
  Turnover get _value => super._value as Turnover;

  @override
  $Res call({
    Object? player = freezed,
  }) {
    return _then(Turnover(
      player: player == freezed
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as KasadoUser?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Turnover extends Turnover with DiagnosticableTreeMixin {
  const _$Turnover({required this.player, String? $type})
      : $type = $type ?? 'turnover',
        super._();

  factory _$Turnover.fromJson(Map<String, dynamic> json) =>
      _$$TurnoverFromJson(json);

  @override
  final KasadoUser? player;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StatInput.turnover(player: $player)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StatInput.turnover'))
      ..add(DiagnosticsProperty('player', player));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Turnover &&
            const DeepCollectionEquality().equals(other.player, player));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(player));

  @JsonKey(ignore: true)
  @override
  $TurnoverCopyWith<Turnover> get copyWith =>
      _$TurnoverCopyWithImpl<Turnover>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KasadoUser? player, KasadoUser? playerWhoAssisted,
            bool isThree, bool wasMade)
        shotAttempt,
    required TResult Function(KasadoUser? player) block,
    required TResult Function(KasadoUser? player) steal,
    required TResult Function(KasadoUser? player, bool wasMade) ftAttempt,
    required TResult Function(KasadoUser? player, bool isDefensive) rebound,
    required TResult Function(KasadoUser? player) turnover,
  }) {
    return turnover(player);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(KasadoUser? player, KasadoUser? playerWhoAssisted,
            bool isThree, bool wasMade)?
        shotAttempt,
    TResult Function(KasadoUser? player)? block,
    TResult Function(KasadoUser? player)? steal,
    TResult Function(KasadoUser? player, bool wasMade)? ftAttempt,
    TResult Function(KasadoUser? player, bool isDefensive)? rebound,
    TResult Function(KasadoUser? player)? turnover,
  }) {
    return turnover?.call(player);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KasadoUser? player, KasadoUser? playerWhoAssisted,
            bool isThree, bool wasMade)?
        shotAttempt,
    TResult Function(KasadoUser? player)? block,
    TResult Function(KasadoUser? player)? steal,
    TResult Function(KasadoUser? player, bool wasMade)? ftAttempt,
    TResult Function(KasadoUser? player, bool isDefensive)? rebound,
    TResult Function(KasadoUser? player)? turnover,
    required TResult orElse(),
  }) {
    if (turnover != null) {
      return turnover(player);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShotAttempt value) shotAttempt,
    required TResult Function(Block value) block,
    required TResult Function(Steal value) steal,
    required TResult Function(FtAttempt value) ftAttempt,
    required TResult Function(Rebound value) rebound,
    required TResult Function(Turnover value) turnover,
  }) {
    return turnover(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ShotAttempt value)? shotAttempt,
    TResult Function(Block value)? block,
    TResult Function(Steal value)? steal,
    TResult Function(FtAttempt value)? ftAttempt,
    TResult Function(Rebound value)? rebound,
    TResult Function(Turnover value)? turnover,
  }) {
    return turnover?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShotAttempt value)? shotAttempt,
    TResult Function(Block value)? block,
    TResult Function(Steal value)? steal,
    TResult Function(FtAttempt value)? ftAttempt,
    TResult Function(Rebound value)? rebound,
    TResult Function(Turnover value)? turnover,
    required TResult orElse(),
  }) {
    if (turnover != null) {
      return turnover(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TurnoverToJson(this);
  }
}

abstract class Turnover extends StatInput {
  const factory Turnover({required KasadoUser? player}) = _$Turnover;
  const Turnover._() : super._();

  factory Turnover.fromJson(Map<String, dynamic> json) = _$Turnover.fromJson;

  @override
  KasadoUser? get player;
  @override
  @JsonKey(ignore: true)
  $TurnoverCopyWith<Turnover> get copyWith =>
      throw _privateConstructorUsedError;
}
