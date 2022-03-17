// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'kasado_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KasadoUser _$KasadoUserFromJson(Map<String, dynamic> json) {
  return _KasadoUser.fromJson(json);
}

/// @nodoc
class _$KasadoUserTearOff {
  const _$KasadoUserTearOff();

  _KasadoUser call(
      {required String id,
      String? displayName,
      String? email,
      String? phoneNumber,
      String? photoUrl,
      String teamName = '',
      bool hasPaid = false,
      int mvpVoteCount = 0,
      String votedMvpId = ''}) {
    return _KasadoUser(
      id: id,
      displayName: displayName,
      email: email,
      phoneNumber: phoneNumber,
      photoUrl: photoUrl,
      teamName: teamName,
      hasPaid: hasPaid,
      mvpVoteCount: mvpVoteCount,
      votedMvpId: votedMvpId,
    );
  }

  KasadoUser fromJson(Map<String, Object?> json) {
    return KasadoUser.fromJson(json);
  }
}

/// @nodoc
const $KasadoUser = _$KasadoUserTearOff();

/// @nodoc
mixin _$KasadoUser {
  String get id => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  String get teamName => throw _privateConstructorUsedError;
  bool get hasPaid => throw _privateConstructorUsedError;
  int get mvpVoteCount => throw _privateConstructorUsedError;
  String get votedMvpId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KasadoUserCopyWith<KasadoUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KasadoUserCopyWith<$Res> {
  factory $KasadoUserCopyWith(
          KasadoUser value, $Res Function(KasadoUser) then) =
      _$KasadoUserCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String? displayName,
      String? email,
      String? phoneNumber,
      String? photoUrl,
      String teamName,
      bool hasPaid,
      int mvpVoteCount,
      String votedMvpId});
}

/// @nodoc
class _$KasadoUserCopyWithImpl<$Res> implements $KasadoUserCopyWith<$Res> {
  _$KasadoUserCopyWithImpl(this._value, this._then);

  final KasadoUser _value;
  // ignore: unused_field
  final $Res Function(KasadoUser) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? displayName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? photoUrl = freezed,
    Object? teamName = freezed,
    Object? hasPaid = freezed,
    Object? mvpVoteCount = freezed,
    Object? votedMvpId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      teamName: teamName == freezed
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as String,
      hasPaid: hasPaid == freezed
          ? _value.hasPaid
          : hasPaid // ignore: cast_nullable_to_non_nullable
              as bool,
      mvpVoteCount: mvpVoteCount == freezed
          ? _value.mvpVoteCount
          : mvpVoteCount // ignore: cast_nullable_to_non_nullable
              as int,
      votedMvpId: votedMvpId == freezed
          ? _value.votedMvpId
          : votedMvpId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$KasadoUserCopyWith<$Res> implements $KasadoUserCopyWith<$Res> {
  factory _$KasadoUserCopyWith(
          _KasadoUser value, $Res Function(_KasadoUser) then) =
      __$KasadoUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String? displayName,
      String? email,
      String? phoneNumber,
      String? photoUrl,
      String teamName,
      bool hasPaid,
      int mvpVoteCount,
      String votedMvpId});
}

