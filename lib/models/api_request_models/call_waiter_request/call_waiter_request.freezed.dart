// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'call_waiter_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CallWaiterRequest _$CallWaiterRequestFromJson(Map<String, dynamic> json) {
  return _CallWaiterRequest.fromJson(json);
}

/// @nodoc
class _$CallWaiterRequestTearOff {
  const _$CallWaiterRequestTearOff();

  _CallWaiterRequest call(
      {String? title,
      String? description,
      @JsonKey(includeIfNull: false) String? orderId}) {
    return _CallWaiterRequest(
      title: title,
      description: description,
      orderId: orderId,
    );
  }

  CallWaiterRequest fromJson(Map<String, Object> json) {
    return CallWaiterRequest.fromJson(json);
  }
}

/// @nodoc
const $CallWaiterRequest = _$CallWaiterRequestTearOff();

/// @nodoc
mixin _$CallWaiterRequest {
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get orderId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CallWaiterRequestCopyWith<CallWaiterRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallWaiterRequestCopyWith<$Res> {
  factory $CallWaiterRequestCopyWith(
          CallWaiterRequest value, $Res Function(CallWaiterRequest) then) =
      _$CallWaiterRequestCopyWithImpl<$Res>;
  $Res call(
      {String? title,
      String? description,
      @JsonKey(includeIfNull: false) String? orderId});
}

/// @nodoc
class _$CallWaiterRequestCopyWithImpl<$Res>
    implements $CallWaiterRequestCopyWith<$Res> {
  _$CallWaiterRequestCopyWithImpl(this._value, this._then);

  final CallWaiterRequest _value;
  // ignore: unused_field
  final $Res Function(CallWaiterRequest) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? orderId = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$CallWaiterRequestCopyWith<$Res>
    implements $CallWaiterRequestCopyWith<$Res> {
  factory _$CallWaiterRequestCopyWith(
          _CallWaiterRequest value, $Res Function(_CallWaiterRequest) then) =
      __$CallWaiterRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? title,
      String? description,
      @JsonKey(includeIfNull: false) String? orderId});
}

/// @nodoc
class __$CallWaiterRequestCopyWithImpl<$Res>
    extends _$CallWaiterRequestCopyWithImpl<$Res>
    implements _$CallWaiterRequestCopyWith<$Res> {
  __$CallWaiterRequestCopyWithImpl(
      _CallWaiterRequest _value, $Res Function(_CallWaiterRequest) _then)
      : super(_value, (v) => _then(v as _CallWaiterRequest));

  @override
  _CallWaiterRequest get _value => super._value as _CallWaiterRequest;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? orderId = freezed,
  }) {
    return _then(_CallWaiterRequest(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CallWaiterRequest extends _CallWaiterRequest {
  const _$_CallWaiterRequest(
      {this.title,
      this.description,
      @JsonKey(includeIfNull: false) this.orderId})
      : super._();

  factory _$_CallWaiterRequest.fromJson(Map<String, dynamic> json) =>
      _$_$_CallWaiterRequestFromJson(json);

  @override
  final String? title;
  @override
  final String? description;
  @override
  @JsonKey(includeIfNull: false)
  final String? orderId;

  @override
  String toString() {
    return 'CallWaiterRequest(title: $title, description: $description, orderId: $orderId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CallWaiterRequest &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.orderId, orderId) ||
                const DeepCollectionEquality().equals(other.orderId, orderId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(orderId);

  @JsonKey(ignore: true)
  @override
  _$CallWaiterRequestCopyWith<_CallWaiterRequest> get copyWith =>
      __$CallWaiterRequestCopyWithImpl<_CallWaiterRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CallWaiterRequestToJson(this);
  }
}

abstract class _CallWaiterRequest extends CallWaiterRequest {
  const factory _CallWaiterRequest(
      {String? title,
      String? description,
      @JsonKey(includeIfNull: false) String? orderId}) = _$_CallWaiterRequest;
  const _CallWaiterRequest._() : super._();

  factory _CallWaiterRequest.fromJson(Map<String, dynamic> json) =
      _$_CallWaiterRequest.fromJson;

  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: false)
  String? get orderId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CallWaiterRequestCopyWith<_CallWaiterRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
