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
      required String photoUrl,
      required double ticketPrice,
      required List<TimeRange> allowedTimeSlots,
      required CourtSlot nextAvailableSlot}) {
    return _Court(
      id: id,
      name: name,
      photoUrl: photoUrl,
      ticketPrice: ticketPrice,
      allowedTimeSlots: allowedTimeSlots,
      nextAvailableSlot: nextAvailableSlot,
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
  String get photoUrl => throw _privateConstructorUsedError;
  double get ticketPrice => throw _privateConstructorUsedError;
  List<TimeRange> get allowedTimeSlots => throw _privateConstructorUsedError;
  CourtSlot get nextAvailableSlot => throw _privateConstructorUsedError;

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
      String photoUrl,
      double ticketPrice,
      List<TimeRange> allowedTimeSlots,
      CourtSlot nextAvailableSlot});

  $CourtSlotCopyWith<$Res> get nextAvailableSlot;
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
    Object? photoUrl = freezed,
    Object? ticketPrice = freezed,
    Object? allowedTimeSlots = freezed,
    Object? nextAvailableSlot = freezed,
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
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      ticketPrice: ticketPrice == freezed
          ? _value.ticketPrice
          : ticketPrice // ignore: cast_nullable_to_non_nullable
              as double,
      allowedTimeSlots: allowedTimeSlots == freezed
          ? _value.allowedTimeSlots
          : allowedTimeSlots // ignore: cast_nullable_to_non_nullable
              as List<TimeRange>,
      nextAvailableSlot: nextAvailableSlot == freezed
          ? _value.nextAvailableSlot
          : nextAvailableSlot // ignore: cast_nullable_to_non_nullable
              as CourtSlot,
    ));
  }

  @override
  $CourtSlotCopyWith<$Res> get nextAvailableSlot {
    return $CourtSlotCopyWith<$Res>(_value.nextAvailableSlot, (value) {
      return _then(_value.copyWith(nextAvailableSlot: value));
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
      String photoUrl,
      double ticketPrice,
      List<TimeRange> allowedTimeSlots,
      CourtSlot nextAvailableSlot});

  @override
  $CourtSlotCopyWith<$Res> get nextAvailableSlot;
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
    Object? photoUrl = freezed,
    Object? ticketPrice = freezed,
    Object? allowedTimeSlots = freezed,
    Object? nextAvailableSlot = freezed,
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
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      ticketPrice: ticketPrice == freezed
          ? _value.ticketPrice
          : ticketPrice // ignore: cast_nullable_to_non_nullable
              as double,
      allowedTimeSlots: allowedTimeSlots == freezed
          ? _value.allowedTimeSlots
          : allowedTimeSlots // ignore: cast_nullable_to_non_nullable
              as List<TimeRange>,
      nextAvailableSlot: nextAvailableSlot == freezed
          ? _value.nextAvailableSlot
          : nextAvailableSlot // ignore: cast_nullable_to_non_nullable
              as CourtSlot,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Court with DiagnosticableTreeMixin implements _Court {
  const _$_Court(
      {required this.id,
      required this.name,
      required this.photoUrl,
      required this.ticketPrice,
      required this.allowedTimeSlots,
      required this.nextAvailableSlot});

  factory _$_Court.fromJson(Map<String, dynamic> json) =>
      _$$_CourtFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String photoUrl;
  @override
  final double ticketPrice;
  @override
  final List<TimeRange> allowedTimeSlots;
  @override
  final CourtSlot nextAvailableSlot;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Court(id: $id, name: $name, photoUrl: $photoUrl, ticketPrice: $ticketPrice, allowedTimeSlots: $allowedTimeSlots, nextAvailableSlot: $nextAvailableSlot)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Court'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('photoUrl', photoUrl))
      ..add(DiagnosticsProperty('ticketPrice', ticketPrice))
      ..add(DiagnosticsProperty('allowedTimeSlots', allowedTimeSlots))
      ..add(DiagnosticsProperty('nextAvailableSlot', nextAvailableSlot));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Court &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.photoUrl, photoUrl) &&
            const DeepCollectionEquality()
                .equals(other.ticketPrice, ticketPrice) &&
            const DeepCollectionEquality()
                .equals(other.allowedTimeSlots, allowedTimeSlots) &&
            const DeepCollectionEquality()
                .equals(other.nextAvailableSlot, nextAvailableSlot));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(photoUrl),
      const DeepCollectionEquality().hash(ticketPrice),
      const DeepCollectionEquality().hash(allowedTimeSlots),
      const DeepCollectionEquality().hash(nextAvailableSlot));

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
      required String photoUrl,
      required double ticketPrice,
      required List<TimeRange> allowedTimeSlots,
      required CourtSlot nextAvailableSlot}) = _$_Court;

  factory _Court.fromJson(Map<String, dynamic> json) = _$_Court.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get photoUrl;
  @override
  double get ticketPrice;
  @override
  List<TimeRange> get allowedTimeSlots;
  @override
  CourtSlot get nextAvailableSlot;
  @override
  @JsonKey(ignore: true)
  _$CourtCopyWith<_Court> get copyWith => throw _privateConstructorUsedError;
}
