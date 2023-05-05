// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_bio.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserBio _$UserBioFromJson(Map<String, dynamic> json) {
  return _UserBio.fromJson(json);
}

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
      _$UserBioCopyWithImpl<$Res, UserBio>;
  @useResult
  $Res call(
      {DateTime? birthdate,
      double? heightFt,
      double? heightIn,
      double? weight,
      List<PlayerPosition> positions});
}

/// @nodoc
class _$UserBioCopyWithImpl<$Res, $Val extends UserBio>
    implements $UserBioCopyWith<$Res> {
  _$UserBioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? birthdate = freezed,
    Object? heightFt = freezed,
    Object? heightIn = freezed,
    Object? weight = freezed,
    Object? positions = null,
  }) {
    return _then(_value.copyWith(
      birthdate: freezed == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      heightFt: freezed == heightFt
          ? _value.heightFt
          : heightFt // ignore: cast_nullable_to_non_nullable
              as double?,
      heightIn: freezed == heightIn
          ? _value.heightIn
          : heightIn // ignore: cast_nullable_to_non_nullable
              as double?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      positions: null == positions
          ? _value.positions
          : positions // ignore: cast_nullable_to_non_nullable
              as List<PlayerPosition>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserBioCopyWith<$Res> implements $UserBioCopyWith<$Res> {
  factory _$$_UserBioCopyWith(
          _$_UserBio value, $Res Function(_$_UserBio) then) =
      __$$_UserBioCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? birthdate,
      double? heightFt,
      double? heightIn,
      double? weight,
      List<PlayerPosition> positions});
}

/// @nodoc
class __$$_UserBioCopyWithImpl<$Res>
    extends _$UserBioCopyWithImpl<$Res, _$_UserBio>
    implements _$$_UserBioCopyWith<$Res> {
  __$$_UserBioCopyWithImpl(_$_UserBio _value, $Res Function(_$_UserBio) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? birthdate = freezed,
    Object? heightFt = freezed,
    Object? heightIn = freezed,
    Object? weight = freezed,
    Object? positions = null,
  }) {
    return _then(_$_UserBio(
      birthdate: freezed == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      heightFt: freezed == heightFt
          ? _value.heightFt
          : heightFt // ignore: cast_nullable_to_non_nullable
              as double?,
      heightIn: freezed == heightIn
          ? _value.heightIn
          : heightIn // ignore: cast_nullable_to_non_nullable
              as double?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      positions: null == positions
          ? _value._positions
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
      final List<PlayerPosition> positions = const []})
      : _positions = positions,
        super._();

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
  final List<PlayerPosition> _positions;
  @override
  @JsonKey()
  List<PlayerPosition> get positions {
    if (_positions is EqualUnmodifiableListView) return _positions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_positions);
  }

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
            other is _$_UserBio &&
            (identical(other.birthdate, birthdate) ||
                other.birthdate == birthdate) &&
            (identical(other.heightFt, heightFt) ||
                other.heightFt == heightFt) &&
            (identical(other.heightIn, heightIn) ||
                other.heightIn == heightIn) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            const DeepCollectionEquality()
                .equals(other._positions, _positions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, birthdate, heightFt, heightIn,
      weight, const DeepCollectionEquality().hash(_positions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserBioCopyWith<_$_UserBio> get copyWith =>
      __$$_UserBioCopyWithImpl<_$_UserBio>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserBioToJson(
      this,
    );
  }
}

abstract class _UserBio extends UserBio {
  const factory _UserBio(
      {final DateTime? birthdate,
      final double? heightFt,
      final double? heightIn,
      final double? weight,
      final List<PlayerPosition> positions}) = _$_UserBio;
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
  _$$_UserBioCopyWith<_$_UserBio> get copyWith =>
      throw _privateConstructorUsedError;
}
