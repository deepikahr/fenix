import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/add_on_item/add_on_item.dart';
import 'package:restaurant_saas/models/api_response_models/product_details_response/product_details_response.dart';

part 'productSelectionState.freezed.dart';

@freezed
class ProductSelectionState with _$ProductSelectionState {
  const factory ProductSelectionState({
    @Default(true) bool isLoading,
    @Default(true) bool showSizeTab,
    @Default(false) bool showExtraTab,
    Set<AddOnItem>? selectedAddOnItems,
    @Default(0) int groupValue,
    @Default(0) double highestPrice,
    @Default(0) double leastPrice,
    ProductDetailsResponse? productDetails,
    String? currencySymbol,
  }) = _Default;
}
