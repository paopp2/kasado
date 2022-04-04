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
      required String address,
      required String photoUrl,
      required double ticketPrice,
      required List<WeekDays> allowedWeekDays,
      required List<TimeRange> allowedTimeSlots,
      required List<String> adminIds,
      List<CourtSlot>? specialCourtSlots = const []}) {
    return _Court(
      id: id,
      name: name,
      address: address,
      photoUrl: photoUrl,
      ticketPrice: ticketPrice,
      allowedWeekDays: allowedWeekDays,
      allowedTimeSlots: allowedTimeSlots,
      adminIds: adminIds,
      specialCourtSlots: specialCourtSlots,
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
  String get address => throw _privateConstructorUsedError;
  String get photoUrl => throw _privateConstructorUsedError;
  double get ticketPrice => throw _privateConstructorUsedError;
  List<WeekDays> get allowedWeekDays => throw _privateConstructorUsedError;
  List<TimeRange> get allowedTimeSlots => throw _privateConstructorUsedError;
  List<String> get adminIds => throw _privateConstructorUsedError;

  /// Special courtSlots are courtSlots wherein all the other slots with the
  /// same day as them are hidden. In other words, only the specialCourtSlots
  /// are shown during the day that they occur
//
// These are in use with Syncfusion's calendar widget and its
// 'recurrenceExceptionDates' feature. Useful when admin has to hide some
// slots to the end user
  List<CourtSlot>? get specialCourtSlots => throw _privateConstructorUsedError;

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
      String address,
      String photoUrl,
      double ticketPrice,
      List<WeekDays> allowedWeekDays,
      List<TimeRange> allowedTimeSlots,
      List<String> adminIds,
      List<CourtSlot>? specialCourtSlots});
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
    Object? address = freezed,
    Object? photoUrl = freezed,
    Object? ticketPrice = freezed,
    Object? allowedWeekDays = freezed,
    Object? allowedTimeSlots = freezed,
    Object? adminIds = freezed,
    Object? specialCourtSlots = freezed,
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
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      ticketPrice: ticketPrice == freezed
          ? _value.ticketPrice
          : ticketPrice // ignore: cast_nullable_to_non_nullable
              as double,
      allowedWeekDays: allowedWeekDays == freezed
          ? _value.allowedWeekDays
          : allowedWeekDays // ignore: cast_nullable_to_non_nullable
              as List<WeekDays>,
      allowedTimeSlots: allowedTimeSlots == freezed
          ? _value.allowedTimeSlots
          : allowedTimeSlots // ignore: cast_nullable_to_non_nullable
              as List<TimeRange>,
      adminIds: adminIds == freezed
          ? _value.adminIds
          : adminIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      specialCourtSlots: specialCourtSlots == freezed
          ? _value.specialCourtSlots
          : specialCourtSlots // ignore: cast_nullable_to_non_nullable
              as List<CourtSlot>?,
    ));
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
      String address,
      String photoUrl,
      double ticketPrice,
      List<WeekDays> allowedWeekDays,
      List<TimeRange> allowedTimeSlots,
      List<String> adminIds,
      List<CourtSlot>? specialCourtSlots});
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
    Object? address = freezed,
    Object? photoUrl = freezed,
    Object? ticketPrice = freezed,
    Object? allowedWeekDays = freezed,
    Object? allowedTimeSlots = freezed,
    Object? adminIds = freezed,
    Object? specialCourtSlots = freezed,
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
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      ticketPrice: ticketPrice == freezed
          ? _value.ticketPrice
          : ticketPrice // ignore: cast_nullable_to_non_nullable
              as double,
      allowedWeekDays: allowedWeekDays == freezed
          ? _value.allowedWeekDays
          : allowedWeekDays // ignore: cast_nullable_to_non_nullable
              as List<WeekDays>,
      allowedTimeSlots: allowedTimeSlots == freezed
          ? _value.allowedTimeSlots
          : allowedTimeSlots // ignore: cast_nullable_to_non_nullable
              as List<TimeRange>,
      adminIds: adminIds == freezed
          ? _value.adminIds
          : adminIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      specialCourtSlots: specialCourtSlots == freezed
          ? _value.specialCourtSlots
          : specialCourtSlots // ignore: cast_nullable_to_non_nullable
              as List<CourtSlot>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Court with DiagnosticableTreeMixin implements _Court {
  const _$_Court(
      {required this.id,
      required this.name,
      required this.address,
      required this.photoUrl,
      required this.ticketPrice,
      required this.allowedWeekDays,
      required this.allowedTimeSlots,
      required this.adminIds,
      this.specialCourtSlots = const []});

  factory _$_Court.fromJson(Map<String, dynamic> json) =>
      _$$_CourtFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String address;
  @override
  final String photoUrl;
  @override
  final double ticketPrice;
  @override
  final List<WeekDays> allowedWeekDays;
  @override
  final List<TimeRange> allowedTimeSlots;
  @override
  final List<String> adminIds;
  @JsonKey()
  @override

  /// Special courtSlots are courtSlots wherein all the other slots with the
  /// same day as them are hidden. In other words, only the specialCourtSlots
  /// are shown during the day that they occur
//
// These are in use with Syncfusion's calendar widget and its
// 'recurrenceExceptionDates' feature. Useful when admin has to hide some
// slots to the end user
  final List<CourtSlot>? specialCourtSlots;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Court(id: $id, name: $name, address: $address, photoUrl: $photoUrl, ticketPrice: $ticketPrice, allowedWeekDays: $allowedWeekDays, allowedTimeSlots: $allowedTimeSlots, adminIds: $adminIds, specialCourtSlots: $specialCourtSlots)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Court'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('photoUrl', photoUrl))
      ..add(DiagnosticsProperty('ticketPrice', ticketPrice))
      ..add(DiagnosticsProperty('allowedWeekDays', allowedWeekDays))
      ..add(DiagnosticsProperty('allowedTimeSlots', allowedTimeSlots))
      ..add(DiagnosticsProperty('adminIds', adminIds))
      ..add(DiagnosticsProperty('specialCourtSlots', specialCourtSlots));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Court &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.photoUrl, photoUrl) &&
            const DeepCollectionEquality()
                .equals(other.ticketPrice, ticketPrice) &&
            const DeepCollectionEquality()
                .equals(other.allowedWeekDays, allowedWeekDays) &&
            const DeepCollectionEquality()
                .equals(other.allowedTimeSlots, allowedTimeSlots) &&
            const DeepCollectionEquality().equals(other.adminIds, adminIds) &&
            const DeepCollectionEquality()
                .equals(other.specialCourtSlots, specialCourtSlots));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(photoUrl),
      const DeepCollectionEquality().hash(ticketPrice),
      const DeepCollectionEquality().hash(allowedWeekDays),
      const DeepCollectionEquality().hash(allowedTimeSlots),
      const DeepCollectionEquality().hash(adminIds),
      const DeepCollectionEquality().hash(specialCourtSlots));

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
      required String address,
      required String photoUrl,
      required double ticketPrice,
      required List<WeekDays> allowedWeekDays,
      required List<TimeRange> allowedTimeSlots,
      required List<String> adminIds,
      List<CourtSlot>? specialCourtSlots}) = _$_Court;

  factory _Court.fromJson(Map<String, dynamic> json) = _$_Court.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get address;
  @override
  String get photoUrl;
  @override
  double get ticketPrice;
  @override
  List<WeekDays> get allowedWeekDays;
  @override
  List<TimeRange> get allowedTimeSlots;
  @override
  List<String> get adminIds;
  @override

  /// Special courtSlots are courtSlots wherein all the other slots with the
  /// same day as them are hidden. In other words, only the specialCourtSlots
  /// are shown during the day that they occur
//
// These are in use with Syncfusion's calendar widget and its
// 'recurrenceExceptionDates' feature. Useful when admin has to hide some
// slots to the end user
  List<CourtSlot>? get specialCourtSlots;
  @override
  @JsonKey(ignore: true)
  _$CourtCopyWith<_Court> get copyWith => throw _privateConstructorUsedError;
}
