// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stat_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
    TResult? Function(KasadoUser? player, KasadoUser? playerWhoAssisted,
            bool isThree, bool wasMade)?
        shotAttempt,
    TResult? Function(KasadoUser? player)? block,
    TResult? Function(KasadoUser? player)? steal,
    TResult? Function(KasadoUser? player, bool wasMade)? ftAttempt,
    TResult? Function(KasadoUser? player, bool isDefensive)? rebound,
    TResult? Function(KasadoUser? player)? turnover,
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
    TResult? Function(ShotAttempt value)? shotAttempt,
    TResult? Function(Block value)? block,
    TResult? Function(Steal value)? steal,
    TResult? Function(FtAttempt value)? ftAttempt,
    TResult? Function(Rebound value)? rebound,
    TResult? Function(Turnover value)? turnover,
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
      _$StatInputCopyWithImpl<$Res, StatInput>;
  @useResult
  $Res call({KasadoUser? player});

  $KasadoUserCopyWith<$Res>? get player;
}

/// @nodoc
class _$StatInputCopyWithImpl<$Res, $Val extends StatInput>
    implements $StatInputCopyWith<$Res> {
  _$StatInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = freezed,
  }) {
    return _then(_value.copyWith(
      player: freezed == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as KasadoUser?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $KasadoUserCopyWith<$Res>? get player {
    if (_value.player == null) {
      return null;
    }

    return $KasadoUserCopyWith<$Res>(_value.player!, (value) {
      return _then(_value.copyWith(player: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ShotAttemptCopyWith<$Res>
    implements $StatInputCopyWith<$Res> {
  factory _$$ShotAttemptCopyWith(
          _$ShotAttempt value, $Res Function(_$ShotAttempt) then) =
      __$$ShotAttemptCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$ShotAttemptCopyWithImpl<$Res>
    extends _$StatInputCopyWithImpl<$Res, _$ShotAttempt>
    implements _$$ShotAttemptCopyWith<$Res> {
  __$$ShotAttemptCopyWithImpl(
      _$ShotAttempt _value, $Res Function(_$ShotAttempt) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = freezed,
    Object? playerWhoAssisted = freezed,
    Object? isThree = null,
    Object? wasMade = null,
  }) {
    return _then(_$ShotAttempt(
      player: freezed == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as KasadoUser?,
      playerWhoAssisted: freezed == playerWhoAssisted
          ? _value.playerWhoAssisted
          : playerWhoAssisted // ignore: cast_nullable_to_non_nullable
              as KasadoUser?,
      isThree: null == isThree
          ? _value.isThree
          : isThree // ignore: cast_nullable_to_non_nullable
              as bool,
      wasMade: null == wasMade
          ? _value.wasMade
          : wasMade // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
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
      final String? $type})
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
// isTwo if otherwise
  @override
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
            other is _$ShotAttempt &&
            (identical(other.player, player) || other.player == player) &&
            (identical(other.playerWhoAssisted, playerWhoAssisted) ||
                other.playerWhoAssisted == playerWhoAssisted) &&
            (identical(other.isThree, isThree) || other.isThree == isThree) &&
            (identical(other.wasMade, wasMade) || other.wasMade == wasMade));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, player, playerWhoAssisted, isThree, wasMade);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShotAttemptCopyWith<_$ShotAttempt> get copyWith =>
      __$$ShotAttemptCopyWithImpl<_$ShotAttempt>(this, _$identity);

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
    TResult? Function(KasadoUser? player, KasadoUser? playerWhoAssisted,
            bool isThree, bool wasMade)?
        shotAttempt,
    TResult? Function(KasadoUser? player)? block,
    TResult? Function(KasadoUser? player)? steal,
    TResult? Function(KasadoUser? player, bool wasMade)? ftAttempt,
    TResult? Function(KasadoUser? player, bool isDefensive)? rebound,
    TResult? Function(KasadoUser? player)? turnover,
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
    TResult? Function(ShotAttempt value)? shotAttempt,
    TResult? Function(Block value)? block,
    TResult? Function(Steal value)? steal,
    TResult? Function(FtAttempt value)? ftAttempt,
    TResult? Function(Rebound value)? rebound,
    TResult? Function(Turnover value)? turnover,
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
    return _$$ShotAttemptToJson(
      this,
    );
  }
}

abstract class ShotAttempt extends StatInput {
  const factory ShotAttempt(
      {required final KasadoUser? player,
      required final KasadoUser? playerWhoAssisted,
      required final bool isThree,
      required final bool wasMade}) = _$ShotAttempt;
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
  _$$ShotAttemptCopyWith<_$ShotAttempt> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BlockCopyWith<$Res> implements $StatInputCopyWith<$Res> {
  factory _$$BlockCopyWith(_$Block value, $Res Function(_$Block) then) =
      __$$BlockCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({KasadoUser? player});

  @override
  $KasadoUserCopyWith<$Res>? get player;
}

/// @nodoc
class __$$BlockCopyWithImpl<$Res> extends _$StatInputCopyWithImpl<$Res, _$Block>
    implements _$$BlockCopyWith<$Res> {
  __$$BlockCopyWithImpl(_$Block _value, $Res Function(_$Block) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = freezed,
  }) {
    return _then(_$Block(
      player: freezed == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as KasadoUser?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Block extends Block with DiagnosticableTreeMixin {
  const _$Block({required this.player, final String? $type})
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
            other is _$Block &&
            (identical(other.player, player) || other.player == player));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, player);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlockCopyWith<_$Block> get copyWith =>
      __$$BlockCopyWithImpl<_$Block>(this, _$identity);

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
    TResult? Function(KasadoUser? player, KasadoUser? playerWhoAssisted,
            bool isThree, bool wasMade)?
        shotAttempt,
    TResult? Function(KasadoUser? player)? block,
    TResult? Function(KasadoUser? player)? steal,
    TResult? Function(KasadoUser? player, bool wasMade)? ftAttempt,
    TResult? Function(KasadoUser? player, bool isDefensive)? rebound,
    TResult? Function(KasadoUser? player)? turnover,
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
    TResult? Function(ShotAttempt value)? shotAttempt,
    TResult? Function(Block value)? block,
    TResult? Function(Steal value)? steal,
    TResult? Function(FtAttempt value)? ftAttempt,
    TResult? Function(Rebound value)? rebound,
    TResult? Function(Turnover value)? turnover,
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
    return _$$BlockToJson(
      this,
    );
  }
}

abstract class Block extends StatInput {
  const factory Block({required final KasadoUser? player}) = _$Block;
  const Block._() : super._();

  factory Block.fromJson(Map<String, dynamic> json) = _$Block.fromJson;

  @override
  KasadoUser? get player;
  @override
  @JsonKey(ignore: true)
  _$$BlockCopyWith<_$Block> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StealCopyWith<$Res> implements $StatInputCopyWith<$Res> {
  factory _$$StealCopyWith(_$Steal value, $Res Function(_$Steal) then) =
      __$$StealCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({KasadoUser? player});

  @override
  $KasadoUserCopyWith<$Res>? get player;
}

/// @nodoc
class __$$StealCopyWithImpl<$Res> extends _$StatInputCopyWithImpl<$Res, _$Steal>
    implements _$$StealCopyWith<$Res> {
  __$$StealCopyWithImpl(_$Steal _value, $Res Function(_$Steal) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = freezed,
  }) {
    return _then(_$Steal(
      player: freezed == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as KasadoUser?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Steal extends Steal with DiagnosticableTreeMixin {
  const _$Steal({required this.player, final String? $type})
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
            other is _$Steal &&
            (identical(other.player, player) || other.player == player));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, player);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StealCopyWith<_$Steal> get copyWith =>
      __$$StealCopyWithImpl<_$Steal>(this, _$identity);

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
    TResult? Function(KasadoUser? player, KasadoUser? playerWhoAssisted,
            bool isThree, bool wasMade)?
        shotAttempt,
    TResult? Function(KasadoUser? player)? block,
    TResult? Function(KasadoUser? player)? steal,
    TResult? Function(KasadoUser? player, bool wasMade)? ftAttempt,
    TResult? Function(KasadoUser? player, bool isDefensive)? rebound,
    TResult? Function(KasadoUser? player)? turnover,
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
    TResult? Function(ShotAttempt value)? shotAttempt,
    TResult? Function(Block value)? block,
    TResult? Function(Steal value)? steal,
    TResult? Function(FtAttempt value)? ftAttempt,
    TResult? Function(Rebound value)? rebound,
    TResult? Function(Turnover value)? turnover,
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
    return _$$StealToJson(
      this,
    );
  }
}

abstract class Steal extends StatInput {
  const factory Steal({required final KasadoUser? player}) = _$Steal;
  const Steal._() : super._();

  factory Steal.fromJson(Map<String, dynamic> json) = _$Steal.fromJson;

  @override
  KasadoUser? get player;
  @override
  @JsonKey(ignore: true)
  _$$StealCopyWith<_$Steal> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FtAttemptCopyWith<$Res> implements $StatInputCopyWith<$Res> {
  factory _$$FtAttemptCopyWith(
          _$FtAttempt value, $Res Function(_$FtAttempt) then) =
      __$$FtAttemptCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({KasadoUser? player, bool wasMade});

  @override
  $KasadoUserCopyWith<$Res>? get player;
}

/// @nodoc
class __$$FtAttemptCopyWithImpl<$Res>
    extends _$StatInputCopyWithImpl<$Res, _$FtAttempt>
    implements _$$FtAttemptCopyWith<$Res> {
  __$$FtAttemptCopyWithImpl(
      _$FtAttempt _value, $Res Function(_$FtAttempt) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = freezed,
    Object? wasMade = null,
  }) {
    return _then(_$FtAttempt(
      player: freezed == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as KasadoUser?,
      wasMade: null == wasMade
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
      {required this.player, required this.wasMade, final String? $type})
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
            other is _$FtAttempt &&
            (identical(other.player, player) || other.player == player) &&
            (identical(other.wasMade, wasMade) || other.wasMade == wasMade));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, player, wasMade);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FtAttemptCopyWith<_$FtAttempt> get copyWith =>
      __$$FtAttemptCopyWithImpl<_$FtAttempt>(this, _$identity);

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
    TResult? Function(KasadoUser? player, KasadoUser? playerWhoAssisted,
            bool isThree, bool wasMade)?
        shotAttempt,
    TResult? Function(KasadoUser? player)? block,
    TResult? Function(KasadoUser? player)? steal,
    TResult? Function(KasadoUser? player, bool wasMade)? ftAttempt,
    TResult? Function(KasadoUser? player, bool isDefensive)? rebound,
    TResult? Function(KasadoUser? player)? turnover,
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
    TResult? Function(ShotAttempt value)? shotAttempt,
    TResult? Function(Block value)? block,
    TResult? Function(Steal value)? steal,
    TResult? Function(FtAttempt value)? ftAttempt,
    TResult? Function(Rebound value)? rebound,
    TResult? Function(Turnover value)? turnover,
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
    return _$$FtAttemptToJson(
      this,
    );
  }
}

abstract class FtAttempt extends StatInput {
  const factory FtAttempt(
      {required final KasadoUser? player,
      required final bool wasMade}) = _$FtAttempt;
  const FtAttempt._() : super._();

  factory FtAttempt.fromJson(Map<String, dynamic> json) = _$FtAttempt.fromJson;

  @override
  KasadoUser? get player;
  bool get wasMade;
  @override
  @JsonKey(ignore: true)
  _$$FtAttemptCopyWith<_$FtAttempt> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReboundCopyWith<$Res> implements $StatInputCopyWith<$Res> {
  factory _$$ReboundCopyWith(_$Rebound value, $Res Function(_$Rebound) then) =
      __$$ReboundCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({KasadoUser? player, bool isDefensive});

  @override
  $KasadoUserCopyWith<$Res>? get player;
}

/// @nodoc
class __$$ReboundCopyWithImpl<$Res>
    extends _$StatInputCopyWithImpl<$Res, _$Rebound>
    implements _$$ReboundCopyWith<$Res> {
  __$$ReboundCopyWithImpl(_$Rebound _value, $Res Function(_$Rebound) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = freezed,
    Object? isDefensive = null,
  }) {
    return _then(_$Rebound(
      player: freezed == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as KasadoUser?,
      isDefensive: null == isDefensive
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
      {required this.player, required this.isDefensive, final String? $type})
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
            other is _$Rebound &&
            (identical(other.player, player) || other.player == player) &&
            (identical(other.isDefensive, isDefensive) ||
                other.isDefensive == isDefensive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, player, isDefensive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReboundCopyWith<_$Rebound> get copyWith =>
      __$$ReboundCopyWithImpl<_$Rebound>(this, _$identity);

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
    TResult? Function(KasadoUser? player, KasadoUser? playerWhoAssisted,
            bool isThree, bool wasMade)?
        shotAttempt,
    TResult? Function(KasadoUser? player)? block,
    TResult? Function(KasadoUser? player)? steal,
    TResult? Function(KasadoUser? player, bool wasMade)? ftAttempt,
    TResult? Function(KasadoUser? player, bool isDefensive)? rebound,
    TResult? Function(KasadoUser? player)? turnover,
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
    TResult? Function(ShotAttempt value)? shotAttempt,
    TResult? Function(Block value)? block,
    TResult? Function(Steal value)? steal,
    TResult? Function(FtAttempt value)? ftAttempt,
    TResult? Function(Rebound value)? rebound,
    TResult? Function(Turnover value)? turnover,
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
    return _$$ReboundToJson(
      this,
    );
  }
}

abstract class Rebound extends StatInput {
  const factory Rebound(
      {required final KasadoUser? player,
      required final bool isDefensive}) = _$Rebound;
  const Rebound._() : super._();

  factory Rebound.fromJson(Map<String, dynamic> json) = _$Rebound.fromJson;

  @override
  KasadoUser? get player;
  bool get isDefensive;
  @override
  @JsonKey(ignore: true)
  _$$ReboundCopyWith<_$Rebound> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TurnoverCopyWith<$Res> implements $StatInputCopyWith<$Res> {
  factory _$$TurnoverCopyWith(
          _$Turnover value, $Res Function(_$Turnover) then) =
      __$$TurnoverCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({KasadoUser? player});

  @override
  $KasadoUserCopyWith<$Res>? get player;
}

/// @nodoc
class __$$TurnoverCopyWithImpl<$Res>
    extends _$StatInputCopyWithImpl<$Res, _$Turnover>
    implements _$$TurnoverCopyWith<$Res> {
  __$$TurnoverCopyWithImpl(_$Turnover _value, $Res Function(_$Turnover) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = freezed,
  }) {
    return _then(_$Turnover(
      player: freezed == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as KasadoUser?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Turnover extends Turnover with DiagnosticableTreeMixin {
  const _$Turnover({required this.player, final String? $type})
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
            other is _$Turnover &&
            (identical(other.player, player) || other.player == player));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, player);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TurnoverCopyWith<_$Turnover> get copyWith =>
      __$$TurnoverCopyWithImpl<_$Turnover>(this, _$identity);

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
    TResult? Function(KasadoUser? player, KasadoUser? playerWhoAssisted,
            bool isThree, bool wasMade)?
        shotAttempt,
    TResult? Function(KasadoUser? player)? block,
    TResult? Function(KasadoUser? player)? steal,
    TResult? Function(KasadoUser? player, bool wasMade)? ftAttempt,
    TResult? Function(KasadoUser? player, bool isDefensive)? rebound,
    TResult? Function(KasadoUser? player)? turnover,
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
    TResult? Function(ShotAttempt value)? shotAttempt,
    TResult? Function(Block value)? block,
    TResult? Function(Steal value)? steal,
    TResult? Function(FtAttempt value)? ftAttempt,
    TResult? Function(Rebound value)? rebound,
    TResult? Function(Turnover value)? turnover,
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
    return _$$TurnoverToJson(
      this,
    );
  }
}

abstract class Turnover extends StatInput {
  const factory Turnover({required final KasadoUser? player}) = _$Turnover;
  const Turnover._() : super._();

  factory Turnover.fromJson(Map<String, dynamic> json) = _$Turnover.fromJson;

  @override
  KasadoUser? get player;
  @override
  @JsonKey(ignore: true)
  _$$TurnoverCopyWith<_$Turnover> get copyWith =>
      throw _privateConstructorUsedError;
}
