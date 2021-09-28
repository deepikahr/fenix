// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'sub_category_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubCategoryResponse _$SubCategoryResponseFromJson(Map<String, dynamic> json) {
  return _SubCategoryResponse.fromJson(json);
}

/// @nodoc
class _$SubCategoryResponseTearOff {
  const _$SubCategoryResponseTearOff();

  _SubCategoryResponse call(
      {bool status = false,
      @JsonKey(name: '_id') String? id,
      FranchiseModel? franchiseId,
      String? title,
      String? description,
      String? imageUrl,
      String? imageId,
      String? filePath,
      MenuResponse? menuId,
      String? categoryId,
      String? categoryName,
      String? franchiseName}) {
    return _SubCategoryResponse(
      status: status,
      id: id,
      franchiseId: franchiseId,
      title: title,
      description: description,
      imageUrl: imageUrl,
      imageId: imageId,
      filePath: filePath,
      menuId: menuId,
      categoryId: categoryId,
      categoryName: categoryName,
      franchiseName: franchiseName,
    );
  }

  SubCategoryResponse fromJson(Map<String, Object> json) {
    return SubCategoryResponse.fromJson(json);
  }
}

/// @nodoc
const $SubCategoryResponse = _$SubCategoryResponseTearOff();

/// @nodoc
mixin _$SubCategoryResponse {
  bool get status => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  FranchiseModel? get franchiseId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get imageId => throw _privateConstructorUsedError;
  String? get filePath => throw _privateConstructorUsedError;
  MenuResponse? get menuId => throw _privateConstructorUsedError;
  String? get categoryId => throw _privateConstructorUsedError;
  String? get categoryName => throw _privateConstructorUsedError;
  String? get franchiseName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubCategoryResponseCopyWith<SubCategoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubCategoryResponseCopyWith<$Res> {
  factory $SubCategoryResponseCopyWith(
          SubCategoryResponse value, $Res Function(SubCategoryResponse) then) =
      _$SubCategoryResponseCopyWithImpl<$Res>;
  $Res call(
      {bool status,
      @JsonKey(name: '_id') String? id,
      FranchiseModel? franchiseId,
      String? title,
      String? description,
      String? imageUrl,
      String? imageId,
      String? filePath,
      MenuResponse? menuId,
      String? categoryId,
      String? categoryName,
      String? franchiseName});

  $FranchiseModelCopyWith<$Res>? get franchiseId;
  $MenuResponseCopyWith<$Res>? get menuId;
}

/// @nodoc
class _$SubCategoryResponseCopyWithImpl<$Res>
    implements $SubCategoryResponseCopyWith<$Res> {
  _$SubCategoryResponseCopyWithImpl(this._value, this._then);

  final SubCategoryResponse _value;
  // ignore: unused_field
  final $Res Function(SubCategoryResponse) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? id = freezed,
    Object? franchiseId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? imageId = freezed,
    Object? filePath = freezed,
    Object? menuId = freezed,
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? franchiseName = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      franchiseId: franchiseId == freezed
          ? _value.franchiseId
          : franchiseId // ignore: cast_nullable_to_non_nullable
              as FranchiseModel?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageId: imageId == freezed
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String?,
      filePath: filePath == freezed
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
      menuId: menuId == freezed
          ? _value.menuId
          : menuId // ignore: cast_nullable_to_non_nullable
              as MenuResponse?,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      franchiseName: franchiseName == freezed
          ? _value.franchiseName
          : franchiseName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $FranchiseModelCopyWith<$Res>? get franchiseId {
    if (_value.franchiseId == null) {
      return null;
    }

    return $FranchiseModelCopyWith<$Res>(_value.franchiseId!, (value) {
      return _then(_value.copyWith(franchiseId: value));
    });
  }

  @override
  $MenuResponseCopyWith<$Res>? get menuId {
    if (_value.menuId == null) {
      return null;
    }

    return $MenuResponseCopyWith<$Res>(_value.menuId!, (value) {
      return _then(_value.copyWith(menuId: value));
    });
  }
}

/// @nodoc
abstract class _$SubCategoryResponseCopyWith<$Res>
    implements $SubCategoryResponseCopyWith<$Res> {
  factory _$SubCategoryResponseCopyWith(_SubCategoryResponse value,
          $Res Function(_SubCategoryResponse) then) =
      __$SubCategoryResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool status,
      @JsonKey(name: '_id') String? id,
      FranchiseModel? franchiseId,
      String? title,
      String? description,
      String? imageUrl,
      String? imageId,
      String? filePath,
      MenuResponse? menuId,
      String? categoryId,
      String? categoryName,
      String? franchiseName});

  @override
  $FranchiseModelCopyWith<$Res>? get franchiseId;
  @override
  $MenuResponseCopyWith<$Res>? get menuId;
}

