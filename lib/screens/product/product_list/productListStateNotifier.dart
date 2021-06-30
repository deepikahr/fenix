import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/product_data_response/product_data_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'productListState.dart';

class ProductListStateNotifier extends StateNotifier<ProductListState> {
  final API api;
  final DB db;
  ProductListStateNotifier(this.api, this.db) : super(ProductListState(isLoading: true));

  Future<ProductDataResponse?> fetchProductData(String? categoryId) async {
    state = state.copyWith.call(isLoading: true);
    final response = await api.productList(categoryId);
    state = state.copyWith.call(
      categoryTitle: response!.categoryTitle,
      productData: response.product,
      products: response.product!.data,
      productTotal: response.product!.total ,
      isLoading: false,
    );
  }

}
