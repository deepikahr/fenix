// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'settings_update_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SettingsUpdateRequest _$SettingsUpdateRequestFromJson(
    Map<String, dynamic> json) {
  return _SettingsUpdateRequest.fromJson(json);
}

/// @nodoc
class _$SettingsUpdateRequestTearOff {
  const _$SettingsUpdateRequestTearOff();

  _SettingsUpdateRequest call({TabSettingResponse? tabSetting}) {
    return _SettingsUpdateRequest(
      tabSetting: tabSetting,
    );
  }

  SettingsUpdateRequest fromJson(Map<String, Object> json) {
    return SettingsUpdateRequest.fromJson(json);
  }
}

/// @nodoc
const $SettingsUpdateRequest = _$SettingsUpdateRequestTearOff();

/// @nodoc
mixin _$SettingsUpdateRequest {
  TabSettingResponse? get tabSetting => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingsUpdateRequestCopyWith<SettingsUpdateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsUpdateRequestCopyWith<$Res> {
  factory $SettingsUpdateRequestCopyWith(SettingsUpdateRequest value,
          $Res Function(SettingsUpdateRequest) then) =
      _$SettingsUpdateRequestCopyWithImpl<$Res>;
  $Res call({TabSettingResponse? tabSetting});

  $TabSettingResponseCopyWith<$Res>? get tabSetting;
}

/// @nodoc
class _$SettingsUpdateRequestCopyWithImpl<$Res>
    implements $SettingsUpdateRequestCopyWith<$Res> {
  _$SettingsUpdateRequestCopyWithImpl(this._value, this._then);

  final SettingsUpdateRequest _value;
  // ignore: unused_field
  final $Res Function(SettingsUpdateRequest) _then;

  @override
  $Res call({
    Object? tabSetting = freezed,
  }) {
    return _then(_value.copyWith(
      tabSetting: tabSetting == freezed
          ? _value.tabSetting
          : tabSetting // ignore: cast_nullable_to_non_nullable
              as TabSettingResponse?,
    ));
  }

  @override
  $TabSettingResponseCopyWith<$Res>? get tabSetting {
    if (_value.tabSetting == null) {
      return null;
    }

    return $TabSettingResponseCopyWith<$Res>(_value.tabSetting!, (value) {
      return _then(_value.copyWith(tabSetting: value));
    });
  }
}

/// @nodoc
abstract class _$SettingsUpdateRequestCopyWith<$Res>
    implements $SettingsUpdateRequestCopyWith<$Res> {
  factory _$SettingsUpdateRequestCopyWith(_SettingsUpdateRequest value,
          $Res Function(_SettingsUpdateRequest) then) =
      __$SettingsUpdateRequestCopyWithImpl<$Res>;
  @override
  $Res call({TabSettingResponse? tabSetting});

  @override
  $TabSettingResponseCopyWith<$Res>? get tabSetting;
}

/// @nodoc
class __$SettingsUpdateRequestCopyWithImpl<$Res>
    extends _$SettingsUpdateRequestCopyWithImpl<$Res>
    implements _$SettingsUpdateRequestCopyWith<$Res> {
  __$SettingsUpdateRequestCopyWithImpl(_SettingsUpdateRequest _value,
      $Res Function(_SettingsUpdateRequest) _then)
      : super(_value, (v) => _then(v as _SettingsUpdateRequest));

  @override
  _SettingsUpdateRequest get _value => super._value as _SettingsUpdateRequest;

  @override
  $Res call({
    Object? tabSetting = freezed,
  }) {
    return _then(_SettingsUpdateRequest(
      tabSetting: tabSetting == freezed
          ? _value.tabSetting
          : tabSetting // ignore: cast_nullable_to_non_nullable
              as TabSettingResponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SettingsUpdateRequest extends _SettingsUpdateRequest {
  const _$_SettingsUpdateRequest({this.tabSetting}) : super._();

  factory _$_SettingsUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$_$_SettingsUpdateRequestFromJson(json);

  @override
  final TabSettingResponse? tabSetting;

  @override
  String toString() {
    return 'SettingsUpdateRequest(tabSetting: $tabSetting)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SettingsUpdateRequest &&
            (identical(other.tabSetting, tabSetting) ||
                const DeepCollectionEquality()
                    .equals(other.tabSetting, tabSetting)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(tabSetting);

  @JsonKey(ignore: true)
  @override
  _$SettingsUpdateRequestCopyWith<_SettingsUpdateRequest> get copyWith =>
      __$SettingsUpdateRequestCopyWithImpl<_SettingsUpdateRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SettingsUpdateRequestToJson(this);
  }
}

abstract class _SettingsUpdateRequest extends SettingsUpdateRequest {
  const factory _SettingsUpdateRequest({TabSettingResponse? tabSetting}) =
      _$_SettingsUpdateRequest;
  const _SettingsUpdateRequest._() : super._();

  factory _SettingsUpdateRequest.fromJson(Map<String, dynamic> json) =
      _$_SettingsUpdateRequest.fromJson;

  @override
  TabSettingResponse? get tabSetting => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SettingsUpdateRequestCopyWith<_SettingsUpdateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
