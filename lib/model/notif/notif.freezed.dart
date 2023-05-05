// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notif.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
    TResult? Function(String id, String title, String body, KasadoUser? sender,
            DateTime sentAt, bool isRead, bool? hasLiked)?
        $default, {
    TResult? Function(String id, String title, DateTime sentAt, int yesCount,
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
    TResult? Function(NotifObject value)? $default, {
    TResult? Function(NotifMeta value)? meta,
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
      _$NotifCopyWithImpl<$Res, Notif>;
  @useResult
  $Res call({String id, String title, DateTime sentAt});
}

/// @nodoc
class _$NotifCopyWithImpl<$Res, $Val extends Notif>
    implements $NotifCopyWith<$Res> {
  _$NotifCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? sentAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotifObjectCopyWith<$Res> implements $NotifCopyWith<$Res> {
  factory _$$NotifObjectCopyWith(
          _$NotifObject value, $Res Function(_$NotifObject) then) =
      __$$NotifObjectCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$NotifObjectCopyWithImpl<$Res>
    extends _$NotifCopyWithImpl<$Res, _$NotifObject>
    implements _$$NotifObjectCopyWith<$Res> {
  __$$NotifObjectCopyWithImpl(
      _$NotifObject _value, $Res Function(_$NotifObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? body = null,
    Object? sender = freezed,
    Object? sentAt = null,
    Object? isRead = null,
    Object? hasLiked = freezed,
  }) {
    return _then(_$NotifObject(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      sender: freezed == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as KasadoUser?,
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      hasLiked: freezed == hasLiked
          ? _value.hasLiked
          : hasLiked // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
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
      this.hasLiked = null,
      final String? $type})
      : $type = $type ?? 'default';

  factory _$NotifObject.fromJson(Map<String, dynamic> json) =>
      _$$NotifObjectFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String title;
  @override
  final String body;
  @override
  final KasadoUser? sender;
  @override
  final DateTime sentAt;
  @override
  @JsonKey()
  final bool isRead;
  @override
  @JsonKey()
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
            other is _$NotifObject &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.hasLiked, hasLiked) ||
                other.hasLiked == hasLiked));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, body, sender, sentAt, isRead, hasLiked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotifObjectCopyWith<_$NotifObject> get copyWith =>
      __$$NotifObjectCopyWithImpl<_$NotifObject>(this, _$identity);

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
    TResult? Function(String id, String title, String body, KasadoUser? sender,
            DateTime sentAt, bool isRead, bool? hasLiked)?
        $default, {
    TResult? Function(String id, String title, DateTime sentAt, int yesCount,
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
    TResult? Function(NotifObject value)? $default, {
    TResult? Function(NotifMeta value)? meta,
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
    return _$$NotifObjectToJson(
      this,
    );
  }
}

abstract class NotifObject implements Notif {
  const factory NotifObject(
      {required final String id,
      final String title,
      required final String body,
      final KasadoUser? sender,
      required final DateTime sentAt,
      final bool isRead,
      final bool? hasLiked}) = _$NotifObject;

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
  _$$NotifObjectCopyWith<_$NotifObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotifMetaCopyWith<$Res> implements $NotifCopyWith<$Res> {
  factory _$$NotifMetaCopyWith(
          _$NotifMeta value, $Res Function(_$NotifMeta) then) =
      __$$NotifMetaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      DateTime sentAt,
      int yesCount,
      int noCount,
      bool needsFeedback});
}

/// @nodoc
class __$$NotifMetaCopyWithImpl<$Res>
    extends _$NotifCopyWithImpl<$Res, _$NotifMeta>
    implements _$$NotifMetaCopyWith<$Res> {
  __$$NotifMetaCopyWithImpl(
      _$NotifMeta _value, $Res Function(_$NotifMeta) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? sentAt = null,
    Object? yesCount = null,
    Object? noCount = null,
    Object? needsFeedback = null,
  }) {
    return _then(_$NotifMeta(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      yesCount: null == yesCount
          ? _value.yesCount
          : yesCount // ignore: cast_nullable_to_non_nullable
              as int,
      noCount: null == noCount
          ? _value.noCount
          : noCount // ignore: cast_nullable_to_non_nullable
              as int,
      needsFeedback: null == needsFeedback
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
      final String? $type})
      : $type = $type ?? 'meta';

  factory _$NotifMeta.fromJson(Map<String, dynamic> json) =>
      _$$NotifMetaFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String title;
  @override
  final DateTime sentAt;
  @override
  @JsonKey()
  final int yesCount;
  @override
  @JsonKey()
  final int noCount;
  @override
  @JsonKey()
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
            other is _$NotifMeta &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.yesCount, yesCount) ||
                other.yesCount == yesCount) &&
            (identical(other.noCount, noCount) || other.noCount == noCount) &&
            (identical(other.needsFeedback, needsFeedback) ||
                other.needsFeedback == needsFeedback));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, sentAt, yesCount, noCount, needsFeedback);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotifMetaCopyWith<_$NotifMeta> get copyWith =>
      __$$NotifMetaCopyWithImpl<_$NotifMeta>(this, _$identity);

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
    TResult? Function(String id, String title, String body, KasadoUser? sender,
            DateTime sentAt, bool isRead, bool? hasLiked)?
        $default, {
    TResult? Function(String id, String title, DateTime sentAt, int yesCount,
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
    TResult? Function(NotifObject value)? $default, {
    TResult? Function(NotifMeta value)? meta,
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
    return _$$NotifMetaToJson(
      this,
    );
  }
}

abstract class NotifMeta implements Notif {
  const factory NotifMeta(
      {required final String id,
      final String title,
      required final DateTime sentAt,
      final int yesCount,
      final int noCount,
      final bool needsFeedback}) = _$NotifMeta;

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
  _$$NotifMetaCopyWith<_$NotifMeta> get copyWith =>
      throw _privateConstructorUsedError;
}
