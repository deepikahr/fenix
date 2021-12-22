import 'package:fenix_user/models/api_response_models/product_details_response/product_details_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_list_state.freezed.dart';

@freezed
class ProductListState with _$ProductListState {
  const factory ProductListState({
    @Default(false) bool isLoading,
    String? categoryTitle,
    @Default([]) List<ProductDetailsResponse> products,
    @Default(0) int totalProducts,
    @Default(1) int pageNumber,
    @Default(false) productAdded,
  }) = _Default;
}
