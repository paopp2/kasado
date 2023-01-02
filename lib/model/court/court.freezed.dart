// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'court.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Court _$CourtFromJson(Map<String, dynamic> json) {
  return _Court.fromJson(json);
}

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
      _$CourtCopyWithImpl<$Res, Court>;
  @useResult
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
class _$CourtCopyWithImpl<$Res, $Val extends Court>
    implements $CourtCopyWith<$Res> {
  _$CourtCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? location = null,
    Object? photoUrl = null,
    Object? ticketPrice = null,
    Object? adminIds = null,
    Object? courtScheds = null,
    Object? isHidden = null,
    Object? maxPerSlot = null,
    Object? minPerSlot = null,
    Object? specialCourtScheds = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as KasadoLocation,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      ticketPrice: null == ticketPrice
          ? _value.ticketPrice
          : ticketPrice // ignore: cast_nullable_to_non_nullable
              as double,
      adminIds: null == adminIds
          ? _value.adminIds
          : adminIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      courtScheds: null == courtScheds
          ? _value.courtScheds
          : courtScheds // ignore: cast_nullable_to_non_nullable
              as List<CourtSched>,
      isHidden: null == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      maxPerSlot: null == maxPerSlot
          ? _value.maxPerSlot
          : maxPerSlot // ignore: cast_nullable_to_non_nullable
              as int,
      minPerSlot: null == minPerSlot
          ? _value.minPerSlot
          : minPerSlot // ignore: cast_nullable_to_non_nullable
              as int,
      specialCourtScheds: null == specialCourtScheds
          ? _value.specialCourtScheds
          : specialCourtScheds // ignore: cast_nullable_to_non_nullable
              as List<CourtSched>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $KasadoLocationCopyWith<$Res> get location {
    return $KasadoLocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CourtCopyWith<$Res> implements $CourtCopyWith<$Res> {
  factory _$$_CourtCopyWith(_$_Court value, $Res Function(_$_Court) then) =
      __$$_CourtCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$_CourtCopyWithImpl<$Res> extends _$CourtCopyWithImpl<$Res, _$_Court>
    implements _$$_CourtCopyWith<$Res> {
  __$$_CourtCopyWithImpl(_$_Court _value, $Res Function(_$_Court) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? location = null,
    Object? photoUrl = null,
    Object? ticketPrice = null,
    Object? adminIds = null,
    Object? courtScheds = null,
    Object? isHidden = null,
    Object? maxPerSlot = null,
    Object? minPerSlot = null,
    Object? specialCourtScheds = null,
  }) {
    return _then(_$_Court(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as KasadoLocation,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      ticketPrice: null == ticketPrice
          ? _value.ticketPrice
          : ticketPrice // ignore: cast_nullable_to_non_nullable
              as double,
      adminIds: null == adminIds
          ? _value._adminIds
          : adminIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      courtScheds: null == courtScheds
          ? _value._courtScheds
          : courtScheds // ignore: cast_nullable_to_non_nullable
              as List<CourtSched>,
      isHidden: null == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      maxPerSlot: null == maxPerSlot
          ? _value.maxPerSlot
          : maxPerSlot // ignore: cast_nullable_to_non_nullable
              as int,
      minPerSlot: null == minPerSlot
          ? _value.minPerSlot
          : minPerSlot // ignore: cast_nullable_to_non_nullable
              as int,
      specialCourtScheds: null == specialCourtScheds
          ? _value._specialCourtScheds
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
      required final List<String> adminIds,
      final List<CourtSched> courtScheds = const [],
      this.isHidden = false,
      required this.maxPerSlot,
      required this.minPerSlot,
      final List<CourtSched> specialCourtScheds = const []})
      : _adminIds = adminIds,
        _courtScheds = courtScheds,
        _specialCourtScheds = specialCourtScheds;

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
  final List<String> _adminIds;
  @override
  List<String> get adminIds {
    if (_adminIds is EqualUnmodifiableListView) return _adminIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_adminIds);
  }

  final List<CourtSched> _courtScheds;
  @override
  @JsonKey()
  List<CourtSched> get courtScheds {
    if (_courtScheds is EqualUnmodifiableListView) return _courtScheds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_courtScheds);
  }

  @override
  @JsonKey()
  final bool isHidden;
  @override
  final int maxPerSlot;
  @override
  final int minPerSlot;

  /// Special courtScheds are courtScheds wherein all the other slots with the
  /// same day as them are hidden. In other words, only the specialCourtScheds
  /// are shown during the day that they occur
//
// These are in use with Syncfusion's calendar widget and its
// 'recurrenceExceptionDates' feature. Useful when admin has to hide some
// slots from the end user
  final List<CourtSched> _specialCourtScheds;

  /// Special courtScheds are courtScheds wherein all the other slots with the
  /// same day as them are hidden. In other words, only the specialCourtScheds
  /// are shown during the day that they occur
//
// These are in use with Syncfusion's calendar widget and its
// 'recurrenceExceptionDates' feature. Useful when admin has to hide some
// slots from the end user
  @override
  @JsonKey()
  List<CourtSched> get specialCourtScheds {
    if (_specialCourtScheds is EqualUnmodifiableListView)
      return _specialCourtScheds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_specialCourtScheds);
  }

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
            other is _$_Court &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.ticketPrice, ticketPrice) ||
                other.ticketPrice == ticketPrice) &&
            const DeepCollectionEquality().equals(other._adminIds, _adminIds) &&
            const DeepCollectionEquality()
                .equals(other._courtScheds, _courtScheds) &&
            (identical(other.isHidden, isHidden) ||
                other.isHidden == isHidden) &&
            (identical(other.maxPerSlot, maxPerSlot) ||
                other.maxPerSlot == maxPerSlot) &&
            (identical(other.minPerSlot, minPerSlot) ||
                other.minPerSlot == minPerSlot) &&
            const DeepCollectionEquality()
                .equals(other._specialCourtScheds, _specialCourtScheds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      location,
      photoUrl,
      ticketPrice,
      const DeepCollectionEquality().hash(_adminIds),
      const DeepCollectionEquality().hash(_courtScheds),
      isHidden,
      maxPerSlot,
      minPerSlot,
      const DeepCollectionEquality().hash(_specialCourtScheds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CourtCopyWith<_$_Court> get copyWith =>
      __$$_CourtCopyWithImpl<_$_Court>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CourtToJson(
      this,
    );
  }
}

abstract class _Court implements Court {
  const factory _Court(
      {required final String id,
      required final String name,
      required final KasadoLocation location,
      required final String photoUrl,
      required final double ticketPrice,
      required final List<String> adminIds,
      final List<CourtSched> courtScheds,
      final bool isHidden,
      required final int maxPerSlot,
      required final int minPerSlot,
      final List<CourtSched> specialCourtScheds}) = _$_Court;

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
  _$$_CourtCopyWith<_$_Court> get copyWith =>
      throw _privateConstructorUsedError;
}
