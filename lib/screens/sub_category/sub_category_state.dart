import 'package:fenix_user/models/api_response_models/sub_category_response/sub_category_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_category_state.freezed.dart';

@freezed
class SubCategoryState with _$SubCategoryState {
  const factory SubCategoryState({
    @Default(false) bool isLoading,
    @Default([]) List<SubCategoryResponse> subCategory,
    @Default(0) int total,
    @Default(1) int pageNumber,
  }) = _Default;
}
