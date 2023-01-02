// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kasado_user_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KasadoUserInfo _$KasadoUserInfoFromJson(Map<String, dynamic> json) {
  return _KasadoUserInfo.fromJson(json);
}

/// @nodoc
mixin _$KasadoUserInfo {
  String get id => throw _privateConstructorUsedError;
  KasadoUser get user => throw _privateConstructorUsedError;
  bool get isAdmin => throw _privateConstructorUsedError;
  bool get isSuperAdmin => throw _privateConstructorUsedError;
  double get pondo => throw _privateConstructorUsedError;
  bool get isTeamCaptain => throw _privateConstructorUsedError;
  OverviewStats get overviewStats => throw _privateConstructorUsedError;
  String? get teamId => throw _privateConstructorUsedError;
  List<Ticket> get tickets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KasadoUserInfoCopyWith<KasadoUserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KasadoUserInfoCopyWith<$Res> {
  factory $KasadoUserInfoCopyWith(
          KasadoUserInfo value, $Res Function(KasadoUserInfo) then) =
      _$KasadoUserInfoCopyWithImpl<$Res, KasadoUserInfo>;
  @useResult
  $Res call(
      {String id,
      KasadoUser user,
      bool isAdmin,
      bool isSuperAdmin,
      double pondo,
      bool isTeamCaptain,
      OverviewStats overviewStats,
      String? teamId,
      List<Ticket> tickets});

  $KasadoUserCopyWith<$Res> get user;
  $OverviewStatsCopyWith<$Res> get overviewStats;
}

/// @nodoc
class _$KasadoUserInfoCopyWithImpl<$Res, $Val extends KasadoUserInfo>
    implements $KasadoUserInfoCopyWith<$Res> {
  _$KasadoUserInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? isAdmin = null,
    Object? isSuperAdmin = null,
    Object? pondo = null,
    Object? isTeamCaptain = null,
    Object? overviewStats = null,
    Object? teamId = freezed,
    Object? tickets = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as KasadoUser,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuperAdmin: null == isSuperAdmin
          ? _value.isSuperAdmin
          : isSuperAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      pondo: null == pondo
          ? _value.pondo
          : pondo // ignore: cast_nullable_to_non_nullable
              as double,
      isTeamCaptain: null == isTeamCaptain
          ? _value.isTeamCaptain
          : isTeamCaptain // ignore: cast_nullable_to_non_nullable
              as bool,
      overviewStats: null == overviewStats
          ? _value.overviewStats
          : overviewStats // ignore: cast_nullable_to_non_nullable
              as OverviewStats,
      teamId: freezed == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String?,
      tickets: null == tickets
          ? _value.tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<Ticket>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $KasadoUserCopyWith<$Res> get user {
    return $KasadoUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OverviewStatsCopyWith<$Res> get overviewStats {
    return $OverviewStatsCopyWith<$Res>(_value.overviewStats, (value) {
      return _then(_value.copyWith(overviewStats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_KasadoUserInfoCopyWith<$Res>
    implements $KasadoUserInfoCopyWith<$Res> {
  factory _$$_KasadoUserInfoCopyWith(
          _$_KasadoUserInfo value, $Res Function(_$_KasadoUserInfo) then) =
      __$$_KasadoUserInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      KasadoUser user,
      bool isAdmin,
      bool isSuperAdmin,
      double pondo,
      bool isTeamCaptain,
      OverviewStats overviewStats,
      String? teamId,
      List<Ticket> tickets});

  @override
  $KasadoUserCopyWith<$Res> get user;
  @override
  $OverviewStatsCopyWith<$Res> get overviewStats;
}

/// @nodoc
class __$$_KasadoUserInfoCopyWithImpl<$Res>
    extends _$KasadoUserInfoCopyWithImpl<$Res, _$_KasadoUserInfo>
    implements _$$_KasadoUserInfoCopyWith<$Res> {
  __$$_KasadoUserInfoCopyWithImpl(
      _$_KasadoUserInfo _value, $Res Function(_$_KasadoUserInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? isAdmin = null,
    Object? isSuperAdmin = null,
    Object? pondo = null,
    Object? isTeamCaptain = null,
    Object? overviewStats = null,
    Object? teamId = freezed,
    Object? tickets = null,
  }) {
    return _then(_$_KasadoUserInfo(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as KasadoUser,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuperAdmin: null == isSuperAdmin
          ? _value.isSuperAdmin
          : isSuperAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      pondo: null == pondo
          ? _value.pondo
          : pondo // ignore: cast_nullable_to_non_nullable
              as double,
      isTeamCaptain: null == isTeamCaptain
          ? _value.isTeamCaptain
          : isTeamCaptain // ignore: cast_nullable_to_non_nullable
              as bool,
      overviewStats: null == overviewStats
          ? _value.overviewStats
          : overviewStats // ignore: cast_nullable_to_non_nullable
              as OverviewStats,
      teamId: freezed == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String?,
      tickets: null == tickets
          ? _value._tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<Ticket>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KasadoUserInfo extends _KasadoUserInfo with DiagnosticableTreeMixin {
  const _$_KasadoUserInfo(
      {required this.id,
      required this.user,
      this.isAdmin = false,
      this.isSuperAdmin = false,
      this.pondo = 0,
      this.isTeamCaptain = false,
      this.overviewStats = const OverviewStats(),
      this.teamId,
      final List<Ticket> tickets = const []})
      : _tickets = tickets,
        super._();

  factory _$_KasadoUserInfo.fromJson(Map<String, dynamic> json) =>
      _$$_KasadoUserInfoFromJson(json);

  @override
  final String id;
  @override
  final KasadoUser user;
  @override
  @JsonKey()
  final bool isAdmin;
  @override
  @JsonKey()
  final bool isSuperAdmin;
  @override
  @JsonKey()
  final double pondo;
  @override
  @JsonKey()
  final bool isTeamCaptain;
  @override
  @JsonKey()
  final OverviewStats overviewStats;
  @override
  final String? teamId;
  final List<Ticket> _tickets;
  @override
  @JsonKey()
  List<Ticket> get tickets {
    if (_tickets is EqualUnmodifiableListView) return _tickets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tickets);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'KasadoUserInfo(id: $id, user: $user, isAdmin: $isAdmin, isSuperAdmin: $isSuperAdmin, pondo: $pondo, isTeamCaptain: $isTeamCaptain, overviewStats: $overviewStats, teamId: $teamId, tickets: $tickets)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'KasadoUserInfo'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('isAdmin', isAdmin))
      ..add(DiagnosticsProperty('isSuperAdmin', isSuperAdmin))
      ..add(DiagnosticsProperty('pondo', pondo))
      ..add(DiagnosticsProperty('isTeamCaptain', isTeamCaptain))
      ..add(DiagnosticsProperty('overviewStats', overviewStats))
      ..add(DiagnosticsProperty('teamId', teamId))
      ..add(DiagnosticsProperty('tickets', tickets));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KasadoUserInfo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin) &&
            (identical(other.isSuperAdmin, isSuperAdmin) ||
                other.isSuperAdmin == isSuperAdmin) &&
            (identical(other.pondo, pondo) || other.pondo == pondo) &&
            (identical(other.isTeamCaptain, isTeamCaptain) ||
                other.isTeamCaptain == isTeamCaptain) &&
            (identical(other.overviewStats, overviewStats) ||
                other.overviewStats == overviewStats) &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            const DeepCollectionEquality().equals(other._tickets, _tickets));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      user,
      isAdmin,
      isSuperAdmin,
      pondo,
      isTeamCaptain,
      overviewStats,
      teamId,
      const DeepCollectionEquality().hash(_tickets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KasadoUserInfoCopyWith<_$_KasadoUserInfo> get copyWith =>
      __$$_KasadoUserInfoCopyWithImpl<_$_KasadoUserInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KasadoUserInfoToJson(
      this,
    );
  }
}

abstract class _KasadoUserInfo extends KasadoUserInfo {
  const factory _KasadoUserInfo(
      {required final String id,
      required final KasadoUser user,
      final bool isAdmin,
      final bool isSuperAdmin,
      final double pondo,
      final bool isTeamCaptain,
      final OverviewStats overviewStats,
      final String? teamId,
      final List<Ticket> tickets}) = _$_KasadoUserInfo;
  const _KasadoUserInfo._() : super._();

  factory _KasadoUserInfo.fromJson(Map<String, dynamic> json) =
      _$_KasadoUserInfo.fromJson;

  @override
  String get id;
  @override
  KasadoUser get user;
  @override
  bool get isAdmin;
  @override
  bool get isSuperAdmin;
  @override
  double get pondo;
  @override
  bool get isTeamCaptain;
  @override
  OverviewStats get overviewStats;
  @override
  String? get teamId;
  @override
  List<Ticket> get tickets;
  @override
  @JsonKey(ignore: true)
  _$$_KasadoUserInfoCopyWith<_$_KasadoUserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
