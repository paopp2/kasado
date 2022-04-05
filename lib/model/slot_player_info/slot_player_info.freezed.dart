// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'slot_player_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SlotPlayerInfo _$SlotPlayerInfoFromJson(Map<String, dynamic> json) {
  return _SlotPlayerInfo.fromJson(json);
}

/// @nodoc
class _$SlotPlayerInfoTearOff {
  const _$SlotPlayerInfoTearOff();

  _SlotPlayerInfo call({int timesPlayed = 0}) {
    return _SlotPlayerInfo(
      timesPlayed: timesPlayed,
    );
  }

  SlotPlayerInfo fromJson(Map<String, Object?> json) {
    return SlotPlayerInfo.fromJson(json);
  }
}

/// @nodoc
const $SlotPlayerInfo = _$SlotPlayerInfoTearOff();

/// @nodoc
mixin _$SlotPlayerInfo {
  int get timesPlayed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SlotPlayerInfoCopyWith<SlotPlayerInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlotPlayerInfoCopyWith<$Res> {
  factory $SlotPlayerInfoCopyWith(
          SlotPlayerInfo value, $Res Function(SlotPlayerInfo) then) =
      _$SlotPlayerInfoCopyWithImpl<$Res>;
  $Res call({int timesPlayed});
}

/// @nodoc
class _$SlotPlayerInfoCopyWithImpl<$Res>
    implements $SlotPlayerInfoCopyWith<$Res> {
  _$SlotPlayerInfoCopyWithImpl(this._value, this._then);

  final SlotPlayerInfo _value;
  // ignore: unused_field
  final $Res Function(SlotPlayerInfo) _then;

  @override
  $Res call({
    Object? timesPlayed = freezed,
  }) {
    return _then(_value.copyWith(
      timesPlayed: timesPlayed == freezed
          ? _value.timesPlayed
          : timesPlayed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$SlotPlayerInfoCopyWith<$Res>
    implements $SlotPlayerInfoCopyWith<$Res> {
  factory _$SlotPlayerInfoCopyWith(
          _SlotPlayerInfo value, $Res Function(_SlotPlayerInfo) then) =
      __$SlotPlayerInfoCopyWithImpl<$Res>;
  @override
  $Res call({int timesPlayed});
}

/// @nodoc
class __$SlotPlayerInfoCopyWithImpl<$Res>
    extends _$SlotPlayerInfoCopyWithImpl<$Res>
    implements _$SlotPlayerInfoCopyWith<$Res> {
  __$SlotPlayerInfoCopyWithImpl(
      _SlotPlayerInfo _value, $Res Function(_SlotPlayerInfo) _then)
      : super(_value, (v) => _then(v as _SlotPlayerInfo));

  @override
  _SlotPlayerInfo get _value => super._value as _SlotPlayerInfo;

  @override
  $Res call({
    Object? timesPlayed = freezed,
  }) {
    return _then(_SlotPlayerInfo(
      timesPlayed: timesPlayed == freezed
          ? _value.timesPlayed
          : timesPlayed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SlotPlayerInfo extends _SlotPlayerInfo with DiagnosticableTreeMixin {
  const _$_SlotPlayerInfo({this.timesPlayed = 0}) : super._();

  factory _$_SlotPlayerInfo.fromJson(Map<String, dynamic> json) =>
      _$$_SlotPlayerInfoFromJson(json);

  @JsonKey()
  @override
  final int timesPlayed;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SlotPlayerInfo(timesPlayed: $timesPlayed)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SlotPlayerInfo'))
      ..add(DiagnosticsProperty('timesPlayed', timesPlayed));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SlotPlayerInfo &&
            const DeepCollectionEquality()
                .equals(other.timesPlayed, timesPlayed));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(timesPlayed));

  @JsonKey(ignore: true)
  @override
  _$SlotPlayerInfoCopyWith<_SlotPlayerInfo> get copyWith =>
      __$SlotPlayerInfoCopyWithImpl<_SlotPlayerInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SlotPlayerInfoToJson(this);
  }
}

abstract class _SlotPlayerInfo extends SlotPlayerInfo {
  const factory _SlotPlayerInfo({int timesPlayed}) = _$_SlotPlayerInfo;
  const _SlotPlayerInfo._() : super._();

  factory _SlotPlayerInfo.fromJson(Map<String, dynamic> json) =
      _$_SlotPlayerInfo.fromJson;

  @override
  int get timesPlayed;
  @override
  @JsonKey(ignore: true)
  _$SlotPlayerInfoCopyWith<_SlotPlayerInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
