// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ticket.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Ticket _$TicketFromJson(Map<String, dynamic> json) {
  return _Ticket.fromJson(json);
}

/// @nodoc
class _$TicketTearOff {
  const _$TicketTearOff();

  _Ticket call(
      {required String id,
      required String courtName,
      required CourtSlot courtSlot}) {
    return _Ticket(
      id: id,
      courtName: courtName,
      courtSlot: courtSlot,
    );
  }

  Ticket fromJson(Map<String, Object?> json) {
    return Ticket.fromJson(json);
  }
}

/// @nodoc
const $Ticket = _$TicketTearOff();

/// @nodoc
mixin _$Ticket {
  String get id => throw _privateConstructorUsedError;
  String get courtName => throw _privateConstructorUsedError;
  CourtSlot get courtSlot => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TicketCopyWith<Ticket> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketCopyWith<$Res> {
  factory $TicketCopyWith(Ticket value, $Res Function(Ticket) then) =
      _$TicketCopyWithImpl<$Res>;
  $Res call({String id, String courtName, CourtSlot courtSlot});

  $CourtSlotCopyWith<$Res> get courtSlot;
}

/// @nodoc
class _$TicketCopyWithImpl<$Res> implements $TicketCopyWith<$Res> {
  _$TicketCopyWithImpl(this._value, this._then);

  final Ticket _value;
  // ignore: unused_field
  final $Res Function(Ticket) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? courtName = freezed,
    Object? courtSlot = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      courtName: courtName == freezed
          ? _value.courtName
          : courtName // ignore: cast_nullable_to_non_nullable
              as String,
      courtSlot: courtSlot == freezed
          ? _value.courtSlot
          : courtSlot // ignore: cast_nullable_to_non_nullable
              as CourtSlot,
    ));
  }

  @override
  $CourtSlotCopyWith<$Res> get courtSlot {
    return $CourtSlotCopyWith<$Res>(_value.courtSlot, (value) {
      return _then(_value.copyWith(courtSlot: value));
    });
  }
}

/// @nodoc
abstract class _$TicketCopyWith<$Res> implements $TicketCopyWith<$Res> {
  factory _$TicketCopyWith(_Ticket value, $Res Function(_Ticket) then) =
      __$TicketCopyWithImpl<$Res>;
  @override
  $Res call({String id, String courtName, CourtSlot courtSlot});

  @override
  $CourtSlotCopyWith<$Res> get courtSlot;
}

/// @nodoc
class __$TicketCopyWithImpl<$Res> extends _$TicketCopyWithImpl<$Res>
    implements _$TicketCopyWith<$Res> {
  __$TicketCopyWithImpl(_Ticket _value, $Res Function(_Ticket) _then)
      : super(_value, (v) => _then(v as _Ticket));

  @override
  _Ticket get _value => super._value as _Ticket;

  @override
  $Res call({
    Object? id = freezed,
    Object? courtName = freezed,
    Object? courtSlot = freezed,
  }) {
    return _then(_Ticket(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      courtName: courtName == freezed
          ? _value.courtName
          : courtName // ignore: cast_nullable_to_non_nullable
              as String,
      courtSlot: courtSlot == freezed
          ? _value.courtSlot
          : courtSlot // ignore: cast_nullable_to_non_nullable
              as CourtSlot,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Ticket extends _Ticket with DiagnosticableTreeMixin {
  const _$_Ticket(
      {required this.id, required this.courtName, required this.courtSlot})
      : super._();

  factory _$_Ticket.fromJson(Map<String, dynamic> json) =>
      _$$_TicketFromJson(json);

  @override
  final String id;
  @override
  final String courtName;
  @override
  final CourtSlot courtSlot;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Ticket(id: $id, courtName: $courtName, courtSlot: $courtSlot)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Ticket'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('courtName', courtName))
      ..add(DiagnosticsProperty('courtSlot', courtSlot));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Ticket &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.courtName, courtName) &&
            const DeepCollectionEquality().equals(other.courtSlot, courtSlot));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(courtName),
      const DeepCollectionEquality().hash(courtSlot));

  @JsonKey(ignore: true)
  @override
  _$TicketCopyWith<_Ticket> get copyWith =>
      __$TicketCopyWithImpl<_Ticket>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TicketToJson(this);
  }
}

abstract class _Ticket extends Ticket {
  const factory _Ticket(
      {required String id,
      required String courtName,
      required CourtSlot courtSlot}) = _$_Ticket;
  const _Ticket._() : super._();

  factory _Ticket.fromJson(Map<String, dynamic> json) = _$_Ticket.fromJson;

  @override
  String get id;
  @override
  String get courtName;
  @override
  CourtSlot get courtSlot;
  @override
  @JsonKey(ignore: true)
  _$TicketCopyWith<_Ticket> get copyWith => throw _privateConstructorUsedError;
}
