// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slot_player_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SlotPlayerInfo _$SlotPlayerInfoFromJson(Map<String, dynamic> json) {
  return _SlotPlayerInfo.fromJson(json);
}

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
      _$SlotPlayerInfoCopyWithImpl<$Res, SlotPlayerInfo>;
  @useResult
  $Res call({int timesPlayed});
}

/// @nodoc
class _$SlotPlayerInfoCopyWithImpl<$Res, $Val extends SlotPlayerInfo>
    implements $SlotPlayerInfoCopyWith<$Res> {
  _$SlotPlayerInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timesPlayed = null,
  }) {
    return _then(_value.copyWith(
      timesPlayed: null == timesPlayed
          ? _value.timesPlayed
          : timesPlayed // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SlotPlayerInfoCopyWith<$Res>
    implements $SlotPlayerInfoCopyWith<$Res> {
  factory _$$_SlotPlayerInfoCopyWith(
          _$_SlotPlayerInfo value, $Res Function(_$_SlotPlayerInfo) then) =
      __$$_SlotPlayerInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int timesPlayed});
}

/// @nodoc
class __$$_SlotPlayerInfoCopyWithImpl<$Res>
    extends _$SlotPlayerInfoCopyWithImpl<$Res, _$_SlotPlayerInfo>
    implements _$$_SlotPlayerInfoCopyWith<$Res> {
  __$$_SlotPlayerInfoCopyWithImpl(
      _$_SlotPlayerInfo _value, $Res Function(_$_SlotPlayerInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timesPlayed = null,
  }) {
    return _then(_$_SlotPlayerInfo(
      timesPlayed: null == timesPlayed
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

  @override
  @JsonKey()
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
            other is _$_SlotPlayerInfo &&
            (identical(other.timesPlayed, timesPlayed) ||
                other.timesPlayed == timesPlayed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, timesPlayed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SlotPlayerInfoCopyWith<_$_SlotPlayerInfo> get copyWith =>
      __$$_SlotPlayerInfoCopyWithImpl<_$_SlotPlayerInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SlotPlayerInfoToJson(
      this,
    );
  }
}

abstract class _SlotPlayerInfo extends SlotPlayerInfo {
  const factory _SlotPlayerInfo({final int timesPlayed}) = _$_SlotPlayerInfo;
  const _SlotPlayerInfo._() : super._();

  factory _SlotPlayerInfo.fromJson(Map<String, dynamic> json) =
      _$_SlotPlayerInfo.fromJson;

  @override
  int get timesPlayed;
  @override
  @JsonKey(ignore: true)
  _$$_SlotPlayerInfoCopyWith<_$_SlotPlayerInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
