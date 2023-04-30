// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_stat_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameStatEntry _$GameStatEntryFromJson(Map<String, dynamic> json) {
  return _GameStatEntry.fromJson(json);
}

/// @nodoc
mixin _$GameStatEntry {
  KasadoUser get player => throw _privateConstructorUsedError;
  GameStatEntryType get statType => throw _privateConstructorUsedError;
  bool get isHome => throw _privateConstructorUsedError;
  Map<String, dynamic>? get statMeta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameStatEntryCopyWith<GameStatEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStatEntryCopyWith<$Res> {
  factory $GameStatEntryCopyWith(
          GameStatEntry value, $Res Function(GameStatEntry) then) =
      _$GameStatEntryCopyWithImpl<$Res, GameStatEntry>;
  @useResult
  $Res call(
      {KasadoUser player,
      GameStatEntryType statType,
      bool isHome,
      Map<String, dynamic>? statMeta});

  $KasadoUserCopyWith<$Res> get player;
}

/// @nodoc
class _$GameStatEntryCopyWithImpl<$Res, $Val extends GameStatEntry>
    implements $GameStatEntryCopyWith<$Res> {
  _$GameStatEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = null,
    Object? statType = null,
    Object? isHome = null,
    Object? statMeta = freezed,
  }) {
    return _then(_value.copyWith(
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as KasadoUser,
      statType: null == statType
          ? _value.statType
          : statType // ignore: cast_nullable_to_non_nullable
              as GameStatEntryType,
      isHome: null == isHome
          ? _value.isHome
          : isHome // ignore: cast_nullable_to_non_nullable
              as bool,
      statMeta: freezed == statMeta
          ? _value.statMeta
          : statMeta // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $KasadoUserCopyWith<$Res> get player {
    return $KasadoUserCopyWith<$Res>(_value.player, (value) {
      return _then(_value.copyWith(player: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GameStatEntryCopyWith<$Res>
    implements $GameStatEntryCopyWith<$Res> {
  factory _$$_GameStatEntryCopyWith(
          _$_GameStatEntry value, $Res Function(_$_GameStatEntry) then) =
      __$$_GameStatEntryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {KasadoUser player,
      GameStatEntryType statType,
      bool isHome,
      Map<String, dynamic>? statMeta});

  @override
  $KasadoUserCopyWith<$Res> get player;
}

/// @nodoc
class __$$_GameStatEntryCopyWithImpl<$Res>
    extends _$GameStatEntryCopyWithImpl<$Res, _$_GameStatEntry>
    implements _$$_GameStatEntryCopyWith<$Res> {
  __$$_GameStatEntryCopyWithImpl(
      _$_GameStatEntry _value, $Res Function(_$_GameStatEntry) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = null,
    Object? statType = null,
    Object? isHome = null,
    Object? statMeta = freezed,
  }) {
    return _then(_$_GameStatEntry(
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as KasadoUser,
      statType: null == statType
          ? _value.statType
          : statType // ignore: cast_nullable_to_non_nullable
              as GameStatEntryType,
      isHome: null == isHome
          ? _value.isHome
          : isHome // ignore: cast_nullable_to_non_nullable
              as bool,
      statMeta: freezed == statMeta
          ? _value._statMeta
          : statMeta // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GameStatEntry implements _GameStatEntry {
  const _$_GameStatEntry(
      {required this.player,
      required this.statType,
      required this.isHome,
      final Map<String, dynamic>? statMeta})
      : _statMeta = statMeta;

  factory _$_GameStatEntry.fromJson(Map<String, dynamic> json) =>
      _$$_GameStatEntryFromJson(json);

  @override
  final KasadoUser player;
  @override
  final GameStatEntryType statType;
  @override
  final bool isHome;
  final Map<String, dynamic>? _statMeta;
  @override
  Map<String, dynamic>? get statMeta {
    final value = _statMeta;
    if (value == null) return null;
    if (_statMeta is EqualUnmodifiableMapView) return _statMeta;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'GameStatEntry(player: $player, statType: $statType, isHome: $isHome, statMeta: $statMeta)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameStatEntry &&
            (identical(other.player, player) || other.player == player) &&
            (identical(other.statType, statType) ||
                other.statType == statType) &&
            (identical(other.isHome, isHome) || other.isHome == isHome) &&
            const DeepCollectionEquality().equals(other._statMeta, _statMeta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, player, statType, isHome,
      const DeepCollectionEquality().hash(_statMeta));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameStatEntryCopyWith<_$_GameStatEntry> get copyWith =>
      __$$_GameStatEntryCopyWithImpl<_$_GameStatEntry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameStatEntryToJson(
      this,
    );
  }
}

abstract class _GameStatEntry implements GameStatEntry {
  const factory _GameStatEntry(
      {required final KasadoUser player,
      required final GameStatEntryType statType,
      required final bool isHome,
      final Map<String, dynamic>? statMeta}) = _$_GameStatEntry;

  factory _GameStatEntry.fromJson(Map<String, dynamic> json) =
      _$_GameStatEntry.fromJson;

  @override
  KasadoUser get player;
  @override
  GameStatEntryType get statType;
  @override
  bool get isHome;
  @override
  Map<String, dynamic>? get statMeta;
  @override
  @JsonKey(ignore: true)
  _$$_GameStatEntryCopyWith<_$_GameStatEntry> get copyWith =>
      throw _privateConstructorUsedError;
}
