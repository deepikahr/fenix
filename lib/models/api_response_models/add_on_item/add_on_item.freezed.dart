// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'add_on_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddOnItem _$AddOnItemFromJson(Map<String, dynamic> json) {
  return _AddOnItem.fromJson(json);
}

/// @nodoc
class _$AddOnItemTearOff {
  const _$AddOnItemTearOff();

  _AddOnItem call(
      {@JsonKey(name: '_id') String? id,
      String? addOnCategoryId,
      String? addOnItemId,
      String? addOnItemName,
      double? addOnItemPrice,
      int quantity = 1,
      bool? selected,
      String? imageId,
      String? filePath,
      String? imageUrl}) {
    return _AddOnItem(
      id: id,
      addOnCategoryId: addOnCategoryId,
      addOnItemId: addOnItemId,
      addOnItemName: addOnItemName,
      addOnItemPrice: addOnItemPrice,
      quantity: quantity,
      selected: selected,
      imageId: imageId,
      filePath: filePath,
      imageUrl: imageUrl,
    );
  }

  AddOnItem fromJson(Map<String, Object> json) {
    return AddOnItem.fromJson(json);
  }
}

/// @nodoc
const $AddOnItem = _$AddOnItemTearOff();

/// @nodoc
mixin _$AddOnItem {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get addOnCategoryId => throw _privateConstructorUsedError;
  String? get addOnItemId => throw _privateConstructorUsedError;
  String? get addOnItemName => throw _privateConstructorUsedError;
  double? get addOnItemPrice => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  bool? get selected => throw _privateConstructorUsedError;
  String? get imageId => throw _privateConstructorUsedError;
  String? get filePath => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddOnItemCopyWith<AddOnItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddOnItemCopyWith<$Res> {
  factory $AddOnItemCopyWith(AddOnItem value, $Res Function(AddOnItem) then) =
      _$AddOnItemCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? addOnCategoryId,
      String? addOnItemId,
      String? addOnItemName,
      double? addOnItemPrice,
      int quantity,
      bool? selected,
      String? imageId,
      String? filePath,
      String? imageUrl});
}

/// @nodoc
class _$AddOnItemCopyWithImpl<$Res> implements $AddOnItemCopyWith<$Res> {
  _$AddOnItemCopyWithImpl(this._value, this._then);

  final AddOnItem _value;
  // ignore: unused_field
  final $Res Function(AddOnItem) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? addOnCategoryId = freezed,
    Object? addOnItemId = freezed,
    Object? addOnItemName = freezed,
    Object? addOnItemPrice = freezed,
    Object? quantity = freezed,
    Object? selected = freezed,
    Object? imageId = freezed,
    Object? filePath = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      addOnCategoryId: addOnCategoryId == freezed
          ? _value.addOnCategoryId
          : addOnCategoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      addOnItemId: addOnItemId == freezed
          ? _value.addOnItemId
          : addOnItemId // ignore: cast_nullable_to_non_nullable
              as String?,
      addOnItemName: addOnItemName == freezed
          ? _value.addOnItemName
          : addOnItemName // ignore: cast_nullable_to_non_nullable
              as String?,
      addOnItemPrice: addOnItemPrice == freezed
          ? _value.addOnItemPrice
          : addOnItemPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      selected: selected == freezed
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool?,
      imageId: imageId == freezed
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String?,
      filePath: filePath == freezed
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$AddOnItemCopyWith<$Res> implements $AddOnItemCopyWith<$Res> {
  factory _$AddOnItemCopyWith(
          _AddOnItem value, $Res Function(_AddOnItem) then) =
      __$AddOnItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? addOnCategoryId,
      String? addOnItemId,
      String? addOnItemName,
      double? addOnItemPrice,
      int quantity,
      bool? selected,
      String? imageId,
      String? filePath,
      String? imageUrl});
}

