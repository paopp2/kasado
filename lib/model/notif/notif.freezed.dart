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
      bool isRead = false,
      bool? hasLiked}) {
    return NotifObject(
      id: id,
      title: title,
      body: body,
      sender: sender,
      sentAt: sentAt,
      isRead: isRead,
      hasLiked: hasLiked,
    );
  }

  NotifMeta meta(
      {required String id,
      String title = '',
      required DateTime sentAt,
      int yesCount = 0,
      int noCount = 0,
      bool needsFeedback = false}) {
    return NotifMeta(
      id: id,
      title: title,
      sentAt: sentAt,
      yesCount: yesCount,
      noCount: noCount,
      needsFeedback: needsFeedback,
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
  String get title => throw _privateConstructorUsedError;
  DateTime get sentAt => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String title, String body, KasadoUser? sender,
            DateTime sentAt, bool isRead, bool? hasLiked)
        $default, {
    required TResult Function(String id, String title, DateTime sentAt,
            int yesCount, int noCount, bool needsFeedback)
        meta,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String id, String title, String body, KasadoUser? sender,
            DateTime sentAt, bool isRead, bool? hasLiked)?
        $default, {
    TResult Function(String id, String title, DateTime sentAt, int yesCount,
            int noCount, bool needsFeedback)?
        meta,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String title, String body, KasadoUser? sender,
            DateTime sentAt, bool isRead, bool? hasLiked)?
        $default, {
    TResult Function(String id, String title, DateTime sentAt, int yesCount,
            int noCount, bool needsFeedback)?
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
  $Res call({String id, String title, DateTime sentAt});
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
    Object? title = freezed,
    Object? sentAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
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
      bool isRead,
      bool? hasLiked});

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
    Object? isRead = freezed,
    Object? hasLiked = freezed,
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
      isRead: isRead == freezed
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      hasLiked: hasLiked == freezed
          ? _value.hasLiked
          : hasLiked // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      this.isRead = false,
      this.hasLiked,
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
  final bool isRead;
  @override
  final bool? hasLiked;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Notif(id: $id, title: $title, body: $body, sender: $sender, sentAt: $sentAt, isRead: $isRead, hasLiked: $hasLiked)';
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
      ..add(DiagnosticsProperty('isRead', isRead))
      ..add(DiagnosticsProperty('hasLiked', hasLiked));
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
            const DeepCollectionEquality().equals(other.isRead, isRead) &&
            const DeepCollectionEquality().equals(other.hasLiked, hasLiked));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(sender),
      const DeepCollectionEquality().hash(sentAt),
      const DeepCollectionEquality().hash(isRead),
      const DeepCollectionEquality().hash(hasLiked));

  @JsonKey(ignore: true)
  @override
  $NotifObjectCopyWith<NotifObject> get copyWith =>
      _$NotifObjectCopyWithImpl<NotifObject>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String title, String body, KasadoUser? sender,
            DateTime sentAt, bool isRead, bool? hasLiked)
        $default, {
    required TResult Function(String id, String title, DateTime sentAt,
            int yesCount, int noCount, bool needsFeedback)
        meta,
  }) {
    return $default(id, title, body, sender, sentAt, isRead, hasLiked);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String id, String title, String body, KasadoUser? sender,
            DateTime sentAt, bool isRead, bool? hasLiked)?
        $default, {
    TResult Function(String id, String title, DateTime sentAt, int yesCount,
            int noCount, bool needsFeedback)?
        meta,
  }) {
    return $default?.call(id, title, body, sender, sentAt, isRead, hasLiked);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String title, String body, KasadoUser? sender,
            DateTime sentAt, bool isRead, bool? hasLiked)?
        $default, {
    TResult Function(String id, String title, DateTime sentAt, int yesCount,
            int noCount, bool needsFeedback)?
        meta,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, title, body, sender, sentAt, isRead, hasLiked);
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
      bool isRead,
      bool? hasLiked}) = _$NotifObject;

  factory NotifObject.fromJson(Map<String, dynamic> json) =
      _$NotifObject.fromJson;

  @override
  String get id;
  @override
  String get title;
  String get body;
  KasadoUser? get sender;
  @override
  DateTime get sentAt;
  bool get isRead;
  bool? get hasLiked;
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
  $Res call(
      {String id,
      String title,
      DateTime sentAt,
      int yesCount,
      int noCount,
      bool needsFeedback});
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
    Object? title = freezed,
    Object? sentAt = freezed,
    Object? yesCount = freezed,
    Object? noCount = freezed,
    Object? needsFeedback = freezed,
  }) {
    return _then(NotifMeta(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
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
      needsFeedback: needsFeedback == freezed
          ? _value.needsFeedback
          : needsFeedback // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotifMeta with DiagnosticableTreeMixin implements NotifMeta {
  const _$NotifMeta(
      {required this.id,
      this.title = '',
      required this.sentAt,
      this.yesCount = 0,
      this.noCount = 0,
      this.needsFeedback = false,
      String? $type})
      : $type = $type ?? 'meta';

  factory _$NotifMeta.fromJson(Map<String, dynamic> json) =>
      _$$NotifMetaFromJson(json);

  @override
  final String id;
  @JsonKey()
  @override
  final String title;
  @override
  final DateTime sentAt;
  @JsonKey()
  @override
  final int yesCount;
  @JsonKey()
  @override
  final int noCount;
  @JsonKey()
  @override
  final bool needsFeedback;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Notif.meta(id: $id, title: $title, sentAt: $sentAt, yesCount: $yesCount, noCount: $noCount, needsFeedback: $needsFeedback)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Notif.meta'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('sentAt', sentAt))
      ..add(DiagnosticsProperty('yesCount', yesCount))
      ..add(DiagnosticsProperty('noCount', noCount))
      ..add(DiagnosticsProperty('needsFeedback', needsFeedback));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotifMeta &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.sentAt, sentAt) &&
            const DeepCollectionEquality().equals(other.yesCount, yesCount) &&
            const DeepCollectionEquality().equals(other.noCount, noCount) &&
            const DeepCollectionEquality()
                .equals(other.needsFeedback, needsFeedback));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(sentAt),
      const DeepCollectionEquality().hash(yesCount),
      const DeepCollectionEquality().hash(noCount),
      const DeepCollectionEquality().hash(needsFeedback));

  @JsonKey(ignore: true)
  @override
  $NotifMetaCopyWith<NotifMeta> get copyWith =>
      _$NotifMetaCopyWithImpl<NotifMeta>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String title, String body, KasadoUser? sender,
            DateTime sentAt, bool isRead, bool? hasLiked)
        $default, {
    required TResult Function(String id, String title, DateTime sentAt,
            int yesCount, int noCount, bool needsFeedback)
        meta,
  }) {
    return meta(id, title, sentAt, yesCount, noCount, needsFeedback);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String id, String title, String body, KasadoUser? sender,
            DateTime sentAt, bool isRead, bool? hasLiked)?
        $default, {
    TResult Function(String id, String title, DateTime sentAt, int yesCount,
            int noCount, bool needsFeedback)?
        meta,
  }) {
    return meta?.call(id, title, sentAt, yesCount, noCount, needsFeedback);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String title, String body, KasadoUser? sender,
            DateTime sentAt, bool isRead, bool? hasLiked)?
        $default, {
    TResult Function(String id, String title, DateTime sentAt, int yesCount,
            int noCount, bool needsFeedback)?
        meta,
    required TResult orElse(),
  }) {
    if (meta != null) {
      return meta(id, title, sentAt, yesCount, noCount, needsFeedback);
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
      String title,
      required DateTime sentAt,
      int yesCount,
      int noCount,
      bool needsFeedback}) = _$NotifMeta;

  factory NotifMeta.fromJson(Map<String, dynamic> json) = _$NotifMeta.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  DateTime get sentAt;
  int get yesCount;
  int get noCount;
  bool get needsFeedback;
  @override
  @JsonKey(ignore: true)
  $NotifMetaCopyWith<NotifMeta> get copyWith =>
      throw _privateConstructorUsedError;
}
