import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/add_on_item/add_on_item.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'productDetailsState.dart';

class ProductDetailsStateNotifier extends StateNotifier<ProductDetailsState> {
  final API api;
  final DB db;
  ProductDetailsStateNotifier(this.api, this.db) : super(ProductDetailsState(isLoading: true));

  Future<void> fetchProductDetails(String productId) async {
    state = state.copyWith.call(isLoading: true);
    final res = await api.productDetails(productId);
    state = state.copyWith.call(
      isLoading: false,
      productDetails: res,
    );
  }

  void onSizeSelect(value) {
    state = state.copyWith(groupValue: value);
  }

  void addSelectedAddOnItem(AddOnItem addOnItem) {
    state = state.copyWith
        .call(selectedAddOnItems: state.selectedAddOnItems?..add(addOnItem));
  }

  void removeAddOnItem(AddOnItem addOnItem) {
    state = state.copyWith
        .call(selectedAddOnItems: state.selectedAddOnItems?..remove(addOnItem));
  }

}
