// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'settings_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SettingsResponse _$SettingsResponseFromJson(Map<String, dynamic> json) {
  return _SettingsResponse.fromJson(json);
}

/// @nodoc
class _$SettingsResponseTearOff {
  const _$SettingsResponseTearOff();

  _SettingsResponse call(
      {TabSettingResponse? tabSetting,
      @JsonKey(name: '_id') String? id,
      String? franchiseId,
      String? vendorId,
      String? tableName,
      int? tableCapacity,
      int? tableNumber,
      int? franchiseCode}) {
    return _SettingsResponse(
      tabSetting: tabSetting,
      id: id,
      franchiseId: franchiseId,
      vendorId: vendorId,
      tableName: tableName,
      tableCapacity: tableCapacity,
      tableNumber: tableNumber,
      franchiseCode: franchiseCode,
    );
  }

  SettingsResponse fromJson(Map<String, Object> json) {
    return SettingsResponse.fromJson(json);
  }
}

/// @nodoc
const $SettingsResponse = _$SettingsResponseTearOff();

/// @nodoc
mixin _$SettingsResponse {
  TabSettingResponse? get tabSetting => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get franchiseId => throw _privateConstructorUsedError;
  String? get vendorId => throw _privateConstructorUsedError;
  String? get tableName => throw _privateConstructorUsedError;
  int? get tableCapacity => throw _privateConstructorUsedError;
  int? get tableNumber => throw _privateConstructorUsedError;
  int? get franchiseCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingsResponseCopyWith<SettingsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsResponseCopyWith<$Res> {
  factory $SettingsResponseCopyWith(
          SettingsResponse value, $Res Function(SettingsResponse) then) =
      _$SettingsResponseCopyWithImpl<$Res>;
  $Res call(
      {TabSettingResponse? tabSetting,
      @JsonKey(name: '_id') String? id,
      String? franchiseId,
      String? vendorId,
      String? tableName,
      int? tableCapacity,
      int? tableNumber,
      int? franchiseCode});

  $TabSettingResponseCopyWith<$Res>? get tabSetting;
}

/// @nodoc
class _$SettingsResponseCopyWithImpl<$Res>
    implements $SettingsResponseCopyWith<$Res> {
  _$SettingsResponseCopyWithImpl(this._value, this._then);

  final SettingsResponse _value;
  // ignore: unused_field
  final $Res Function(SettingsResponse) _then;

  @override
  $Res call({
    Object? tabSetting = freezed,
    Object? id = freezed,
    Object? franchiseId = freezed,
    Object? vendorId = freezed,
    Object? tableName = freezed,
    Object? tableCapacity = freezed,
    Object? tableNumber = freezed,
    Object? franchiseCode = freezed,
  }) {
    return _then(_value.copyWith(
      tabSetting: tabSetting == freezed
          ? _value.tabSetting
          : tabSetting // ignore: cast_nullable_to_non_nullable
              as TabSettingResponse?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      franchiseId: franchiseId == freezed
          ? _value.franchiseId
          : franchiseId // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorId: vendorId == freezed
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String?,
      tableName: tableName == freezed
          ? _value.tableName
          : tableName // ignore: cast_nullable_to_non_nullable
              as String?,
      tableCapacity: tableCapacity == freezed
          ? _value.tableCapacity
          : tableCapacity // ignore: cast_nullable_to_non_nullable
              as int?,
      tableNumber: tableNumber == freezed
          ? _value.tableNumber
          : tableNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      franchiseCode: franchiseCode == freezed
          ? _value.franchiseCode
          : franchiseCode // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$SettingsResponseCopyWith<$Res>
    implements $SettingsResponseCopyWith<$Res> {
  factory _$SettingsResponseCopyWith(
          _SettingsResponse value, $Res Function(_SettingsResponse) then) =
      __$SettingsResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {TabSettingResponse? tabSetting,
      @JsonKey(name: '_id') String? id,
      String? franchiseId,
      String? vendorId,
      String? tableName,
      int? tableCapacity,
      int? tableNumber,
      int? franchiseCode});

  @override
  $TabSettingResponseCopyWith<$Res>? get tabSetting;
}

/// @nodoc
class __$SettingsResponseCopyWithImpl<$Res>
    extends _$SettingsResponseCopyWithImpl<$Res>
    implements _$SettingsResponseCopyWith<$Res> {
  __$SettingsResponseCopyWithImpl(
      _SettingsResponse _value, $Res Function(_SettingsResponse) _then)
      : super(_value, (v) => _then(v as _SettingsResponse));

  @override
  _SettingsResponse get _value => super._value as _SettingsResponse;

  @override
  $Res call({
    Object? tabSetting = freezed,
    Object? id = freezed,
    Object? franchiseId = freezed,
    Object? vendorId = freezed,
    Object? tableName = freezed,
    Object? tableCapacity = freezed,
    Object? tableNumber = freezed,
    Object? franchiseCode = freezed,
  }) {
    return _then(_SettingsResponse(
      tabSetting: tabSetting == freezed
          ? _value.tabSetting
          : tabSetting // ignore: cast_nullable_to_non_nullable
              as TabSettingResponse?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      franchiseId: franchiseId == freezed
          ? _value.franchiseId
          : franchiseId // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorId: vendorId == freezed
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String?,
      tableName: tableName == freezed
          ? _value.tableName
          : tableName // ignore: cast_nullable_to_non_nullable
              as String?,
      tableCapacity: tableCapacity == freezed
          ? _value.tableCapacity
          : tableCapacity // ignore: cast_nullable_to_non_nullable
              as int?,
      tableNumber: tableNumber == freezed
          ? _value.tableNumber
          : tableNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      franchiseCode: franchiseCode == freezed
          ? _value.franchiseCode
          : franchiseCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SettingsResponse extends _SettingsResponse {
  const _$_SettingsResponse(
      {this.tabSetting,
      @JsonKey(name: '_id') this.id,
      this.franchiseId,
      this.vendorId,
      this.tableName,
      this.tableCapacity,
      this.tableNumber,
      this.franchiseCode})
      : super._();

  factory _$_SettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_SettingsResponseFromJson(json);

  @override
  final TabSettingResponse? tabSetting;
  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? franchiseId;
  @override
  final String? vendorId;
  @override
  final String? tableName;
  @override
  final int? tableCapacity;
  @override
  final int? tableNumber;
  @override
  final int? franchiseCode;

  @override
  String toString() {
    return 'SettingsResponse(tabSetting: $tabSetting, id: $id, franchiseId: $franchiseId, vendorId: $vendorId, tableName: $tableName, tableCapacity: $tableCapacity, tableNumber: $tableNumber, franchiseCode: $franchiseCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SettingsResponse &&
            (identical(other.tabSetting, tabSetting) ||
                const DeepCollectionEquality()
                    .equals(other.tabSetting, tabSetting)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.franchiseId, franchiseId) ||
                const DeepCollectionEquality()
                    .equals(other.franchiseId, franchiseId)) &&
            (identical(other.vendorId, vendorId) ||
                const DeepCollectionEquality()
                    .equals(other.vendorId, vendorId)) &&
            (identical(other.tableName, tableName) ||
                const DeepCollectionEquality()
                    .equals(other.tableName, tableName)) &&
            (identical(other.tableCapacity, tableCapacity) ||
                const DeepCollectionEquality()
                    .equals(other.tableCapacity, tableCapacity)) &&
            (identical(other.tableNumber, tableNumber) ||
                const DeepCollectionEquality()
                    .equals(other.tableNumber, tableNumber)) &&
            (identical(other.franchiseCode, franchiseCode) ||
                const DeepCollectionEquality()
                    .equals(other.franchiseCode, franchiseCode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(tabSetting) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(franchiseId) ^
      const DeepCollectionEquality().hash(vendorId) ^
      const DeepCollectionEquality().hash(tableName) ^
      const DeepCollectionEquality().hash(tableCapacity) ^
      const DeepCollectionEquality().hash(tableNumber) ^
      const DeepCollectionEquality().hash(franchiseCode);

  @JsonKey(ignore: true)
  @override
  _$SettingsResponseCopyWith<_SettingsResponse> get copyWith =>
      __$SettingsResponseCopyWithImpl<_SettingsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SettingsResponseToJson(this);
  }
}

abstract class _SettingsResponse extends SettingsResponse {
  const factory _SettingsResponse(
      {TabSettingResponse? tabSetting,
      @JsonKey(name: '_id') String? id,
      String? franchiseId,
      String? vendorId,
      String? tableName,
      int? tableCapacity,
      int? tableNumber,
      int? franchiseCode}) = _$_SettingsResponse;
  const _SettingsResponse._() : super._();

  factory _SettingsResponse.fromJson(Map<String, dynamic> json) =
      _$_SettingsResponse.fromJson;

  @override
  TabSettingResponse? get tabSetting => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get franchiseId => throw _privateConstructorUsedError;
  @override
  String? get vendorId => throw _privateConstructorUsedError;
  @override
  String? get tableName => throw _privateConstructorUsedError;
  @override
  int? get tableCapacity => throw _privateConstructorUsedError;
  @override
  int? get tableNumber => throw _privateConstructorUsedError;
  @override
  int? get franchiseCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SettingsResponseCopyWith<_SettingsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
