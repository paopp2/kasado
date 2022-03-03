// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notif.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Notif _$NotifFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return NotifInfo.fromJson(json);
    case 'ref':
      return NotifRef.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Notif',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
class _$NotifTearOff {
  const _$NotifTearOff();

  NotifInfo call(
      {required String id,
      String title = '',
      required String body,
      int yesCount = 0,
      int noCount = 0,
      KasadoUser? sender,
      bool sendToAll = false,
      bool getFeedback = false,
      List<String> recipientIds = const [],
      bool isRead = false,
      required DateTime sentAt}) {
    return NotifInfo(
      id: id,
      title: title,
      body: body,
      yesCount: yesCount,
      noCount: noCount,
      sender: sender,
      sendToAll: sendToAll,
      getFeedback: getFeedback,
      recipientIds: recipientIds,
      isRead: isRead,
      sentAt: sentAt,
    );
  }

  NotifRef ref(
      {required String id, bool isRead = false, required DateTime sentAt}) {
    return NotifRef(
      id: id,
      isRead: isRead,
      sentAt: sentAt,
    );
  }

  Notif fromJson(Map<String, Object?> json) {
    return Notif.fromJson(json);
  }
}

/// @nodoc
const $Notif = _$NotifTearOff();

/// @nodoc
mixin _$Notif {
  String get id => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;
  DateTime get sentAt => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String title,
            String body,
            int yesCount,
            int noCount,
            KasadoUser? sender,
            bool sendToAll,
            bool getFeedback,
            List<String> recipientIds,
            bool isRead,
            DateTime sentAt)
        $default, {
    required TResult Function(String id, bool isRead, DateTime sentAt) ref,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            String id,
            String title,
            String body,
            int yesCount,
            int noCount,
            KasadoUser? sender,
            bool sendToAll,
            bool getFeedback,
            List<String> recipientIds,
            bool isRead,
            DateTime sentAt)?
        $default, {
    TResult Function(String id, bool isRead, DateTime sentAt)? ref,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String title,
            String body,
            int yesCount,
            int noCount,
            KasadoUser? sender,
            bool sendToAll,
            bool getFeedback,
            List<String> recipientIds,
            bool isRead,
            DateTime sentAt)?
        $default, {
    TResult Function(String id, bool isRead, DateTime sentAt)? ref,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(NotifInfo value) $default, {
    required TResult Function(NotifRef value) ref,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(NotifInfo value)? $default, {
    TResult Function(NotifRef value)? ref,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(NotifInfo value)? $default, {
    TResult Function(NotifRef value)? ref,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotifCopyWith<Notif> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotifCopyWith<$Res> {
  factory $NotifCopyWith(Notif value, $Res Function(Notif) then) =
      _$NotifCopyWithImpl<$Res>;
  $Res call({String id, bool isRead, DateTime sentAt});
}

/// @nodoc
class _$NotifCopyWithImpl<$Res> implements $NotifCopyWith<$Res> {
  _$NotifCopyWithImpl(this._value, this._then);

  final Notif _value;
  // ignore: unused_field
  final $Res Function(Notif) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? isRead = freezed,
    Object? sentAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isRead: isRead == freezed
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      sentAt: sentAt == freezed
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class $NotifInfoCopyWith<$Res> implements $NotifCopyWith<$Res> {
  factory $NotifInfoCopyWith(NotifInfo value, $Res Function(NotifInfo) then) =
      _$NotifInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String title,
      String body,
      int yesCount,
      int noCount,
      KasadoUser? sender,
      bool sendToAll,
      bool getFeedback,
      List<String> recipientIds,
      bool isRead,
      DateTime sentAt});

  $KasadoUserCopyWith<$Res>? get sender;
}

/// @nodoc
class _$NotifInfoCopyWithImpl<$Res> extends _$NotifCopyWithImpl<$Res>
    implements $NotifInfoCopyWith<$Res> {
  _$NotifInfoCopyWithImpl(NotifInfo _value, $Res Function(NotifInfo) _then)
      : super(_value, (v) => _then(v as NotifInfo));

  @override
  NotifInfo get _value => super._value as NotifInfo;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? yesCount = freezed,
    Object? noCount = freezed,
    Object? sender = freezed,
    Object? sendToAll = freezed,
    Object? getFeedback = freezed,
    Object? recipientIds = freezed,
    Object? isRead = freezed,
    Object? sentAt = freezed,
  }) {
    return _then(NotifInfo(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      yesCount: yesCount == freezed
          ? _value.yesCount
          : yesCount // ignore: cast_nullable_to_non_nullable
              as int,
      noCount: noCount == freezed
          ? _value.noCount
          : noCount // ignore: cast_nullable_to_non_nullable
              as int,
      sender: sender == freezed
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as KasadoUser?,
      sendToAll: sendToAll == freezed
          ? _value.sendToAll
          : sendToAll // ignore: cast_nullable_to_non_nullable
              as bool,
      getFeedback: getFeedback == freezed
          ? _value.getFeedback
          : getFeedback // ignore: cast_nullable_to_non_nullable
              as bool,
      recipientIds: recipientIds == freezed
          ? _value.recipientIds
          : recipientIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isRead: isRead == freezed
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      sentAt: sentAt == freezed
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  $KasadoUserCopyWith<$Res>? get sender {
    if (_value.sender == null) {
      return null;
    }

    return $KasadoUserCopyWith<$Res>(_value.sender!, (value) {
      return _then(_value.copyWith(sender: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$NotifInfo with DiagnosticableTreeMixin implements NotifInfo {
  const _$NotifInfo(
      {required this.id,
      this.title = '',
      required this.body,
      this.yesCount = 0,
      this.noCount = 0,
      this.sender,
      this.sendToAll = false,
      this.getFeedback = false,
      this.recipientIds = const [],
      this.isRead = false,
      required this.sentAt,
      String? $type})
      : $type = $type ?? 'default';

  factory _$NotifInfo.fromJson(Map<String, dynamic> json) =>
      _$$NotifInfoFromJson(json);

  @override
  final String id;
  @JsonKey()
  @override
  final String title;
  @override
  final String body;
  @JsonKey()
  @override
  final int yesCount;
  @JsonKey()
  @override
  final int noCount;
  @override
  final KasadoUser? sender;
  @JsonKey()
  @override
  final bool sendToAll;
  @JsonKey()
  @override
  final bool getFeedback;
  @JsonKey()
  @override
  final List<String> recipientIds;
  @JsonKey()
  @override
  final bool isRead;
  @override
  final DateTime sentAt;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Notif(id: $id, title: $title, body: $body, yesCount: $yesCount, noCount: $noCount, sender: $sender, sendToAll: $sendToAll, getFeedback: $getFeedback, recipientIds: $recipientIds, isRead: $isRead, sentAt: $sentAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Notif'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('body', body))
      ..add(DiagnosticsProperty('yesCount', yesCount))
      ..add(DiagnosticsProperty('noCount', noCount))
      ..add(DiagnosticsProperty('sender', sender))
      ..add(DiagnosticsProperty('sendToAll', sendToAll))
      ..add(DiagnosticsProperty('getFeedback', getFeedback))
      ..add(DiagnosticsProperty('recipientIds', recipientIds))
      ..add(DiagnosticsProperty('isRead', isRead))
      ..add(DiagnosticsProperty('sentAt', sentAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotifInfo &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.body, body) &&
            const DeepCollectionEquality().equals(other.yesCount, yesCount) &&
            const DeepCollectionEquality().equals(other.noCount, noCount) &&
            const DeepCollectionEquality().equals(other.sender, sender) &&
            const DeepCollectionEquality().equals(other.sendToAll, sendToAll) &&
            const DeepCollectionEquality()
                .equals(other.getFeedback, getFeedback) &&
            const DeepCollectionEquality()
                .equals(other.recipientIds, recipientIds) &&
            const DeepCollectionEquality().equals(other.isRead, isRead) &&
            const DeepCollectionEquality().equals(other.sentAt, sentAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(yesCount),
      const DeepCollectionEquality().hash(noCount),
      const DeepCollectionEquality().hash(sender),
      const DeepCollectionEquality().hash(sendToAll),
      const DeepCollectionEquality().hash(getFeedback),
      const DeepCollectionEquality().hash(recipientIds),
      const DeepCollectionEquality().hash(isRead),
      const DeepCollectionEquality().hash(sentAt));

  @JsonKey(ignore: true)
  @override
  $NotifInfoCopyWith<NotifInfo> get copyWith =>
      _$NotifInfoCopyWithImpl<NotifInfo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String title,
            String body,
            int yesCount,
            int noCount,
            KasadoUser? sender,
            bool sendToAll,
            bool getFeedback,
            List<String> recipientIds,
            bool isRead,
            DateTime sentAt)
        $default, {
    required TResult Function(String id, bool isRead, DateTime sentAt) ref,
  }) {
    return $default(id, title, body, yesCount, noCount, sender, sendToAll,
        getFeedback, recipientIds, isRead, sentAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            String id,
            String title,
            String body,
            int yesCount,
            int noCount,
            KasadoUser? sender,
            bool sendToAll,
            bool getFeedback,
            List<String> recipientIds,
            bool isRead,
            DateTime sentAt)?
        $default, {
    TResult Function(String id, bool isRead, DateTime sentAt)? ref,
  }) {
    return $default?.call(id, title, body, yesCount, noCount, sender, sendToAll,
        getFeedback, recipientIds, isRead, sentAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String title,
            String body,
            int yesCount,
            int noCount,
            KasadoUser? sender,
            bool sendToAll,
            bool getFeedback,
            List<String> recipientIds,
            bool isRead,
            DateTime sentAt)?
        $default, {
    TResult Function(String id, bool isRead, DateTime sentAt)? ref,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, title, body, yesCount, noCount, sender, sendToAll,
          getFeedback, recipientIds, isRead, sentAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(NotifInfo value) $default, {
    required TResult Function(NotifRef value) ref,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(NotifInfo value)? $default, {
    TResult Function(NotifRef value)? ref,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(NotifInfo value)? $default, {
    TResult Function(NotifRef value)? ref,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NotifInfoToJson(this);
  }
}

abstract class NotifInfo implements Notif {
  const factory NotifInfo(
      {required String id,
      String title,
      required String body,
      int yesCount,
      int noCount,
      KasadoUser? sender,
      bool sendToAll,
      bool getFeedback,
      List<String> recipientIds,
      bool isRead,
      required DateTime sentAt}) = _$NotifInfo;

  factory NotifInfo.fromJson(Map<String, dynamic> json) = _$NotifInfo.fromJson;

  @override
  String get id;
  String get title;
  String get body;
  int get yesCount;
  int get noCount;
  KasadoUser? get sender;
  bool get sendToAll;
  bool get getFeedback;
  List<String> get recipientIds;
  @override
  bool get isRead;
  @override
  DateTime get sentAt;
  @override
  @JsonKey(ignore: true)
  $NotifInfoCopyWith<NotifInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotifRefCopyWith<$Res> implements $NotifCopyWith<$Res> {
  factory $NotifRefCopyWith(NotifRef value, $Res Function(NotifRef) then) =
      _$NotifRefCopyWithImpl<$Res>;
  @override
  $Res call({String id, bool isRead, DateTime sentAt});
}

/// @nodoc
class _$NotifRefCopyWithImpl<$Res> extends _$NotifCopyWithImpl<$Res>
    implements $NotifRefCopyWith<$Res> {
  _$NotifRefCopyWithImpl(NotifRef _value, $Res Function(NotifRef) _then)
      : super(_value, (v) => _then(v as NotifRef));

  @override
  NotifRef get _value => super._value as NotifRef;

  @override
  $Res call({
    Object? id = freezed,
    Object? isRead = freezed,
    Object? sentAt = freezed,
  }) {
    return _then(NotifRef(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isRead: isRead == freezed
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      sentAt: sentAt == freezed
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotifRef with DiagnosticableTreeMixin implements NotifRef {
  const _$NotifRef(
      {required this.id,
      this.isRead = false,
      required this.sentAt,
      String? $type})
      : $type = $type ?? 'ref';

  factory _$NotifRef.fromJson(Map<String, dynamic> json) =>
      _$$NotifRefFromJson(json);

  @override
  final String id;
  @JsonKey()
  @override
  final bool isRead;
  @override
  final DateTime sentAt;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Notif.ref(id: $id, isRead: $isRead, sentAt: $sentAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Notif.ref'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('isRead', isRead))
      ..add(DiagnosticsProperty('sentAt', sentAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotifRef &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.isRead, isRead) &&
            const DeepCollectionEquality().equals(other.sentAt, sentAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(isRead),
      const DeepCollectionEquality().hash(sentAt));

  @JsonKey(ignore: true)
  @override
  $NotifRefCopyWith<NotifRef> get copyWith =>
      _$NotifRefCopyWithImpl<NotifRef>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String title,
            String body,
            int yesCount,
            int noCount,
            KasadoUser? sender,
            bool sendToAll,
            bool getFeedback,
            List<String> recipientIds,
            bool isRead,
            DateTime sentAt)
        $default, {
    required TResult Function(String id, bool isRead, DateTime sentAt) ref,
  }) {
    return ref(id, isRead, sentAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            String id,
            String title,
            String body,
            int yesCount,
            int noCount,
            KasadoUser? sender,
            bool sendToAll,
            bool getFeedback,
            List<String> recipientIds,
            bool isRead,
            DateTime sentAt)?
        $default, {
    TResult Function(String id, bool isRead, DateTime sentAt)? ref,
  }) {
    return ref?.call(id, isRead, sentAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String title,
            String body,
            int yesCount,
            int noCount,
            KasadoUser? sender,
            bool sendToAll,
            bool getFeedback,
            List<String> recipientIds,
            bool isRead,
            DateTime sentAt)?
        $default, {
    TResult Function(String id, bool isRead, DateTime sentAt)? ref,
    required TResult orElse(),
  }) {
    if (ref != null) {
      return ref(id, isRead, sentAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(NotifInfo value) $default, {
    required TResult Function(NotifRef value) ref,
  }) {
    return ref(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(NotifInfo value)? $default, {
    TResult Function(NotifRef value)? ref,
  }) {
    return ref?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(NotifInfo value)? $default, {
    TResult Function(NotifRef value)? ref,
    required TResult orElse(),
  }) {
    if (ref != null) {
      return ref(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NotifRefToJson(this);
  }
}

abstract class NotifRef implements Notif {
  const factory NotifRef(
      {required String id, bool isRead, required DateTime sentAt}) = _$NotifRef;

  factory NotifRef.fromJson(Map<String, dynamic> json) = _$NotifRef.fromJson;

  @override
  String get id;
  @override
  bool get isRead;
  @override
  DateTime get sentAt;
  @override
  @JsonKey(ignore: true)
  $NotifRefCopyWith<NotifRef> get copyWith =>
      throw _privateConstructorUsedError;
}
