// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'kasado_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KasadoLocation _$KasadoLocationFromJson(Map<String, dynamic> json) {
  return _KasadoLocation.fromJson(json);
}

/// @nodoc
class _$KasadoLocationTearOff {
  const _$KasadoLocationTearOff();

  _KasadoLocation call(
      {required double lat, required double lng, String? address}) {
    return _KasadoLocation(
      lat: lat,
      lng: lng,
      address: address,
    );
  }

  KasadoLocation fromJson(Map<String, Object?> json) {
    return KasadoLocation.fromJson(json);
  }
}

/// @nodoc
const $KasadoLocation = _$KasadoLocationTearOff();

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
      _$KasadoLocationCopyWithImpl<$Res>;
  $Res call({double lat, double lng, String? address});
}

/// @nodoc
class _$KasadoLocationCopyWithImpl<$Res>
    implements $KasadoLocationCopyWith<$Res> {
  _$KasadoLocationCopyWithImpl(this._value, this._then);

  final KasadoLocation _value;
  // ignore: unused_field
  final $Res Function(KasadoLocation) _then;

  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$KasadoLocationCopyWith<$Res>
    implements $KasadoLocationCopyWith<$Res> {
  factory _$KasadoLocationCopyWith(
          _KasadoLocation value, $Res Function(_KasadoLocation) then) =
      __$KasadoLocationCopyWithImpl<$Res>;
  @override
  $Res call({double lat, double lng, String? address});
}

/// @nodoc
class __$KasadoLocationCopyWithImpl<$Res>
    extends _$KasadoLocationCopyWithImpl<$Res>
    implements _$KasadoLocationCopyWith<$Res> {
  __$KasadoLocationCopyWithImpl(
      _KasadoLocation _value, $Res Function(_KasadoLocation) _then)
      : super(_value, (v) => _then(v as _KasadoLocation));

  @override
  _KasadoLocation get _value => super._value as _KasadoLocation;

  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
    Object? address = freezed,
  }) {
    return _then(_KasadoLocation(
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      address: address == freezed
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
            other is _KasadoLocation &&
            const DeepCollectionEquality().equals(other.lat, lat) &&
            const DeepCollectionEquality().equals(other.lng, lng) &&
            const DeepCollectionEquality().equals(other.address, address));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(lat),
      const DeepCollectionEquality().hash(lng),
      const DeepCollectionEquality().hash(address));

  @JsonKey(ignore: true)
  @override
  _$KasadoLocationCopyWith<_KasadoLocation> get copyWith =>
      __$KasadoLocationCopyWithImpl<_KasadoLocation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KasadoLocationToJson(this);
  }
}

abstract class _KasadoLocation implements KasadoLocation {
  const factory _KasadoLocation(
      {required double lat,
      required double lng,
      String? address}) = _$_KasadoLocation;

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
  _$KasadoLocationCopyWith<_KasadoLocation> get copyWith =>
      throw _privateConstructorUsedError;
}
