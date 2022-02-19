// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'kasado_user_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KasadoUserInfo _$KasadoUserInfoFromJson(Map<String, dynamic> json) {
  return _KasadoUserInfo.fromJson(json);
}

/// @nodoc
class _$KasadoUserInfoTearOff {
  const _$KasadoUserInfoTearOff();

  _KasadoUserInfo call(
      {required String id,
      required KasadoUser user,
      bool isAdmin = false,
      bool isReserved = false}) {
    return _KasadoUserInfo(
      id: id,
      user: user,
      isAdmin: isAdmin,
      isReserved: isReserved,
    );
  }

  KasadoUserInfo fromJson(Map<String, Object?> json) {
    return KasadoUserInfo.fromJson(json);
  }
}

/// @nodoc
const $KasadoUserInfo = _$KasadoUserInfoTearOff();

/// @nodoc
mixin _$KasadoUserInfo {
  String get id => throw _privateConstructorUsedError;
  KasadoUser get user => throw _privateConstructorUsedError;
  bool get isAdmin => throw _privateConstructorUsedError;
  bool get isReserved => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KasadoUserInfoCopyWith<KasadoUserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KasadoUserInfoCopyWith<$Res> {
  factory $KasadoUserInfoCopyWith(
          KasadoUserInfo value, $Res Function(KasadoUserInfo) then) =
      _$KasadoUserInfoCopyWithImpl<$Res>;
  $Res call({String id, KasadoUser user, bool isAdmin, bool isReserved});

  $KasadoUserCopyWith<$Res> get user;
}

/// @nodoc
class _$KasadoUserInfoCopyWithImpl<$Res>
    implements $KasadoUserInfoCopyWith<$Res> {
  _$KasadoUserInfoCopyWithImpl(this._value, this._then);

  final KasadoUserInfo _value;
  // ignore: unused_field
  final $Res Function(KasadoUserInfo) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? isAdmin = freezed,
    Object? isReserved = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as KasadoUser,
      isAdmin: isAdmin == freezed
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      isReserved: isReserved == freezed
          ? _value.isReserved
          : isReserved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $KasadoUserCopyWith<$Res> get user {
    return $KasadoUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$KasadoUserInfoCopyWith<$Res>
    implements $KasadoUserInfoCopyWith<$Res> {
  factory _$KasadoUserInfoCopyWith(
          _KasadoUserInfo value, $Res Function(_KasadoUserInfo) then) =
      __$KasadoUserInfoCopyWithImpl<$Res>;
  @override
  $Res call({String id, KasadoUser user, bool isAdmin, bool isReserved});

  @override
  $KasadoUserCopyWith<$Res> get user;
}

/// @nodoc
class __$KasadoUserInfoCopyWithImpl<$Res>
    extends _$KasadoUserInfoCopyWithImpl<$Res>
    implements _$KasadoUserInfoCopyWith<$Res> {
  __$KasadoUserInfoCopyWithImpl(
      _KasadoUserInfo _value, $Res Function(_KasadoUserInfo) _then)
      : super(_value, (v) => _then(v as _KasadoUserInfo));

  @override
  _KasadoUserInfo get _value => super._value as _KasadoUserInfo;

  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? isAdmin = freezed,
    Object? isReserved = freezed,
  }) {
    return _then(_KasadoUserInfo(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as KasadoUser,
      isAdmin: isAdmin == freezed
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      isReserved: isReserved == freezed
          ? _value.isReserved
          : isReserved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KasadoUserInfo
    with DiagnosticableTreeMixin
    implements _KasadoUserInfo {
  const _$_KasadoUserInfo(
      {required this.id,
      required this.user,
      this.isAdmin = false,
      this.isReserved = false});

  factory _$_KasadoUserInfo.fromJson(Map<String, dynamic> json) =>
      _$$_KasadoUserInfoFromJson(json);

  @override
  final String id;
  @override
  final KasadoUser user;
  @JsonKey()
  @override
  final bool isAdmin;
  @JsonKey()
  @override
  final bool isReserved;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'KasadoUserInfo(id: $id, user: $user, isAdmin: $isAdmin, isReserved: $isReserved)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'KasadoUserInfo'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('isAdmin', isAdmin))
      ..add(DiagnosticsProperty('isReserved', isReserved));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KasadoUserInfo &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.isAdmin, isAdmin) &&
            const DeepCollectionEquality()
                .equals(other.isReserved, isReserved));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(isAdmin),
      const DeepCollectionEquality().hash(isReserved));

  @JsonKey(ignore: true)
  @override
  _$KasadoUserInfoCopyWith<_KasadoUserInfo> get copyWith =>
      __$KasadoUserInfoCopyWithImpl<_KasadoUserInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KasadoUserInfoToJson(this);
  }
}

abstract class _KasadoUserInfo implements KasadoUserInfo {
  const factory _KasadoUserInfo(
      {required String id,
      required KasadoUser user,
      bool isAdmin,
      bool isReserved}) = _$_KasadoUserInfo;

  factory _KasadoUserInfo.fromJson(Map<String, dynamic> json) =
      _$_KasadoUserInfo.fromJson;

  @override
  String get id;
  @override
  KasadoUser get user;
  @override
  bool get isAdmin;
  @override
  bool get isReserved;
  @override
  @JsonKey(ignore: true)
  _$KasadoUserInfoCopyWith<_KasadoUserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
