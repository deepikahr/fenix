import 'package:fenix_user/models/api_response_models/category_response/category_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'category.dart';

part 'category_state.freezed.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState({
    @Default(false) bool isLoading,
    @Default(CATEGORY_TYPE.foodCategory) CATEGORY_TYPE type,
    @Default([]) List<CategoryResponse> category,
    @Default(0) int total,
    @Default(1) int pageNumber,
  }) = _Default;
}
