// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kasado_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KasadoLocation _$KasadoLocationFromJson(Map<String, dynamic> json) {
  return _KasadoLocation.fromJson(json);
}

/// @nodoc
mixin _$KasadoLocation {
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KasadoLocationCopyWith<KasadoLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KasadoLocationCopyWith<$Res> {
  factory $KasadoLocationCopyWith(
          KasadoLocation value, $Res Function(KasadoLocation) then) =
      _$KasadoLocationCopyWithImpl<$Res, KasadoLocation>;
  @useResult
  $Res call({double lat, double lng, String? address});
}

/// @nodoc
class _$KasadoLocationCopyWithImpl<$Res, $Val extends KasadoLocation>
    implements $KasadoLocationCopyWith<$Res> {
  _$KasadoLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_KasadoLocationCopyWith<$Res>
    implements $KasadoLocationCopyWith<$Res> {
  factory _$$_KasadoLocationCopyWith(
          _$_KasadoLocation value, $Res Function(_$_KasadoLocation) then) =
      __$$_KasadoLocationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double lng, String? address});
}

/// @nodoc
class __$$_KasadoLocationCopyWithImpl<$Res>
    extends _$KasadoLocationCopyWithImpl<$Res, _$_KasadoLocation>
    implements _$$_KasadoLocationCopyWith<$Res> {
  __$$_KasadoLocationCopyWithImpl(
      _$_KasadoLocation _value, $Res Function(_$_KasadoLocation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
    Object? address = freezed,
  }) {
    return _then(_$_KasadoLocation(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KasadoLocation
    with DiagnosticableTreeMixin
    implements _KasadoLocation {
  const _$_KasadoLocation({required this.lat, required this.lng, this.address});

  factory _$_KasadoLocation.fromJson(Map<String, dynamic> json) =>
      _$$_KasadoLocationFromJson(json);

  @override
  final double lat;
  @override
  final double lng;
  @override
  final String? address;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'KasadoLocation(lat: $lat, lng: $lng, address: $address)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'KasadoLocation'))
      ..add(DiagnosticsProperty('lat', lat))
      ..add(DiagnosticsProperty('lng', lng))
      ..add(DiagnosticsProperty('address', address));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KasadoLocation &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KasadoLocationCopyWith<_$_KasadoLocation> get copyWith =>
      __$$_KasadoLocationCopyWithImpl<_$_KasadoLocation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KasadoLocationToJson(
      this,
    );
  }
}

abstract class _KasadoLocation implements KasadoLocation {
  const factory _KasadoLocation(
      {required final double lat,
      required final double lng,
      final String? address}) = _$_KasadoLocation;

  factory _KasadoLocation.fromJson(Map<String, dynamic> json) =
      _$_KasadoLocation.fromJson;

  @override
  double get lat;
  @override
  double get lng;
  @override
  String? get address;
  @override
  @JsonKey(ignore: true)
  _$$_KasadoLocationCopyWith<_$_KasadoLocation> get copyWith =>
      throw _privateConstructorUsedError;
}
