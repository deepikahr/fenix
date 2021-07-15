import 'package:fenix_user/models/api_response_models/add_on_item/add_on_item.dart';
import 'package:fenix_user/models/api_response_models/product_details_response/product_details_response.dart';
import 'package:fenix_user/models/api_response_models/product_model/product_model.dart';
import 'package:fenix_user/models/api_response_models/product_response/product_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'productListState.freezed.dart';

@freezed
class ProductListState with _$ProductListState {
  const factory ProductListState({
    @Default(false) bool isLoading,
    String? categoryTitle,
    ProductModel? productData,
    List<ProductDetailsResponse>? products,
    int? productTotal,
    Set<AddOnItem>? selectedAddOnItems,
    @Default(0) int groupValue,
  }) = _Default;
}
