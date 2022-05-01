// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'court.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Court _$CourtFromJson(Map<String, dynamic> json) {
  return _Court.fromJson(json);
}

/// @nodoc
class _$CourtTearOff {
  const _$CourtTearOff();

  _Court call(
      {required String id,
      required String name,
      required KasadoLocation location,
      required String photoUrl,
      required double ticketPrice,
      required List<String> adminIds,
      List<CourtSched> courtScheds = const [],
      bool isHidden = false,
      required int maxPerSlot,
      required int minPerSlot,
      List<CourtSched> specialCourtScheds = const []}) {
    return _Court(
      id: id,
      name: name,
      location: location,
      photoUrl: photoUrl,
      ticketPrice: ticketPrice,
      adminIds: adminIds,
      courtScheds: courtScheds,
      isHidden: isHidden,
      maxPerSlot: maxPerSlot,
      minPerSlot: minPerSlot,
      specialCourtScheds: specialCourtScheds,
    );
  }

  Court fromJson(Map<String, Object?> json) {
    return Court.fromJson(json);
  }
}

/// @nodoc
const $Court = _$CourtTearOff();

/// @nodoc
mixin _$Court {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  KasadoLocation get location => throw _privateConstructorUsedError;
  String get photoUrl => throw _privateConstructorUsedError;
  double get ticketPrice => throw _privateConstructorUsedError;
  List<String> get adminIds => throw _privateConstructorUsedError;
  List<CourtSched> get courtScheds => throw _privateConstructorUsedError;
  bool get isHidden => throw _privateConstructorUsedError;
  int get maxPerSlot => throw _privateConstructorUsedError;
  int get minPerSlot => throw _privateConstructorUsedError;

  /// Special courtScheds are courtScheds wherein all the other slots with the
  /// same day as them are hidden. In other words, only the specialCourtScheds
  /// are shown during the day that they occur
//
// These are in use with Syncfusion's calendar widget and its
// 'recurrenceExceptionDates' feature. Useful when admin has to hide some
// slots from the end user
  List<CourtSched> get specialCourtScheds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourtCopyWith<Court> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourtCopyWith<$Res> {
  factory $CourtCopyWith(Court value, $Res Function(Court) then) =
      _$CourtCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      KasadoLocation location,
      String photoUrl,
      double ticketPrice,
      List<String> adminIds,
      List<CourtSched> courtScheds,
      bool isHidden,
      int maxPerSlot,
      int minPerSlot,
      List<CourtSched> specialCourtScheds});

  $KasadoLocationCopyWith<$Res> get location;
}

/// @nodoc
class _$CourtCopyWithImpl<$Res> implements $CourtCopyWith<$Res> {
  _$CourtCopyWithImpl(this._value, this._then);

  final Court _value;
  // ignore: unused_field
  final $Res Function(Court) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? location = freezed,
    Object? photoUrl = freezed,
    Object? ticketPrice = freezed,
    Object? adminIds = freezed,
    Object? courtScheds = freezed,
    Object? isHidden = freezed,
    Object? maxPerSlot = freezed,
    Object? minPerSlot = freezed,
    Object? specialCourtScheds = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as KasadoLocation,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      ticketPrice: ticketPrice == freezed
          ? _value.ticketPrice
          : ticketPrice // ignore: cast_nullable_to_non_nullable
              as double,
      adminIds: adminIds == freezed
          ? _value.adminIds
          : adminIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      courtScheds: courtScheds == freezed
          ? _value.courtScheds
          : courtScheds // ignore: cast_nullable_to_non_nullable
              as List<CourtSched>,
      isHidden: isHidden == freezed
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      maxPerSlot: maxPerSlot == freezed
          ? _value.maxPerSlot
          : maxPerSlot // ignore: cast_nullable_to_non_nullable
              as int,
      minPerSlot: minPerSlot == freezed
          ? _value.minPerSlot
          : minPerSlot // ignore: cast_nullable_to_non_nullable
              as int,
      specialCourtScheds: specialCourtScheds == freezed
          ? _value.specialCourtScheds
          : specialCourtScheds // ignore: cast_nullable_to_non_nullable
              as List<CourtSched>,
    ));
  }

  @override
  $KasadoLocationCopyWith<$Res> get location {
    return $KasadoLocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value));
    });
  }
}

/// @nodoc
abstract class _$CourtCopyWith<$Res> implements $CourtCopyWith<$Res> {
  factory _$CourtCopyWith(_Court value, $Res Function(_Court) then) =
      __$CourtCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      KasadoLocation location,
      String photoUrl,
      double ticketPrice,
      List<String> adminIds,
      List<CourtSched> courtScheds,
      bool isHidden,
      int maxPerSlot,
      int minPerSlot,
      List<CourtSched> specialCourtScheds});

  @override
  $KasadoLocationCopyWith<$Res> get location;
}

