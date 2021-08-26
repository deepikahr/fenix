import 'package:collection/collection.dart';
import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/cart/cart.dart';
import 'package:fenix_user/models/api_response_models/product_data_response/product_data_response.dart';
import 'package:fenix_user/models/api_response_models/product_details_response/product_details_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/providers/cart_notifier.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/product/product_list/product_list_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductListNotifier extends StateNotifier<ProductListState> {
  final ProviderReference ref;

  Cart? get cartState {
    return ref.read(cartProvider);
  }

  API get api {
    return ref.read(apiProvider);
  }

  DB get db {
    return ref.read(dbProvider);
  }

  CartNotifier get cartNotifier {
    return ref.read(cartProvider.notifier);
  }

  ProductListNotifier(
    this.ref,
  ) : super(ProductListState());

  Future<ProductDataResponse?> fetchProductData(String categoryId) async {
    state = state.copyWith.call(isLoading: true);
    final response = await api.productList(categoryId);
    if (ref.mounted) {
      state = state.copyWith.call(
        categoryTitle: response?.categoryTitle,
        products: response?.product?.data ?? [],
        totalProducts: response?.product?.total ?? 0,
        isLoading: false,
      );
      _updateProducts(cartState?.products ?? []);
    }
  }

  Future<void> addOrRemoveProduct(
      ProductDetailsResponse product, bool isIncreased) async {
    if (cartState == null) {
      await _createCartWithFirstProduct(product);
    } else if (cartState?.products.any((element) => element.id != product.id) ??
        false) {
      await _addProductInExistingCart(product);
    } else {
      await _updateQuantityOfLastVariant(product, isIncreased);
    }
  }

  Future<void> _createCartWithFirstProduct(
      ProductDetailsResponse product) async {
    product = product.copyWith.call(
      variantQuantity: 1,
      isLastUsedVariant: true,
      totalProductPrice: product.variant?.price ?? 0,
    );
    final cart = Cart(
      franchiseId: product.franchiseId,
      franchiseName: product.franchiseName,
      vendorId: product.vendorId,
      restaurantName: product.restaurantName,
      userId: db.getId(),
      products: [product],
    );
    _updateProducts(cart.products);
    await cartNotifier.updateCart(cart);
  }

  Future<void> _addProductInExistingCart(ProductDetailsResponse product) async {
    final totalPrice = product.variant?.price ?? 0;
    var newCart = cartState?.copyWith.call(
      products: [
        ...cartState?.products ?? [],
        product.copyWith.call(
          variantQuantity: 1,
          isLastUsedVariant: true,
          totalProductPrice: totalPrice,
        ),
      ],
    );
    _updateProducts(newCart?.products ?? []);
    await cartNotifier.updateCart(newCart);
  }

  Future<void> _updateQuantityOfLastVariant(
    ProductDetailsResponse product,
    bool isIncreased,
  ) async {
    final p = cartState?.products.singleWhereOrNull(
      (e) => e.id == product.id && e.isLastUsedVariant,
    );

    if (p != null) {
      final i = cartState!.products.indexOf(p);

      final newProduct = p.copyWith
          .call(variantQuantity: p.variantQuantity + (isIncreased ? 1 : -1));

      if (newProduct.variantQuantity > 0) {
        final newProducts = cartState!.products..[i] = newProduct;
        Cart? newCart = cartState!.copyWith(products: newProducts);
        _updateProducts(newCart.products);
        await cartNotifier.updateCart(newCart);
      } else {
        final newCart = cartState!.copyWith(
          products: (cartState!.products..remove(p)),
        );
        _updateProducts(newCart.products);
        await cartNotifier.updateCart(newCart);
        if (newCart.products.isEmpty) {
          await cartNotifier.deleteCart();
        }
      }
    }
  }

  void _updateProducts(List<ProductDetailsResponse> cartProducts) {
    final newCartProducts =
        cartProducts.isEmpty ? (cartState?.products ?? []) : cartProducts;

    final newProducts = state.products.map((p) {
      final totalQuantity = (newCartProducts.isNotEmpty)
          ? newCartProducts
              .map((cp) => cp.id == p.id ? cp.variantQuantity : 0)
              .reduce((_, __) => _ + __)
          : 0;
      final isSameProductMultipleTimes = (newCartProducts.isNotEmpty)
          ? newCartProducts.any((cp) =>
              cp.id == p.id &&
              (cp.sizeName != p.sizeName ||
                  !cp.selectedAddOnItems.equals(p.selectedAddOnItems)))
          : false;
      return p.copyWith(
        totalQuantity: totalQuantity,
        isSameProductMultipleTime: isSameProductMultipleTimes,
        modified: cartState != null,
      );
    }).toList();

    state = state.copyWith.call(products: newProducts);
  }
}
