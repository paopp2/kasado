// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'feedback.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Feedback _$FeedbackFromJson(Map<String, dynamic> json) {
  return _Feedback.fromJson(json);
}

/// @nodoc
class _$FeedbackTearOff {
  const _$FeedbackTearOff();

  _Feedback call(
      {required String id,
      String title = '',
      required String body,
      KasadoUser? sender,
      required DateTime sentAt}) {
    return _Feedback(
      id: id,
      title: title,
      body: body,
      sender: sender,
      sentAt: sentAt,
    );
  }

  Feedback fromJson(Map<String, Object?> json) {
    return Feedback.fromJson(json);
  }
}

/// @nodoc
const $Feedback = _$FeedbackTearOff();

/// @nodoc
mixin _$Feedback {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  KasadoUser? get sender => throw _privateConstructorUsedError;
  DateTime get sentAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeedbackCopyWith<Feedback> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackCopyWith<$Res> {
  factory $FeedbackCopyWith(Feedback value, $Res Function(Feedback) then) =
      _$FeedbackCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String title,
      String body,
      KasadoUser? sender,
      DateTime sentAt});

  $KasadoUserCopyWith<$Res>? get sender;
}

/// @nodoc
class _$FeedbackCopyWithImpl<$Res> implements $FeedbackCopyWith<$Res> {
  _$FeedbackCopyWithImpl(this._value, this._then);

  final Feedback _value;
  // ignore: unused_field
  final $Res Function(Feedback) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? sender = freezed,
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
abstract class _$FeedbackCopyWith<$Res> implements $FeedbackCopyWith<$Res> {
  factory _$FeedbackCopyWith(_Feedback value, $Res Function(_Feedback) then) =
      __$FeedbackCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String title,
      String body,
      KasadoUser? sender,
      DateTime sentAt});

  @override
  $KasadoUserCopyWith<$Res>? get sender;
}

/// @nodoc
class __$FeedbackCopyWithImpl<$Res> extends _$FeedbackCopyWithImpl<$Res>
    implements _$FeedbackCopyWith<$Res> {
  __$FeedbackCopyWithImpl(_Feedback _value, $Res Function(_Feedback) _then)
      : super(_value, (v) => _then(v as _Feedback));

  @override
  _Feedback get _value => super._value as _Feedback;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? sender = freezed,
    Object? sentAt = freezed,
  }) {
    return _then(_Feedback(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Feedback extends _Feedback with DiagnosticableTreeMixin {
  const _$_Feedback(
      {required this.id,
      this.title = '',
      required this.body,
      this.sender,
      required this.sentAt})
      : super._();

  factory _$_Feedback.fromJson(Map<String, dynamic> json) =>
      _$$_FeedbackFromJson(json);

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

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Feedback(id: $id, title: $title, body: $body, sender: $sender, sentAt: $sentAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Feedback'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('body', body))
      ..add(DiagnosticsProperty('sender', sender))
      ..add(DiagnosticsProperty('sentAt', sentAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Feedback &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.body, body) &&
            const DeepCollectionEquality().equals(other.sender, sender) &&
            const DeepCollectionEquality().equals(other.sentAt, sentAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(sender),
      const DeepCollectionEquality().hash(sentAt));

  @JsonKey(ignore: true)
  @override
  _$FeedbackCopyWith<_Feedback> get copyWith =>
      __$FeedbackCopyWithImpl<_Feedback>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FeedbackToJson(this);
  }
}

abstract class _Feedback extends Feedback {
  const factory _Feedback(
      {required String id,
      String title,
      required String body,
      KasadoUser? sender,
      required DateTime sentAt}) = _$_Feedback;
  const _Feedback._() : super._();

  factory _Feedback.fromJson(Map<String, dynamic> json) = _$_Feedback.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get body;
  @override
  KasadoUser? get sender;
  @override
  DateTime get sentAt;
  @override
  @JsonKey(ignore: true)
  _$FeedbackCopyWith<_Feedback> get copyWith =>
      throw _privateConstructorUsedError;
}