/// @nodoc
class __$CourtCopyWithImpl<$Res> extends _$CourtCopyWithImpl<$Res>
    implements _$CourtCopyWith<$Res> {
  __$CourtCopyWithImpl(_Court _value, $Res Function(_Court) _then)
      : super(_value, (v) => _then(v as _Court));

  @override
  _Court get _value => super._value as _Court;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? location = freezed,
    Object? photoUrl = freezed,
    Object? ticketPrice = freezed,
    Object? adminIds = freezed,
    Object? courtScheds = freezed,
    Object? isHidden = freezed,
    Object? maxPerSlot = freezed,
    Object? minPerSlot = freezed,
    Object? specialCourtScheds = freezed,
  }) {
    return _then(_Court(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as KasadoLocation,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      ticketPrice: ticketPrice == freezed
          ? _value.ticketPrice
          : ticketPrice // ignore: cast_nullable_to_non_nullable
              as double,
      adminIds: adminIds == freezed
          ? _value.adminIds
          : adminIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      courtScheds: courtScheds == freezed
          ? _value.courtScheds
          : courtScheds // ignore: cast_nullable_to_non_nullable
              as List<CourtSched>,
      isHidden: isHidden == freezed
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      maxPerSlot: maxPerSlot == freezed
          ? _value.maxPerSlot
          : maxPerSlot // ignore: cast_nullable_to_non_nullable
              as int,
      minPerSlot: minPerSlot == freezed
          ? _value.minPerSlot
          : minPerSlot // ignore: cast_nullable_to_non_nullable
              as int,
      specialCourtScheds: specialCourtScheds == freezed
          ? _value.specialCourtScheds
          : specialCourtScheds // ignore: cast_nullable_to_non_nullable
              as List<CourtSched>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Court with DiagnosticableTreeMixin implements _Court {
  const _$_Court(
      {required this.id,
      required this.name,
      required this.location,
      required this.photoUrl,
      required this.ticketPrice,
      required this.adminIds,
      this.courtScheds = const [],
      this.isHidden = false,
      required this.maxPerSlot,
      required this.minPerSlot,
      this.specialCourtScheds = const []});

  factory _$_Court.fromJson(Map<String, dynamic> json) =>
      _$$_CourtFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final KasadoLocation location;
  @override
  final String photoUrl;
  @override
  final double ticketPrice;
  @override
  final List<String> adminIds;
  @JsonKey()
  @override
  final List<CourtSched> courtScheds;
  @JsonKey()
  @override
  final bool isHidden;
  @override
  final int maxPerSlot;
  @override
  final int minPerSlot;
  @JsonKey()
  @override

  /// Special courtScheds are courtScheds wherein all the other slots with the
  /// same day as them are hidden. In other words, only the specialCourtScheds
  /// are shown during the day that they occur
//
// These are in use with Syncfusion's calendar widget and its
// 'recurrenceExceptionDates' feature. Useful when admin has to hide some
// slots from the end user
  final List<CourtSched> specialCourtScheds;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Court(id: $id, name: $name, location: $location, photoUrl: $photoUrl, ticketPrice: $ticketPrice, adminIds: $adminIds, courtScheds: $courtScheds, isHidden: $isHidden, maxPerSlot: $maxPerSlot, minPerSlot: $minPerSlot, specialCourtScheds: $specialCourtScheds)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Court'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('photoUrl', photoUrl))
      ..add(DiagnosticsProperty('ticketPrice', ticketPrice))
      ..add(DiagnosticsProperty('adminIds', adminIds))
      ..add(DiagnosticsProperty('courtScheds', courtScheds))
      ..add(DiagnosticsProperty('isHidden', isHidden))
      ..add(DiagnosticsProperty('maxPerSlot', maxPerSlot))
      ..add(DiagnosticsProperty('minPerSlot', minPerSlot))
      ..add(DiagnosticsProperty('specialCourtScheds', specialCourtScheds));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Court &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.photoUrl, photoUrl) &&
            const DeepCollectionEquality()
                .equals(other.ticketPrice, ticketPrice) &&
            const DeepCollectionEquality().equals(other.adminIds, adminIds) &&
            const DeepCollectionEquality()
                .equals(other.courtScheds, courtScheds) &&
            const DeepCollectionEquality().equals(other.isHidden, isHidden) &&
            const DeepCollectionEquality()
                .equals(other.maxPerSlot, maxPerSlot) &&
            const DeepCollectionEquality()
                .equals(other.minPerSlot, minPerSlot) &&
            const DeepCollectionEquality()
                .equals(other.specialCourtScheds, specialCourtScheds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(photoUrl),
      const DeepCollectionEquality().hash(ticketPrice),
      const DeepCollectionEquality().hash(adminIds),
      const DeepCollectionEquality().hash(courtScheds),
      const DeepCollectionEquality().hash(isHidden),
      const DeepCollectionEquality().hash(maxPerSlot),
      const DeepCollectionEquality().hash(minPerSlot),
      const DeepCollectionEquality().hash(specialCourtScheds));

  @JsonKey(ignore: true)
  @override
  _$CourtCopyWith<_Court> get copyWith =>
      __$CourtCopyWithImpl<_Court>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CourtToJson(this);
  }
}

abstract class _Court implements Court {
  const factory _Court(
      {required String id,
      required String name,
      required KasadoLocation location,
      required String photoUrl,
      required double ticketPrice,
      required List<String> adminIds,
      List<CourtSched> courtScheds,
      bool isHidden,
      required int maxPerSlot,
      required int minPerSlot,
      List<CourtSched> specialCourtScheds}) = _$_Court;

  factory _Court.fromJson(Map<String, dynamic> json) = _$_Court.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  KasadoLocation get location;
  @override
  String get photoUrl;
  @override
  double get ticketPrice;
  @override
  List<String> get adminIds;
  @override
  List<CourtSched> get courtScheds;
  @override
  bool get isHidden;
  @override
  int get maxPerSlot;
  @override
  int get minPerSlot;
  @override

  /// Special courtScheds are courtScheds wherein all the other slots with the
  /// same day as them are hidden. In other words, only the specialCourtScheds
  /// are shown during the day that they occur
//
// These are in use with Syncfusion's calendar widget and its
// 'recurrenceExceptionDates' feature. Useful when admin has to hide some
// slots from the end user
  List<CourtSched> get specialCourtScheds;
  @override
  @JsonKey(ignore: true)
  _$CourtCopyWith<_Court> get copyWith => throw _privateConstructorUsedError;
}