/// @nodoc
class __$KasadoUserCopyWithImpl<$Res> extends _$KasadoUserCopyWithImpl<$Res>
    implements _$KasadoUserCopyWith<$Res> {
  __$KasadoUserCopyWithImpl(
      _KasadoUser _value, $Res Function(_KasadoUser) _then)
      : super(_value, (v) => _then(v as _KasadoUser));

  @override
  _KasadoUser get _value => super._value as _KasadoUser;

  @override
  $Res call({
    Object? id = freezed,
    Object? displayName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? photoUrl = freezed,
    Object? teamName = freezed,
    Object? hasPaid = freezed,
    Object? mvpVoteCount = freezed,
    Object? votedMvpId = freezed,
  }) {
    return _then(_KasadoUser(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      teamName: teamName == freezed
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as String,
      hasPaid: hasPaid == freezed
          ? _value.hasPaid
          : hasPaid // ignore: cast_nullable_to_non_nullable
              as bool,
      mvpVoteCount: mvpVoteCount == freezed
          ? _value.mvpVoteCount
          : mvpVoteCount // ignore: cast_nullable_to_non_nullable
              as int,
      votedMvpId: votedMvpId == freezed
          ? _value.votedMvpId
          : votedMvpId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KasadoUser extends _KasadoUser with DiagnosticableTreeMixin {
  const _$_KasadoUser(
      {required this.id,
      this.displayName,
      this.email,
      this.phoneNumber,
      this.photoUrl,
      this.teamName = '',
      this.hasPaid = false,
      this.mvpVoteCount = 0,
      this.votedMvpId = ''})
      : super._();

  factory _$_KasadoUser.fromJson(Map<String, dynamic> json) =>
      _$$_KasadoUserFromJson(json);

  @override
  final String id;
  @override
  final String? displayName;
  @override
  final String? email;
  @override
  final String? phoneNumber;
  @override
  final String? photoUrl;
  @JsonKey()
  @override
  final String teamName;
  @JsonKey()
  @override
  final bool hasPaid;
  @JsonKey()
  @override
  final int mvpVoteCount;
  @JsonKey()
  @override
  final String votedMvpId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'KasadoUser(id: $id, displayName: $displayName, email: $email, phoneNumber: $phoneNumber, photoUrl: $photoUrl, teamName: $teamName, hasPaid: $hasPaid, mvpVoteCount: $mvpVoteCount, votedMvpId: $votedMvpId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'KasadoUser'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('displayName', displayName))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('phoneNumber', phoneNumber))
      ..add(DiagnosticsProperty('photoUrl', photoUrl))
      ..add(DiagnosticsProperty('teamName', teamName))
      ..add(DiagnosticsProperty('hasPaid', hasPaid))
      ..add(DiagnosticsProperty('mvpVoteCount', mvpVoteCount))
      ..add(DiagnosticsProperty('votedMvpId', votedMvpId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KasadoUser &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.displayName, displayName) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.photoUrl, photoUrl) &&
            const DeepCollectionEquality().equals(other.teamName, teamName) &&
            const DeepCollectionEquality().equals(other.hasPaid, hasPaid) &&
            const DeepCollectionEquality()
                .equals(other.mvpVoteCount, mvpVoteCount) &&
            const DeepCollectionEquality()
                .equals(other.votedMvpId, votedMvpId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(displayName),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(photoUrl),
      const DeepCollectionEquality().hash(teamName),
      const DeepCollectionEquality().hash(hasPaid),
      const DeepCollectionEquality().hash(mvpVoteCount),
      const DeepCollectionEquality().hash(votedMvpId));

  @JsonKey(ignore: true)
  @override
  _$KasadoUserCopyWith<_KasadoUser> get copyWith =>
      __$KasadoUserCopyWithImpl<_KasadoUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KasadoUserToJson(this);
  }
}

abstract class _KasadoUser extends KasadoUser {
  const factory _KasadoUser(
      {required String id,
      String? displayName,
      String? email,
      String? phoneNumber,
      String? photoUrl,
      String teamName,
      bool hasPaid,
      int mvpVoteCount,
      String votedMvpId}) = _$_KasadoUser;
  const _KasadoUser._() : super._();

  factory _KasadoUser.fromJson(Map<String, dynamic> json) =
      _$_KasadoUser.fromJson;

  @override
  String get id;
  @override
  String? get displayName;
  @override
  String? get email;
  @override
  String? get phoneNumber;
  @override
  String? get photoUrl;
  @override
  String get teamName;
  @override
  bool get hasPaid;
  @override
  int get mvpVoteCount;
  @override
  String get votedMvpId;
  @override
  @JsonKey(ignore: true)
  _$KasadoUserCopyWith<_KasadoUser> get copyWith =>
      throw _privateConstructorUsedError;
}
