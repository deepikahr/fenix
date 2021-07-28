// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'notification_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationListResponse _$NotificationListResponseFromJson(
    Map<String, dynamic> json) {
  return _NotificationListResponse.fromJson(json);
}

/// @nodoc
class _$NotificationListResponseTearOff {
  const _$NotificationListResponseTearOff();

  _NotificationListResponse call({List<NotificationResponse> data = const []}) {
    return _NotificationListResponse(
      data: data,
    );
  }

  NotificationListResponse fromJson(Map<String, Object> json) {
    return NotificationListResponse.fromJson(json);
  }
}

/// @nodoc
const $NotificationListResponse = _$NotificationListResponseTearOff();

/// @nodoc
mixin _$NotificationListResponse {
  List<NotificationResponse> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationListResponseCopyWith<NotificationListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationListResponseCopyWith<$Res> {
  factory $NotificationListResponseCopyWith(NotificationListResponse value,
          $Res Function(NotificationListResponse) then) =
      _$NotificationListResponseCopyWithImpl<$Res>;
  $Res call({List<NotificationResponse> data});
}

/// @nodoc
class _$NotificationListResponseCopyWithImpl<$Res>
    implements $NotificationListResponseCopyWith<$Res> {
  _$NotificationListResponseCopyWithImpl(this._value, this._then);

  final NotificationListResponse _value;
  // ignore: unused_field
  final $Res Function(NotificationListResponse) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NotificationResponse>,
    ));
  }
}

/// @nodoc
abstract class _$NotificationListResponseCopyWith<$Res>
    implements $NotificationListResponseCopyWith<$Res> {
  factory _$NotificationListResponseCopyWith(_NotificationListResponse value,
          $Res Function(_NotificationListResponse) then) =
      __$NotificationListResponseCopyWithImpl<$Res>;
  @override
  $Res call({List<NotificationResponse> data});
}

/// @nodoc
class __$NotificationListResponseCopyWithImpl<$Res>
    extends _$NotificationListResponseCopyWithImpl<$Res>
    implements _$NotificationListResponseCopyWith<$Res> {
  __$NotificationListResponseCopyWithImpl(_NotificationListResponse _value,
      $Res Function(_NotificationListResponse) _then)
      : super(_value, (v) => _then(v as _NotificationListResponse));

  @override
  _NotificationListResponse get _value =>
      super._value as _NotificationListResponse;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_NotificationListResponse(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NotificationResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationListResponse extends _NotificationListResponse {
  const _$_NotificationListResponse({this.data = const []}) : super._();

  factory _$_NotificationListResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_NotificationListResponseFromJson(json);

  @JsonKey(defaultValue: const [])
  @override
  final List<NotificationResponse> data;

  @override
  String toString() {
    return 'NotificationListResponse(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NotificationListResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  _$NotificationListResponseCopyWith<_NotificationListResponse> get copyWith =>
      __$NotificationListResponseCopyWithImpl<_NotificationListResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NotificationListResponseToJson(this);
  }
}

abstract class _NotificationListResponse extends NotificationListResponse {
  const factory _NotificationListResponse({List<NotificationResponse> data}) =
      _$_NotificationListResponse;
  const _NotificationListResponse._() : super._();

  factory _NotificationListResponse.fromJson(Map<String, dynamic> json) =
      _$_NotificationListResponse.fromJson;

  @override
  List<NotificationResponse> get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NotificationListResponseCopyWith<_NotificationListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
