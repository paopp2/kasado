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
      return NotifObject.fromJson(json);
    case 'meta':
      return NotifMeta.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Notif',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
class _$NotifTearOff {
  const _$NotifTearOff();

  NotifObject call(
      {required String id,
      String title = '',
      required String body,
      KasadoUser? sender,
      required DateTime sentAt,
      bool needsFeedback = false,
      bool isRead = false}) {
    return NotifObject(
      id: id,
      title: title,
      body: body,
      sender: sender,
      sentAt: sentAt,
      needsFeedback: needsFeedback,
      isRead: isRead,
    );
  }

  NotifMeta meta(
      {required String id,
      required DateTime sentAt,
      int yesCount = 0,
      int noCount = 0}) {
    return NotifMeta(
      id: id,
      sentAt: sentAt,
      yesCount: yesCount,
      noCount: noCount,
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
  DateTime get sentAt => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String title, String body, KasadoUser? sender,
            DateTime sentAt, bool needsFeedback, bool isRead)
        $default, {
    required TResult Function(
            String id, DateTime sentAt, int yesCount, int noCount)
        meta,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String id, String title, String body, KasadoUser? sender,
            DateTime sentAt, bool needsFeedback, bool isRead)?
        $default, {
    TResult Function(String id, DateTime sentAt, int yesCount, int noCount)?
        meta,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String title, String body, KasadoUser? sender,
            DateTime sentAt, bool needsFeedback, bool isRead)?
        $default, {
    TResult Function(String id, DateTime sentAt, int yesCount, int noCount)?
        meta,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(NotifObject value) $default, {
    required TResult Function(NotifMeta value) meta,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(NotifObject value)? $default, {
    TResult Function(NotifMeta value)? meta,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(NotifObject value)? $default, {
    TResult Function(NotifMeta value)? meta,
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
  $Res call({String id, DateTime sentAt});
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
    Object? sentAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sentAt: sentAt == freezed
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class $NotifObjectCopyWith<$Res> implements $NotifCopyWith<$Res> {
  factory $NotifObjectCopyWith(
          NotifObject value, $Res Function(NotifObject) then) =
      _$NotifObjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String title,
      String body,
      KasadoUser? sender,
      DateTime sentAt,
      bool needsFeedback,
      bool isRead});

  $KasadoUserCopyWith<$Res>? get sender;
}

/// @nodoc
class _$NotifObjectCopyWithImpl<$Res> extends _$NotifCopyWithImpl<$Res>
    implements $NotifObjectCopyWith<$Res> {
  _$NotifObjectCopyWithImpl(
      NotifObject _value, $Res Function(NotifObject) _then)
      : super(_value, (v) => _then(v as NotifObject));

  @override
  NotifObject get _value => super._value as NotifObject;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? sender = freezed,
    Object? sentAt = freezed,
    Object? needsFeedback = freezed,
    Object? isRead = freezed,
  }) {
    return _then(NotifObject(
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
      sender: sender == freezed
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as KasadoUser?,
      sentAt: sentAt == freezed
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      needsFeedback: needsFeedback == freezed
          ? _value.needsFeedback
          : needsFeedback // ignore: cast_nullable_to_non_nullable
              as bool,
      isRead: isRead == freezed
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
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
class _$NotifObject with DiagnosticableTreeMixin implements NotifObject {
  const _$NotifObject(
      {required this.id,
      this.title = '',
      required this.body,
      this.sender,
      required this.sentAt,
      this.needsFeedback = false,
      this.isRead = false,
      String? $type})
      : $type = $type ?? 'default';

  factory _$NotifObject.fromJson(Map<String, dynamic> json) =>
      _$$NotifObjectFromJson(json);

  @override
  final String id;
  @JsonKey()
  @override
  final String title;
  @override
  final String body;
  @override
  final KasadoUser? sender;
  @override
  final DateTime sentAt;
  @JsonKey()
  @override
  final bool needsFeedback;
  @JsonKey()
  @override
  final bool isRead;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Notif(id: $id, title: $title, body: $body, sender: $sender, sentAt: $sentAt, needsFeedback: $needsFeedback, isRead: $isRead)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Notif'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('body', body))
      ..add(DiagnosticsProperty('sender', sender))
      ..add(DiagnosticsProperty('sentAt', sentAt))
      ..add(DiagnosticsProperty('needsFeedback', needsFeedback))
      ..add(DiagnosticsProperty('isRead', isRead));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotifObject &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.body, body) &&
            const DeepCollectionEquality().equals(other.sender, sender) &&
            const DeepCollectionEquality().equals(other.sentAt, sentAt) &&
            const DeepCollectionEquality()
                .equals(other.needsFeedback, needsFeedback) &&
            const DeepCollectionEquality().equals(other.isRead, isRead));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(sender),
      const DeepCollectionEquality().hash(sentAt),
      const DeepCollectionEquality().hash(needsFeedback),
      const DeepCollectionEquality().hash(isRead));

  @JsonKey(ignore: true)
  @override
  $NotifObjectCopyWith<NotifObject> get copyWith =>
      _$NotifObjectCopyWithImpl<NotifObject>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String title, String body, KasadoUser? sender,
            DateTime sentAt, bool needsFeedback, bool isRead)
        $default, {
    required TResult Function(
            String id, DateTime sentAt, int yesCount, int noCount)
        meta,
  }) {
    return $default(id, title, body, sender, sentAt, needsFeedback, isRead);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String id, String title, String body, KasadoUser? sender,
            DateTime sentAt, bool needsFeedback, bool isRead)?
        $default, {
    TResult Function(String id, DateTime sentAt, int yesCount, int noCount)?
        meta,
  }) {
    return $default?.call(
        id, title, body, sender, sentAt, needsFeedback, isRead);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String title, String body, KasadoUser? sender,
            DateTime sentAt, bool needsFeedback, bool isRead)?
        $default, {
    TResult Function(String id, DateTime sentAt, int yesCount, int noCount)?
        meta,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, title, body, sender, sentAt, needsFeedback, isRead);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(NotifObject value) $default, {
    required TResult Function(NotifMeta value) meta,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(NotifObject value)? $default, {
    TResult Function(NotifMeta value)? meta,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(NotifObject value)? $default, {
    TResult Function(NotifMeta value)? meta,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NotifObjectToJson(this);
  }
}

abstract class NotifObject implements Notif {
  const factory NotifObject(
      {required String id,
      String title,
      required String body,
      KasadoUser? sender,
      required DateTime sentAt,
      bool needsFeedback,
      bool isRead}) = _$NotifObject;

  factory NotifObject.fromJson(Map<String, dynamic> json) =
      _$NotifObject.fromJson;

  @override
  String get id;
  String get title;
  String get body;
  KasadoUser? get sender;
  @override
  DateTime get sentAt;
  bool get needsFeedback;
  bool get isRead;
  @override
  @JsonKey(ignore: true)
  $NotifObjectCopyWith<NotifObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotifMetaCopyWith<$Res> implements $NotifCopyWith<$Res> {
  factory $NotifMetaCopyWith(NotifMeta value, $Res Function(NotifMeta) then) =
      _$NotifMetaCopyWithImpl<$Res>;
  @override
  $Res call({String id, DateTime sentAt, int yesCount, int noCount});
}

/// @nodoc
class _$NotifMetaCopyWithImpl<$Res> extends _$NotifCopyWithImpl<$Res>
    implements $NotifMetaCopyWith<$Res> {
  _$NotifMetaCopyWithImpl(NotifMeta _value, $Res Function(NotifMeta) _then)
      : super(_value, (v) => _then(v as NotifMeta));

  @override
  NotifMeta get _value => super._value as NotifMeta;

  @override
  $Res call({
    Object? id = freezed,
    Object? sentAt = freezed,
    Object? yesCount = freezed,
    Object? noCount = freezed,
  }) {
    return _then(NotifMeta(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sentAt: sentAt == freezed
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      yesCount: yesCount == freezed
          ? _value.yesCount
          : yesCount // ignore: cast_nullable_to_non_nullable
              as int,
      noCount: noCount == freezed
          ? _value.noCount
          : noCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotifMeta with DiagnosticableTreeMixin implements NotifMeta {
  const _$NotifMeta(
      {required this.id,
      required this.sentAt,
      this.yesCount = 0,
      this.noCount = 0,
      String? $type})
      : $type = $type ?? 'meta';

  factory _$NotifMeta.fromJson(Map<String, dynamic> json) =>
      _$$NotifMetaFromJson(json);

  @override
  final String id;
  @override
  final DateTime sentAt;
  @JsonKey()
  @override
  final int yesCount;
  @JsonKey()
  @override
  final int noCount;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Notif.meta(id: $id, sentAt: $sentAt, yesCount: $yesCount, noCount: $noCount)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Notif.meta'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('sentAt', sentAt))
      ..add(DiagnosticsProperty('yesCount', yesCount))
      ..add(DiagnosticsProperty('noCount', noCount));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotifMeta &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.sentAt, sentAt) &&
            const DeepCollectionEquality().equals(other.yesCount, yesCount) &&
            const DeepCollectionEquality().equals(other.noCount, noCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(sentAt),
      const DeepCollectionEquality().hash(yesCount),
      const DeepCollectionEquality().hash(noCount));

  @JsonKey(ignore: true)
  @override
  $NotifMetaCopyWith<NotifMeta> get copyWith =>
      _$NotifMetaCopyWithImpl<NotifMeta>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String title, String body, KasadoUser? sender,
            DateTime sentAt, bool needsFeedback, bool isRead)
        $default, {
    required TResult Function(
            String id, DateTime sentAt, int yesCount, int noCount)
        meta,
  }) {
    return meta(id, sentAt, yesCount, noCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String id, String title, String body, KasadoUser? sender,
            DateTime sentAt, bool needsFeedback, bool isRead)?
        $default, {
    TResult Function(String id, DateTime sentAt, int yesCount, int noCount)?
        meta,
  }) {
    return meta?.call(id, sentAt, yesCount, noCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String title, String body, KasadoUser? sender,
            DateTime sentAt, bool needsFeedback, bool isRead)?
        $default, {
    TResult Function(String id, DateTime sentAt, int yesCount, int noCount)?
        meta,
    required TResult orElse(),
  }) {
    if (meta != null) {
      return meta(id, sentAt, yesCount, noCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(NotifObject value) $default, {
    required TResult Function(NotifMeta value) meta,
  }) {
    return meta(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(NotifObject value)? $default, {
    TResult Function(NotifMeta value)? meta,
  }) {
    return meta?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(NotifObject value)? $default, {
    TResult Function(NotifMeta value)? meta,
    required TResult orElse(),
  }) {
    if (meta != null) {
      return meta(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NotifMetaToJson(this);
  }
}

abstract class NotifMeta implements Notif {
  const factory NotifMeta(
      {required String id,
      required DateTime sentAt,
      int yesCount,
      int noCount}) = _$NotifMeta;

  factory NotifMeta.fromJson(Map<String, dynamic> json) = _$NotifMeta.fromJson;

  @override
  String get id;
  @override
  DateTime get sentAt;
  int get yesCount;
  int get noCount;
  @override
  @JsonKey(ignore: true)
  $NotifMetaCopyWith<NotifMeta> get copyWith =>
      throw _privateConstructorUsedError;
}
