// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_bio.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserBio _$UserBioFromJson(Map<String, dynamic> json) {
  return _UserBio.fromJson(json);
}

/// @nodoc
class _$UserBioTearOff {
  const _$UserBioTearOff();

  _UserBio call(
      {DateTime? birthdate,
      double? heightFt,
      double? heightIn,
      double? weight,
      List<PlayerPosition> positions = const []}) {
    return _UserBio(
      birthdate: birthdate,
      heightFt: heightFt,
      heightIn: heightIn,
      weight: weight,
      positions: positions,
    );
  }

  UserBio fromJson(Map<String, Object?> json) {
    return UserBio.fromJson(json);
  }
}

/// @nodoc
const $UserBio = _$UserBioTearOff();

/// @nodoc
mixin _$UserBio {
  DateTime? get birthdate => throw _privateConstructorUsedError;
  double? get heightFt => throw _privateConstructorUsedError;
  double? get heightIn => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError;
  List<PlayerPosition> get positions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserBioCopyWith<UserBio> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBioCopyWith<$Res> {
  factory $UserBioCopyWith(UserBio value, $Res Function(UserBio) then) =
      _$UserBioCopyWithImpl<$Res>;
  $Res call(
      {DateTime? birthdate,
      double? heightFt,
      double? heightIn,
      double? weight,
      List<PlayerPosition> positions});
}

/// @nodoc
class _$UserBioCopyWithImpl<$Res> implements $UserBioCopyWith<$Res> {
  _$UserBioCopyWithImpl(this._value, this._then);

  final UserBio _value;
  // ignore: unused_field
  final $Res Function(UserBio) _then;

  @override
  $Res call({
    Object? birthdate = freezed,
    Object? heightFt = freezed,
    Object? heightIn = freezed,
    Object? weight = freezed,
    Object? positions = freezed,
  }) {
    return _then(_value.copyWith(
      birthdate: birthdate == freezed
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      heightFt: heightFt == freezed
          ? _value.heightFt
          : heightFt // ignore: cast_nullable_to_non_nullable
              as double?,
      heightIn: heightIn == freezed
          ? _value.heightIn
          : heightIn // ignore: cast_nullable_to_non_nullable
              as double?,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      positions: positions == freezed
          ? _value.positions
          : positions // ignore: cast_nullable_to_non_nullable
              as List<PlayerPosition>,
    ));
  }
}

/// @nodoc
abstract class _$UserBioCopyWith<$Res> implements $UserBioCopyWith<$Res> {
  factory _$UserBioCopyWith(_UserBio value, $Res Function(_UserBio) then) =
      __$UserBioCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime? birthdate,
      double? heightFt,
      double? heightIn,
      double? weight,
      List<PlayerPosition> positions});
}

/// @nodoc
class __$UserBioCopyWithImpl<$Res> extends _$UserBioCopyWithImpl<$Res>
    implements _$UserBioCopyWith<$Res> {
  __$UserBioCopyWithImpl(_UserBio _value, $Res Function(_UserBio) _then)
      : super(_value, (v) => _then(v as _UserBio));

  @override
  _UserBio get _value => super._value as _UserBio;

  @override
  $Res call({
    Object? birthdate = freezed,
    Object? heightFt = freezed,
    Object? heightIn = freezed,
    Object? weight = freezed,
    Object? positions = freezed,
  }) {
    return _then(_UserBio(
      birthdate: birthdate == freezed
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      heightFt: heightFt == freezed
          ? _value.heightFt
          : heightFt // ignore: cast_nullable_to_non_nullable
              as double?,
      heightIn: heightIn == freezed
          ? _value.heightIn
          : heightIn // ignore: cast_nullable_to_non_nullable
              as double?,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      positions: positions == freezed
          ? _value.positions
          : positions // ignore: cast_nullable_to_non_nullable
              as List<PlayerPosition>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserBio extends _UserBio with DiagnosticableTreeMixin {
  const _$_UserBio(
      {this.birthdate,
      this.heightFt,
      this.heightIn,
      this.weight,
      this.positions = const []})
      : super._();

  factory _$_UserBio.fromJson(Map<String, dynamic> json) =>
      _$$_UserBioFromJson(json);

  @override
  final DateTime? birthdate;
  @override
  final double? heightFt;
  @override
  final double? heightIn;
  @override
  final double? weight;
  @JsonKey()
  @override
  final List<PlayerPosition> positions;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserBio(birthdate: $birthdate, heightFt: $heightFt, heightIn: $heightIn, weight: $weight, positions: $positions)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserBio'))
      ..add(DiagnosticsProperty('birthdate', birthdate))
      ..add(DiagnosticsProperty('heightFt', heightFt))
      ..add(DiagnosticsProperty('heightIn', heightIn))
      ..add(DiagnosticsProperty('weight', weight))
      ..add(DiagnosticsProperty('positions', positions));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserBio &&
            const DeepCollectionEquality().equals(other.birthdate, birthdate) &&
            const DeepCollectionEquality().equals(other.heightFt, heightFt) &&
            const DeepCollectionEquality().equals(other.heightIn, heightIn) &&
            const DeepCollectionEquality().equals(other.weight, weight) &&
            const DeepCollectionEquality().equals(other.positions, positions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(birthdate),
      const DeepCollectionEquality().hash(heightFt),
      const DeepCollectionEquality().hash(heightIn),
      const DeepCollectionEquality().hash(weight),
      const DeepCollectionEquality().hash(positions));

  @JsonKey(ignore: true)
  @override
  _$UserBioCopyWith<_UserBio> get copyWith =>
      __$UserBioCopyWithImpl<_UserBio>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserBioToJson(this);
  }
}

abstract class _UserBio extends UserBio {
  const factory _UserBio(
      {DateTime? birthdate,
      double? heightFt,
      double? heightIn,
      double? weight,
      List<PlayerPosition> positions}) = _$_UserBio;
  const _UserBio._() : super._();

  factory _UserBio.fromJson(Map<String, dynamic> json) = _$_UserBio.fromJson;

  @override
  DateTime? get birthdate;
  @override
  double? get heightFt;
  @override
  double? get heightIn;
  @override
  double? get weight;
  @override
  List<PlayerPosition> get positions;
  @override
  @JsonKey(ignore: true)
  _$UserBioCopyWith<_UserBio> get copyWith =>
      throw _privateConstructorUsedError;
}