/// @nodoc
class __$AddOnItemCopyWithImpl<$Res> extends _$AddOnItemCopyWithImpl<$Res>
    implements _$AddOnItemCopyWith<$Res> {
  __$AddOnItemCopyWithImpl(_AddOnItem _value, $Res Function(_AddOnItem) _then)
      : super(_value, (v) => _then(v as _AddOnItem));

  @override
  _AddOnItem get _value => super._value as _AddOnItem;

  @override
  $Res call({
    Object? id = freezed,
    Object? addOnCategoryId = freezed,
    Object? addOnItemId = freezed,
    Object? addOnItemName = freezed,
    Object? addOnItemPrice = freezed,
    Object? quantity = freezed,
    Object? selected = freezed,
    Object? imageId = freezed,
    Object? filePath = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_AddOnItem(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      addOnCategoryId: addOnCategoryId == freezed
          ? _value.addOnCategoryId
          : addOnCategoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      addOnItemId: addOnItemId == freezed
          ? _value.addOnItemId
          : addOnItemId // ignore: cast_nullable_to_non_nullable
              as String?,
      addOnItemName: addOnItemName == freezed
          ? _value.addOnItemName
          : addOnItemName // ignore: cast_nullable_to_non_nullable
              as String?,
      addOnItemPrice: addOnItemPrice == freezed
          ? _value.addOnItemPrice
          : addOnItemPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      selected: selected == freezed
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool?,
      imageId: imageId == freezed
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String?,
      filePath: filePath == freezed
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddOnItem extends _AddOnItem {
  const _$_AddOnItem(
      {@JsonKey(name: '_id') this.id,
      this.addOnCategoryId,
      this.addOnItemId,
      this.addOnItemName,
      this.addOnItemPrice,
      this.quantity = 1,
      this.selected,
      this.imageId,
      this.filePath,
      this.imageUrl})
      : super._();

  factory _$_AddOnItem.fromJson(Map<String, dynamic> json) =>
      _$_$_AddOnItemFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? addOnCategoryId;
  @override
  final String? addOnItemId;
  @override
  final String? addOnItemName;
  @override
  final double? addOnItemPrice;
  @JsonKey(defaultValue: 1)
  @override
  final int quantity;
  @override
  final bool? selected;
  @override
  final String? imageId;
  @override
  final String? filePath;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'AddOnItem(id: $id, addOnCategoryId: $addOnCategoryId, addOnItemId: $addOnItemId, addOnItemName: $addOnItemName, addOnItemPrice: $addOnItemPrice, quantity: $quantity, selected: $selected, imageId: $imageId, filePath: $filePath, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddOnItem &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.addOnCategoryId, addOnCategoryId) ||
                const DeepCollectionEquality()
                    .equals(other.addOnCategoryId, addOnCategoryId)) &&
            (identical(other.addOnItemId, addOnItemId) ||
                const DeepCollectionEquality()
                    .equals(other.addOnItemId, addOnItemId)) &&
            (identical(other.addOnItemName, addOnItemName) ||
                const DeepCollectionEquality()
                    .equals(other.addOnItemName, addOnItemName)) &&
            (identical(other.addOnItemPrice, addOnItemPrice) ||
                const DeepCollectionEquality()
                    .equals(other.addOnItemPrice, addOnItemPrice)) &&
            (identical(other.quantity, quantity) ||
                const DeepCollectionEquality()
                    .equals(other.quantity, quantity)) &&
            (identical(other.selected, selected) ||
                const DeepCollectionEquality()
                    .equals(other.selected, selected)) &&
            (identical(other.imageId, imageId) ||
                const DeepCollectionEquality()
                    .equals(other.imageId, imageId)) &&
            (identical(other.filePath, filePath) ||
                const DeepCollectionEquality()
                    .equals(other.filePath, filePath)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(addOnCategoryId) ^
      const DeepCollectionEquality().hash(addOnItemId) ^
      const DeepCollectionEquality().hash(addOnItemName) ^
      const DeepCollectionEquality().hash(addOnItemPrice) ^
      const DeepCollectionEquality().hash(quantity) ^
      const DeepCollectionEquality().hash(selected) ^
      const DeepCollectionEquality().hash(imageId) ^
      const DeepCollectionEquality().hash(filePath) ^
      const DeepCollectionEquality().hash(imageUrl);

  @JsonKey(ignore: true)
  @override
  _$AddOnItemCopyWith<_AddOnItem> get copyWith =>
      __$AddOnItemCopyWithImpl<_AddOnItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AddOnItemToJson(this);
  }
}

abstract class _AddOnItem extends AddOnItem {
  const factory _AddOnItem(
      {@JsonKey(name: '_id') String? id,
      String? addOnCategoryId,
      String? addOnItemId,
      String? addOnItemName,
      double? addOnItemPrice,
      int quantity,
      bool? selected,
      String? imageId,
      String? filePath,
      String? imageUrl}) = _$_AddOnItem;
  const _AddOnItem._() : super._();

  factory _AddOnItem.fromJson(Map<String, dynamic> json) =
      _$_AddOnItem.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get addOnCategoryId => throw _privateConstructorUsedError;
  @override
  String? get addOnItemId => throw _privateConstructorUsedError;
  @override
  String? get addOnItemName => throw _privateConstructorUsedError;
  @override
  double? get addOnItemPrice => throw _privateConstructorUsedError;
  @override
  int get quantity => throw _privateConstructorUsedError;
  @override
  bool? get selected => throw _privateConstructorUsedError;
  @override
  String? get imageId => throw _privateConstructorUsedError;
  @override
  String? get filePath => throw _privateConstructorUsedError;
  @override
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AddOnItemCopyWith<_AddOnItem> get copyWith =>
      throw _privateConstructorUsedError;
}
