import 'package:fenix_user/models/api_response_models/add_on_item/add_on_item.dart';
import 'package:fenix_user/models/api_response_models/product_details_response/product_details_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'productDetailsState.freezed.dart';

@freezed
class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState(
      {@Default(false) bool isLoading,
      ProductDetailsResponse? productDetails,
      Set<AddOnItem>? selectedAddOnItems,
      @Default(0) int groupValue,
      @Default(false) bool showAddButton,
      @Default(false) bool showCounter,
      String? selectedLanguage}) = _Default;
}
