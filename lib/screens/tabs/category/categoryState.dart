import 'package:fenix_user/models/api_response_models/category_response/category_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categoryState.freezed.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState(
      {@Default(false) bool isLoading,
      @Default([]) List<CategoryResponse>? category}) = _Default;
}
