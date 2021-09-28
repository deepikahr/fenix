// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'menu_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MenuResponse _$MenuResponseFromJson(Map<String, dynamic> json) {
  return _MenuResponse.fromJson(json);
}

/// @nodoc
class _$MenuResponseTearOff {
  const _$MenuResponseTearOff();

  _MenuResponse call(
      {@JsonKey(name: '_id') String? id,
      String? title,
      String? menuId,
      String? masterMenuId,
      String? vendorId,
      String? franchiseId,
      bool isMenuCloned = false,
      String? cloneType,
      bool menuClonedFromMasterMenu = false,
      bool menuClonedFromRestaurantMenu = false,
      String? createdAt,
      String? updatedAt}) {
    return _MenuResponse(
      id: id,
      title: title,
      menuId: menuId,
      masterMenuId: masterMenuId,
      vendorId: vendorId,
      franchiseId: franchiseId,
      isMenuCloned: isMenuCloned,
      cloneType: cloneType,
      menuClonedFromMasterMenu: menuClonedFromMasterMenu,
      menuClonedFromRestaurantMenu: menuClonedFromRestaurantMenu,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  MenuResponse fromJson(Map<String, Object> json) {
    return MenuResponse.fromJson(json);
  }
}

/// @nodoc
const $MenuResponse = _$MenuResponseTearOff();

/// @nodoc
mixin _$MenuResponse {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get menuId => throw _privateConstructorUsedError;
  String? get masterMenuId => throw _privateConstructorUsedError;
  String? get vendorId => throw _privateConstructorUsedError;
  String? get franchiseId => throw _privateConstructorUsedError;
  bool get isMenuCloned => throw _privateConstructorUsedError;
  String? get cloneType => throw _privateConstructorUsedError;
  bool get menuClonedFromMasterMenu => throw _privateConstructorUsedError;
  bool get menuClonedFromRestaurantMenu => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuResponseCopyWith<MenuResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuResponseCopyWith<$Res> {
  factory $MenuResponseCopyWith(
          MenuResponse value, $Res Function(MenuResponse) then) =
      _$MenuResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? title,
      String? menuId,
      String? masterMenuId,
      String? vendorId,
      String? franchiseId,
      bool isMenuCloned,
      String? cloneType,
      bool menuClonedFromMasterMenu,
      bool menuClonedFromRestaurantMenu,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class _$MenuResponseCopyWithImpl<$Res> implements $MenuResponseCopyWith<$Res> {
  _$MenuResponseCopyWithImpl(this._value, this._then);

  final MenuResponse _value;
  // ignore: unused_field
  final $Res Function(MenuResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? menuId = freezed,
    Object? masterMenuId = freezed,
    Object? vendorId = freezed,
    Object? franchiseId = freezed,
    Object? isMenuCloned = freezed,
    Object? cloneType = freezed,
    Object? menuClonedFromMasterMenu = freezed,
    Object? menuClonedFromRestaurantMenu = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      menuId: menuId == freezed
          ? _value.menuId
          : menuId // ignore: cast_nullable_to_non_nullable
              as String?,
      masterMenuId: masterMenuId == freezed
          ? _value.masterMenuId
          : masterMenuId // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorId: vendorId == freezed
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String?,
      franchiseId: franchiseId == freezed
          ? _value.franchiseId
          : franchiseId // ignore: cast_nullable_to_non_nullable
              as String?,
      isMenuCloned: isMenuCloned == freezed
          ? _value.isMenuCloned
          : isMenuCloned // ignore: cast_nullable_to_non_nullable
              as bool,
      cloneType: cloneType == freezed
          ? _value.cloneType
          : cloneType // ignore: cast_nullable_to_non_nullable
              as String?,
      menuClonedFromMasterMenu: menuClonedFromMasterMenu == freezed
          ? _value.menuClonedFromMasterMenu
          : menuClonedFromMasterMenu // ignore: cast_nullable_to_non_nullable
              as bool,
      menuClonedFromRestaurantMenu: menuClonedFromRestaurantMenu == freezed
          ? _value.menuClonedFromRestaurantMenu
          : menuClonedFromRestaurantMenu // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$MenuResponseCopyWith<$Res>
    implements $MenuResponseCopyWith<$Res> {
  factory _$MenuResponseCopyWith(
          _MenuResponse value, $Res Function(_MenuResponse) then) =
      __$MenuResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? title,
      String? menuId,
      String? masterMenuId,
      String? vendorId,
      String? franchiseId,
      bool isMenuCloned,
      String? cloneType,
      bool menuClonedFromMasterMenu,
      bool menuClonedFromRestaurantMenu,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class __$MenuResponseCopyWithImpl<$Res> extends _$MenuResponseCopyWithImpl<$Res>
    implements _$MenuResponseCopyWith<$Res> {
  __$MenuResponseCopyWithImpl(
      _MenuResponse _value, $Res Function(_MenuResponse) _then)
      : super(_value, (v) => _then(v as _MenuResponse));

  @override
  _MenuResponse get _value => super._value as _MenuResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? menuId = freezed,
    Object? masterMenuId = freezed,
    Object? vendorId = freezed,
    Object? franchiseId = freezed,
    Object? isMenuCloned = freezed,
    Object? cloneType = freezed,
    Object? menuClonedFromMasterMenu = freezed,
    Object? menuClonedFromRestaurantMenu = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_MenuResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      menuId: menuId == freezed
          ? _value.menuId
          : menuId // ignore: cast_nullable_to_non_nullable
              as String?,
      masterMenuId: masterMenuId == freezed
          ? _value.masterMenuId
          : masterMenuId // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorId: vendorId == freezed
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String?,
      franchiseId: franchiseId == freezed
          ? _value.franchiseId
          : franchiseId // ignore: cast_nullable_to_non_nullable
              as String?,
      isMenuCloned: isMenuCloned == freezed
          ? _value.isMenuCloned
          : isMenuCloned // ignore: cast_nullable_to_non_nullable
              as bool,
      cloneType: cloneType == freezed
          ? _value.cloneType
          : cloneType // ignore: cast_nullable_to_non_nullable
              as String?,
      menuClonedFromMasterMenu: menuClonedFromMasterMenu == freezed
          ? _value.menuClonedFromMasterMenu
          : menuClonedFromMasterMenu // ignore: cast_nullable_to_non_nullable
              as bool,
      menuClonedFromRestaurantMenu: menuClonedFromRestaurantMenu == freezed
          ? _value.menuClonedFromRestaurantMenu
          : menuClonedFromRestaurantMenu // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MenuResponse extends _MenuResponse {
  const _$_MenuResponse(
      {@JsonKey(name: '_id') this.id,
      this.title,
      this.menuId,
      this.masterMenuId,
      this.vendorId,
      this.franchiseId,
      this.isMenuCloned = false,
      this.cloneType,
      this.menuClonedFromMasterMenu = false,
      this.menuClonedFromRestaurantMenu = false,
      this.createdAt,
      this.updatedAt})
      : super._();

  factory _$_MenuResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_MenuResponseFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? title;
  @override
  final String? menuId;
  @override
  final String? masterMenuId;
  @override
  final String? vendorId;
  @override
  final String? franchiseId;
  @JsonKey(defaultValue: false)
  @override
  final bool isMenuCloned;
  @override
  final String? cloneType;
  @JsonKey(defaultValue: false)
  @override
  final bool menuClonedFromMasterMenu;
  @JsonKey(defaultValue: false)
  @override
  final bool menuClonedFromRestaurantMenu;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'MenuResponse(id: $id, title: $title, menuId: $menuId, masterMenuId: $masterMenuId, vendorId: $vendorId, franchiseId: $franchiseId, isMenuCloned: $isMenuCloned, cloneType: $cloneType, menuClonedFromMasterMenu: $menuClonedFromMasterMenu, menuClonedFromRestaurantMenu: $menuClonedFromRestaurantMenu, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MenuResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.menuId, menuId) ||
                const DeepCollectionEquality().equals(other.menuId, menuId)) &&
            (identical(other.masterMenuId, masterMenuId) ||
                const DeepCollectionEquality()
                    .equals(other.masterMenuId, masterMenuId)) &&
            (identical(other.vendorId, vendorId) ||
                const DeepCollectionEquality()
                    .equals(other.vendorId, vendorId)) &&
            (identical(other.franchiseId, franchiseId) ||
                const DeepCollectionEquality()
                    .equals(other.franchiseId, franchiseId)) &&
            (identical(other.isMenuCloned, isMenuCloned) ||
                const DeepCollectionEquality()
                    .equals(other.isMenuCloned, isMenuCloned)) &&
            (identical(other.cloneType, cloneType) ||
                const DeepCollectionEquality()
                    .equals(other.cloneType, cloneType)) &&
            (identical(
                    other.menuClonedFromMasterMenu, menuClonedFromMasterMenu) ||
                const DeepCollectionEquality().equals(
                    other.menuClonedFromMasterMenu,
                    menuClonedFromMasterMenu)) &&
            (identical(other.menuClonedFromRestaurantMenu,
                    menuClonedFromRestaurantMenu) ||
                const DeepCollectionEquality().equals(
                    other.menuClonedFromRestaurantMenu,
                    menuClonedFromRestaurantMenu)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(menuId) ^
      const DeepCollectionEquality().hash(masterMenuId) ^
      const DeepCollectionEquality().hash(vendorId) ^
      const DeepCollectionEquality().hash(franchiseId) ^
      const DeepCollectionEquality().hash(isMenuCloned) ^
      const DeepCollectionEquality().hash(cloneType) ^
      const DeepCollectionEquality().hash(menuClonedFromMasterMenu) ^
      const DeepCollectionEquality().hash(menuClonedFromRestaurantMenu) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt);

  @JsonKey(ignore: true)
  @override
  _$MenuResponseCopyWith<_MenuResponse> get copyWith =>
      __$MenuResponseCopyWithImpl<_MenuResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MenuResponseToJson(this);
  }
}

abstract class _MenuResponse extends MenuResponse {
  const factory _MenuResponse(
      {@JsonKey(name: '_id') String? id,
      String? title,
      String? menuId,
      String? masterMenuId,
      String? vendorId,
      String? franchiseId,
      bool isMenuCloned,
      String? cloneType,
      bool menuClonedFromMasterMenu,
      bool menuClonedFromRestaurantMenu,
      String? createdAt,
      String? updatedAt}) = _$_MenuResponse;
  const _MenuResponse._() : super._();

  factory _MenuResponse.fromJson(Map<String, dynamic> json) =
      _$_MenuResponse.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  String? get menuId => throw _privateConstructorUsedError;
  @override
  String? get masterMenuId => throw _privateConstructorUsedError;
  @override
  String? get vendorId => throw _privateConstructorUsedError;
  @override
  String? get franchiseId => throw _privateConstructorUsedError;
  @override
  bool get isMenuCloned => throw _privateConstructorUsedError;
  @override
  String? get cloneType => throw _privateConstructorUsedError;
  @override
  bool get menuClonedFromMasterMenu => throw _privateConstructorUsedError;
  @override
  bool get menuClonedFromRestaurantMenu => throw _privateConstructorUsedError;
  @override
  String? get createdAt => throw _privateConstructorUsedError;
  @override
  String? get updatedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MenuResponseCopyWith<_MenuResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
