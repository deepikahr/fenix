import 'package:collection/collection.dart';
import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/cart/cart.dart';
import 'package:fenix_user/models/api_response_models/add_on_category/add_on_category.dart';
import 'package:fenix_user/models/api_response_models/add_on_item/add_on_item.dart';
import 'package:fenix_user/models/api_response_models/product_details_response/product_details_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/providers/cart_notifier.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/product/product_details/product_details_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductDetailsNotifier extends StateNotifier<ProductDetailsState> {
  final ProviderReference ref;

  API get api {
    return ref.read(apiProvider);
  }

  DB get db {
    return ref.read(dbProvider);
  }

  Cart? get cartState {
    return ref.read(cartProvider);
  }

  CartNotifier get cartNotifier {
    return ref.read(cartProvider.notifier);
  }

  ProductDetailsNotifier(this.ref)
      : super(ProductDetailsState(selectedAddOnItems: <AddOnItem>{}));

  Future<void> fetchProductDetails(String productId) async {
    state = state.copyWith.call(isLoading: true);
    final res = await api.productDetails(productId);
    if (ref.mounted)
      state = state.copyWith.call(
        isLoading: false,
        productDetails: res,
      );
  }

  void showAddButton(bool value) {
    state = state.copyWith(showAddButton: value);
  }

  void showCounter(bool value) {
    state = state.copyWith(showCounter: value);
  }

  void onSizeSelect(int value) {
    state = state.copyWith(groupValue: value);
  }

  void addSelectedAddOnItem(AddOnItem addOnItem, AddOnCategory addOnCategory) {
    state = state.copyWith
        .call(selectedAddOnItems: state.selectedAddOnItems?..add(addOnItem));
  }

  void removeAddOnItem(AddOnItem addOnItem) {
    state = state.copyWith
        .call(selectedAddOnItems: state.selectedAddOnItems?..remove(addOnItem));
  }

  void onSelectLanguage(String value) {
    state = state.copyWith(selectedLanguage: value);
  }

  Future<void> addProduct(
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
    _updateProduct(cart.products);
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
    _updateProduct(newCart?.products ?? []);
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
        _updateProduct(newCart.products);
        await cartNotifier.updateCart(newCart);
      } else {
        final newCart = cartState!.copyWith(
          products: (cartState!.products..remove(p)),
        );
        _updateProduct(newCart.products);
        await cartNotifier.updateCart(newCart);
        if (newCart.products.isEmpty) {
          await cartNotifier.deleteCart();
        }
      }
    }
  }

  void _updateProduct(List<ProductDetailsResponse> cartProducts) {
    final newCartProducts =
        cartProducts.isEmpty ? (cartState?.products ?? []) : cartProducts;

    final totalQuantity = (newCartProducts.isNotEmpty)
        ? newCartProducts
            .map((cp) =>
                cp.id == state.productDetails?.id ? cp.variantQuantity : 0)
            .reduce((_, __) => _ + __)
        : 0;
    final isSameProductMultipleTimes = (newCartProducts.isNotEmpty)
        ? newCartProducts.any((cp) =>
            cp.id == state.productDetails?.id &&
            (cp.sizeName != state.productDetails?.sizeName ||
                !cp.selectedAddOnItems
                    .equals(state.productDetails?.selectedAddOnItems ?? [])))
        : false;
    if (state.productDetails != null) {
      state = state.copyWith.productDetails!(
        totalQuantity: totalQuantity,
        isSameProductMultipleTime: isSameProductMultipleTimes,
        modified: cartState != null,
      );
    }
  }
}
