import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:restaurant_saas/models/api_response_models/product/product.dart';
import 'package:restaurant_saas/network/api_service.dart';

import 'product_ratingState.dart';

class ProductRatingStateNotifier extends StateNotifier<ProductRatingState> {
  final API api;
  ProductRatingStateNotifier(this.api) : super(ProductRatingState());

  void onProductSelect() {
    state = state.copyWith(showProductRating: true);
  }

  void onRating(value) {
    state = state.copyWith(rating: value);
  }

  void setProductRating(Product? productData) {
    state = state.copyWith.call(rating: productData?.rate ?? 0.0);
  }

  Future<String?> submitMenu(double rate, String rateDescription,
      String? orderId, String? productId, String? sizeName) async {
    state = state.copyWith(showProductRating: true);

    final response = await api.saveMenuRating(
        rate, rateDescription, orderId, productId, sizeName);

    state = state.copyWith.call(showProductRating: false);

    return response;
  }
}