/// @nodoc
class __$SubCategoryResponseCopyWithImpl<$Res>
    extends _$SubCategoryResponseCopyWithImpl<$Res>
    implements _$SubCategoryResponseCopyWith<$Res> {
  __$SubCategoryResponseCopyWithImpl(
      _SubCategoryResponse _value, $Res Function(_SubCategoryResponse) _then)
      : super(_value, (v) => _then(v as _SubCategoryResponse));

  @override
  _SubCategoryResponse get _value => super._value as _SubCategoryResponse;

  @override
  $Res call({
    Object? status = freezed,
    Object? id = freezed,
    Object? franchiseId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? imageId = freezed,
    Object? filePath = freezed,
    Object? menuId = freezed,
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? franchiseName = freezed,
  }) {
    return _then(_SubCategoryResponse(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      franchiseId: franchiseId == freezed
          ? _value.franchiseId
          : franchiseId // ignore: cast_nullable_to_non_nullable
              as FranchiseModel?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageId: imageId == freezed
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String?,
      filePath: filePath == freezed
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
      menuId: menuId == freezed
          ? _value.menuId
          : menuId // ignore: cast_nullable_to_non_nullable
              as MenuResponse?,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      franchiseName: franchiseName == freezed
          ? _value.franchiseName
          : franchiseName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SubCategoryResponse extends _SubCategoryResponse {
  const _$_SubCategoryResponse(
      {this.status = false,
      @JsonKey(name: '_id') this.id,
      this.franchiseId,
      this.title,
      this.description,
      this.imageUrl,
      this.imageId,
      this.filePath,
      this.menuId,
      this.categoryId,
      this.categoryName,
      this.franchiseName})
      : super._();

  factory _$_SubCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_SubCategoryResponseFromJson(json);

  @JsonKey(defaultValue: false)
  @override
  final bool status;
  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final FranchiseModel? franchiseId;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? imageUrl;
  @override
  final String? imageId;
  @override
  final String? filePath;
  @override
  final MenuResponse? menuId;
  @override
  final String? categoryId;
  @override
  final String? categoryName;
  @override
  final String? franchiseName;

  @override
  String toString() {
    return 'SubCategoryResponse(status: $status, id: $id, franchiseId: $franchiseId, title: $title, description: $description, imageUrl: $imageUrl, imageId: $imageId, filePath: $filePath, menuId: $menuId, categoryId: $categoryId, categoryName: $categoryName, franchiseName: $franchiseName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SubCategoryResponse &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.franchiseId, franchiseId) ||
                const DeepCollectionEquality()
                    .equals(other.franchiseId, franchiseId)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.imageId, imageId) ||
                const DeepCollectionEquality()
                    .equals(other.imageId, imageId)) &&
            (identical(other.filePath, filePath) ||
                const DeepCollectionEquality()
                    .equals(other.filePath, filePath)) &&
            (identical(other.menuId, menuId) ||
                const DeepCollectionEquality().equals(other.menuId, menuId)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.categoryName, categoryName) ||
                const DeepCollectionEquality()
                    .equals(other.categoryName, categoryName)) &&
            (identical(other.franchiseName, franchiseName) ||
                const DeepCollectionEquality()
                    .equals(other.franchiseName, franchiseName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(franchiseId) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(imageId) ^
      const DeepCollectionEquality().hash(filePath) ^
      const DeepCollectionEquality().hash(menuId) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(categoryName) ^
      const DeepCollectionEquality().hash(franchiseName);

  @JsonKey(ignore: true)
  @override
  _$SubCategoryResponseCopyWith<_SubCategoryResponse> get copyWith =>
      __$SubCategoryResponseCopyWithImpl<_SubCategoryResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SubCategoryResponseToJson(this);
  }
}

abstract class _SubCategoryResponse extends SubCategoryResponse {
  const factory _SubCategoryResponse(
      {bool status,
      @JsonKey(name: '_id') String? id,
      FranchiseModel? franchiseId,
      String? title,
      String? description,
      String? imageUrl,
      String? imageId,
      String? filePath,
      MenuResponse? menuId,
      String? categoryId,
      String? categoryName,
      String? franchiseName}) = _$_SubCategoryResponse;
  const _SubCategoryResponse._() : super._();

  factory _SubCategoryResponse.fromJson(Map<String, dynamic> json) =
      _$_SubCategoryResponse.fromJson;

  @override
  bool get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @override
  FranchiseModel? get franchiseId => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  String? get imageId => throw _privateConstructorUsedError;
  @override
  String? get filePath => throw _privateConstructorUsedError;
  @override
  MenuResponse? get menuId => throw _privateConstructorUsedError;
  @override
  String? get categoryId => throw _privateConstructorUsedError;
  @override
  String? get categoryName => throw _privateConstructorUsedError;
  @override
  String? get franchiseName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SubCategoryResponseCopyWith<_SubCategoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
