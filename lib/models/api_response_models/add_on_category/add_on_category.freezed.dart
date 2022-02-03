// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'add_on_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddOnCategory _$AddOnCategoryFromJson(Map<String, dynamic> json) {
  return _AddOnCategory.fromJson(json);
}

/// @nodoc
class _$AddOnCategoryTearOff {
  const _$AddOnCategoryTearOff();

  _AddOnCategory call(
      {@JsonKey(name: '_id') String? id,
      String? addOnCategoryId,
      String? addOnCategoryName,
      SELECTION_TYPE? selectionType,
      bool? allItemSelected,
      @JsonKey(name: 'required') bool? isRequired,
      List<AddOnItem> addOnItems = const [],
      int? selectionValue}) {
    return _AddOnCategory(
      id: id,
      addOnCategoryId: addOnCategoryId,
      addOnCategoryName: addOnCategoryName,
      selectionType: selectionType,
      allItemSelected: allItemSelected,
      isRequired: isRequired,
      addOnItems: addOnItems,
      selectionValue: selectionValue,
    );
  }

  AddOnCategory fromJson(Map<String, Object> json) {
    return AddOnCategory.fromJson(json);
  }
}

/// @nodoc
const $AddOnCategory = _$AddOnCategoryTearOff();

/// @nodoc
mixin _$AddOnCategory {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get addOnCategoryId => throw _privateConstructorUsedError;
  String? get addOnCategoryName => throw _privateConstructorUsedError;
  SELECTION_TYPE? get selectionType => throw _privateConstructorUsedError;
  bool? get allItemSelected => throw _privateConstructorUsedError;
  @JsonKey(name: 'required')
  bool? get isRequired => throw _privateConstructorUsedError;
  List<AddOnItem> get addOnItems => throw _privateConstructorUsedError;
  int? get selectionValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddOnCategoryCopyWith<AddOnCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddOnCategoryCopyWith<$Res> {
  factory $AddOnCategoryCopyWith(
          AddOnCategory value, $Res Function(AddOnCategory) then) =
      _$AddOnCategoryCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? addOnCategoryId,
      String? addOnCategoryName,
      SELECTION_TYPE? selectionType,
      bool? allItemSelected,
      @JsonKey(name: 'required') bool? isRequired,
      List<AddOnItem> addOnItems,
      int? selectionValue});
}

/// @nodoc
class _$AddOnCategoryCopyWithImpl<$Res>
    implements $AddOnCategoryCopyWith<$Res> {
  _$AddOnCategoryCopyWithImpl(this._value, this._then);

  final AddOnCategory _value;
  // ignore: unused_field
  final $Res Function(AddOnCategory) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? addOnCategoryId = freezed,
    Object? addOnCategoryName = freezed,
    Object? selectionType = freezed,
    Object? allItemSelected = freezed,
    Object? isRequired = freezed,
    Object? addOnItems = freezed,
    Object? selectionValue = freezed,
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
      addOnCategoryName: addOnCategoryName == freezed
          ? _value.addOnCategoryName
          : addOnCategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      selectionType: selectionType == freezed
          ? _value.selectionType
          : selectionType // ignore: cast_nullable_to_non_nullable
              as SELECTION_TYPE?,
      allItemSelected: allItemSelected == freezed
          ? _value.allItemSelected
          : allItemSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
      isRequired: isRequired == freezed
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      addOnItems: addOnItems == freezed
          ? _value.addOnItems
          : addOnItems // ignore: cast_nullable_to_non_nullable
              as List<AddOnItem>,
      selectionValue: selectionValue == freezed
          ? _value.selectionValue
          : selectionValue // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$AddOnCategoryCopyWith<$Res>
    implements $AddOnCategoryCopyWith<$Res> {
  factory _$AddOnCategoryCopyWith(
          _AddOnCategory value, $Res Function(_AddOnCategory) then) =
      __$AddOnCategoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? addOnCategoryId,
      String? addOnCategoryName,
      SELECTION_TYPE? selectionType,
      bool? allItemSelected,
      @JsonKey(name: 'required') bool? isRequired,
      List<AddOnItem> addOnItems,
      int? selectionValue});
}

