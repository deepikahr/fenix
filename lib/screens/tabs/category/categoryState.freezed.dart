// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'categoryState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CategoryStateTearOff {
  const _$CategoryStateTearOff();

  _Default call(
      {bool isLoading = false,
      List<CategoryResponse>? category = const [],
      int currentIndex = 1}) {
    return _Default(
      isLoading: isLoading,
      category: category,
      currentIndex: currentIndex,
    );
  }
}

/// @nodoc
const $CategoryState = _$CategoryStateTearOff();

/// @nodoc
mixin _$CategoryState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<CategoryResponse>? get category => throw _privateConstructorUsedError;
  int get currentIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryStateCopyWith<CategoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryStateCopyWith<$Res> {
  factory $CategoryStateCopyWith(
          CategoryState value, $Res Function(CategoryState) then) =
      _$CategoryStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading, List<CategoryResponse>? category, int currentIndex});
}

/// @nodoc
class _$CategoryStateCopyWithImpl<$Res>
    implements $CategoryStateCopyWith<$Res> {
  _$CategoryStateCopyWithImpl(this._value, this._then);

  final CategoryState _value;
  // ignore: unused_field
  final $Res Function(CategoryState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? category = freezed,
    Object? currentIndex = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<CategoryResponse>?,
      currentIndex: currentIndex == freezed
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$DefaultCopyWith<$Res> implements $CategoryStateCopyWith<$Res> {
  factory _$DefaultCopyWith(_Default value, $Res Function(_Default) then) =
      __$DefaultCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading, List<CategoryResponse>? category, int currentIndex});
}

/// @nodoc
class __$DefaultCopyWithImpl<$Res> extends _$CategoryStateCopyWithImpl<$Res>
    implements _$DefaultCopyWith<$Res> {
  __$DefaultCopyWithImpl(_Default _value, $Res Function(_Default) _then)
      : super(_value, (v) => _then(v as _Default));

  @override
  _Default get _value => super._value as _Default;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? category = freezed,
    Object? currentIndex = freezed,
  }) {
    return _then(_Default(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<CategoryResponse>?,
      currentIndex: currentIndex == freezed
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Default implements _Default {
  const _$_Default(
      {this.isLoading = false,
      this.category = const [],
      this.currentIndex = 1});

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @JsonKey(defaultValue: const [])
  @override
  final List<CategoryResponse>? category;
  @JsonKey(defaultValue: 1)
  @override
  final int currentIndex;

  @override
  String toString() {
    return 'CategoryState(isLoading: $isLoading, category: $category, currentIndex: $currentIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Default &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.currentIndex, currentIndex) ||
                const DeepCollectionEquality()
                    .equals(other.currentIndex, currentIndex)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(currentIndex);

  @JsonKey(ignore: true)
  @override
  _$DefaultCopyWith<_Default> get copyWith =>
      __$DefaultCopyWithImpl<_Default>(this, _$identity);
}

abstract class _Default implements CategoryState {
  const factory _Default(
      {bool isLoading,
      List<CategoryResponse>? category,
      int currentIndex}) = _$_Default;

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  List<CategoryResponse>? get category => throw _privateConstructorUsedError;
  @override
  int get currentIndex => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DefaultCopyWith<_Default> get copyWith =>
      throw _privateConstructorUsedError;
}