/// @nodoc
class __$AddOnCategoryCopyWithImpl<$Res>
    extends _$AddOnCategoryCopyWithImpl<$Res>
    implements _$AddOnCategoryCopyWith<$Res> {
  __$AddOnCategoryCopyWithImpl(
      _AddOnCategory _value, $Res Function(_AddOnCategory) _then)
      : super(_value, (v) => _then(v as _AddOnCategory));

  @override
  _AddOnCategory get _value => super._value as _AddOnCategory;

  @override
  $Res call({
    Object? id = freezed,
    Object? addOnCategoryId = freezed,
    Object? addOnCategoryName = freezed,
    Object? selectionType = freezed,
    Object? allItemSelected = freezed,
    Object? isRequired = freezed,
    Object? addOnItems = freezed,
    Object? selectionValue = freezed,
  }) {
    return _then(_AddOnCategory(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      addOnCategoryId: addOnCategoryId == freezed
          ? _value.addOnCategoryId
          : addOnCategoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      addOnCategoryName: addOnCategoryName == freezed
          ? _value.addOnCategoryName
          : addOnCategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      selectionType: selectionType == freezed
          ? _value.selectionType
          : selectionType // ignore: cast_nullable_to_non_nullable
              as SELECTION_TYPE?,
      allItemSelected: allItemSelected == freezed
          ? _value.allItemSelected
          : allItemSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
      isRequired: isRequired == freezed
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      addOnItems: addOnItems == freezed
          ? _value.addOnItems
          : addOnItems // ignore: cast_nullable_to_non_nullable
              as List<AddOnItem>,
      selectionValue: selectionValue == freezed
          ? _value.selectionValue
          : selectionValue // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddOnCategory extends _AddOnCategory {
  const _$_AddOnCategory(
      {@JsonKey(name: '_id') this.id,
      this.addOnCategoryId,
      this.addOnCategoryName,
      this.selectionType,
      this.allItemSelected,
      @JsonKey(name: 'required') this.isRequired,
      this.addOnItems = const [],
      this.selectionValue})
      : super._();

  factory _$_AddOnCategory.fromJson(Map<String, dynamic> json) =>
      _$_$_AddOnCategoryFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? addOnCategoryId;
  @override
  final String? addOnCategoryName;
  @override
  final SELECTION_TYPE? selectionType;
  @override
  final bool? allItemSelected;
  @override
  @JsonKey(name: 'required')
  final bool? isRequired;
  @JsonKey(defaultValue: const [])
  @override
  final List<AddOnItem> addOnItems;
  @override
  final int? selectionValue;

  @override
  String toString() {
    return 'AddOnCategory(id: $id, addOnCategoryId: $addOnCategoryId, addOnCategoryName: $addOnCategoryName, selectionType: $selectionType, allItemSelected: $allItemSelected, isRequired: $isRequired, addOnItems: $addOnItems, selectionValue: $selectionValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddOnCategory &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.addOnCategoryId, addOnCategoryId) ||
                const DeepCollectionEquality()
                    .equals(other.addOnCategoryId, addOnCategoryId)) &&
            (identical(other.addOnCategoryName, addOnCategoryName) ||
                const DeepCollectionEquality()
                    .equals(other.addOnCategoryName, addOnCategoryName)) &&
            (identical(other.selectionType, selectionType) ||
                const DeepCollectionEquality()
                    .equals(other.selectionType, selectionType)) &&
            (identical(other.allItemSelected, allItemSelected) ||
                const DeepCollectionEquality()
                    .equals(other.allItemSelected, allItemSelected)) &&
            (identical(other.isRequired, isRequired) ||
                const DeepCollectionEquality()
                    .equals(other.isRequired, isRequired)) &&
            (identical(other.addOnItems, addOnItems) ||
                const DeepCollectionEquality()
                    .equals(other.addOnItems, addOnItems)) &&
            (identical(other.selectionValue, selectionValue) ||
                const DeepCollectionEquality()
                    .equals(other.selectionValue, selectionValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(addOnCategoryId) ^
      const DeepCollectionEquality().hash(addOnCategoryName) ^
      const DeepCollectionEquality().hash(selectionType) ^
      const DeepCollectionEquality().hash(allItemSelected) ^
      const DeepCollectionEquality().hash(isRequired) ^
      const DeepCollectionEquality().hash(addOnItems) ^
      const DeepCollectionEquality().hash(selectionValue);

  @JsonKey(ignore: true)
  @override
  _$AddOnCategoryCopyWith<_AddOnCategory> get copyWith =>
      __$AddOnCategoryCopyWithImpl<_AddOnCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AddOnCategoryToJson(this);
  }
}

abstract class _AddOnCategory extends AddOnCategory {
  const factory _AddOnCategory(
      {@JsonKey(name: '_id') String? id,
      String? addOnCategoryId,
      String? addOnCategoryName,
      SELECTION_TYPE? selectionType,
      bool? allItemSelected,
      @JsonKey(name: 'required') bool? isRequired,
      List<AddOnItem> addOnItems,
      int? selectionValue}) = _$_AddOnCategory;
  const _AddOnCategory._() : super._();

  factory _AddOnCategory.fromJson(Map<String, dynamic> json) =
      _$_AddOnCategory.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get addOnCategoryId => throw _privateConstructorUsedError;
  @override
  String? get addOnCategoryName => throw _privateConstructorUsedError;
  @override
  SELECTION_TYPE? get selectionType => throw _privateConstructorUsedError;
  @override
  bool? get allItemSelected => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'required')
  bool? get isRequired => throw _privateConstructorUsedError;
  @override
  List<AddOnItem> get addOnItems => throw _privateConstructorUsedError;
  @override
  int? get selectionValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AddOnCategoryCopyWith<_AddOnCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
