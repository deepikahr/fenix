import 'dart:developer';

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

  Future<ProductDetailsResponse?> fetchProductDetails(String productId) async {
    state = state.copyWith.call(isLoading: true);
    final res = await api.productDetails(productId);
    if (ref.mounted) {
      state = state.copyWith.call(
        isLoading: false,
        productDetails: res,
        groupValue: res?.variants.indexWhere((v) => v.isDefaultVariant) ?? 0,
      );
      _updateProduct(cartState?.products ?? []);
    }
    return res;
  }

  void showAddButton(bool value) {
    print(value);
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
    } else if (cartState?.products.any((element) =>
            element.id == product.id &&
            element.variant?.sizeName ==
                product.variants[state.groupValue].sizeName &&
            element.selectedAddOnItems
                .equals(state.selectedAddOnItems?.toList() ?? [])) ??
        false) {
      await _updateQuantityOfLastVariant(product, isIncreased);
    } else {
      await _addProductInExistingCart(product);
    }
  }

  Future<void> _createCartWithFirstProduct(
      ProductDetailsResponse product) async {
    product = product.copyWith.call(
      variantQuantity: 1,
      isLastUsedVariant: true,
      totalProductPrice: (product.variants[state.groupValue].price) +
          ((state.selectedAddOnItems!.toList().isNotEmpty)
              ? state.selectedAddOnItems!
                  .toList()
                  .map((saot) => ((saot.addOnItemPrice ?? 0) * saot.quantity))
                  .reduce((_, __) => _ + __)
              : 0),
      variant: product.variants[state.groupValue],
      selectedAddOnItems: state.selectedAddOnItems?.toList() ?? [],
    );
    final cart = Cart(
      franchiseId: product.franchiseId,
      franchiseName: product.franchiseName,
      vendorId: product.vendorId,
      restaurantName: product.restaurantName,
      userId: db.getId(),
      products: [product],
    );
    state = state.copyWith(productDetails: product);
    _updateProduct(cart.products);
    await cartNotifier.updateCart(cart);
  }

  Future<void> _addProductInExistingCart(ProductDetailsResponse product) async {
    final totalPrice = (product.variants[state.groupValue].price) +
        ((state.selectedAddOnItems!.toList().isNotEmpty)
            ? state.selectedAddOnItems!
                .toList()
                .map((i) => ((i.addOnItemPrice ?? 0) * i.quantity))
                .reduce((_, __) => _ + __)
            : 0);
    final data = cartState?.copyWith(
        products: cartState!.products.map((p) {
      if (p.id == product.id) {
        return p.copyWith(isLastUsedVariant: false);
      } else {
        return p;
      }
    }).toList());

    var newCart = data?.copyWith.call(
      products: [
        ...data.products,
        product.copyWith.call(
          variantQuantity: 1,
          isLastUsedVariant: true,
          totalProductPrice: totalPrice,
          variant: product.variants[state.groupValue],
          selectedAddOnItems: state.selectedAddOnItems?.toList() ?? [],
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
        state = state.copyWith(productDetails: newProduct);
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
            (cp.variant?.sizeName !=
                    state.productDetails?.variants[state.groupValue].sizeName ||
                !cp.selectedAddOnItems
                    .equals(state.productDetails?.selectedAddOnItems ?? [])))
        : false;

    final p = cartState?.products.singleWhereOrNull(
      (e) => e.id == state.productDetails?.id && e.isLastUsedVariant,
    );

    if (state.productDetails != null) {
      state = state.copyWith.productDetails!(
        totalQuantity: totalQuantity,
        isSameProductMultipleTime: isSameProductMultipleTimes,
        modified: cartState != null,
      );
      showAddButton(state.productDetails!.variantQuantity < 1
          // ||
          // p?.selectedAddOnItems == state.productDetails?.selectedAddOnItems ||
          // p?.variant == state.productDetails?.variants?[state.groupValue],
          );
    }
  }

  void updateAddonItemQuantity(AddOnItem addOnItem, increased) async {
    var selectedAddon = List.empty(growable: true);
    selectedAddon = state.selectedAddOnItems!.toList(growable: true);

    AddOnItem item = selectedAddon.toList().singleWhere(
        (element) => element.id == addOnItem.id,
        orElse: () => AddOnItem());

    for (var i = 0; i < (selectedAddon.length); i++) {
      if (selectedAddon[i].id == addOnItem.id) {
        final AddOnItem newAddon = addOnItem.copyWith(
            quantity: increased
                ? item.quantity + 1
                : item.quantity >= 2
                    ? item.quantity - 1
                    : 1);

        selectedAddon[i] = newAddon;
        state = state.copyWith
            .call(selectedAddOnItems: selectedAddon.toSet() as Set<AddOnItem>);
      }
    }
  }

  ProductDetailsResponse? getProductFromCartWithSameVariant(
      ProductDetailsResponse product) {
    return cartState?.products.singleWhereOrNull((cp) =>
        cp.id == product.id &&
        cp.variant?.sizeName == product.variants[state.groupValue].sizeName &&
        cp.selectedAddOnItems.equals(state.selectedAddOnItems?.toList() ?? []));
  }

  updateProductWithCartProduct(ProductDetailsResponse cartProduct) {
    if (state.productDetails != null) {
      log('variantQuantity---------${cartProduct.variantQuantity}');
      state = state.copyWith.productDetails!(
        variantQuantity: cartProduct.variantQuantity,
        selectedAddOnItems: cartProduct.selectedAddOnItems,
      );
      if (state.productDetails!.variants.isNotEmpty &&
          cartProduct.variant != null) {
        onSizeSelect(state.productDetails!.variants
            .indexWhere((v) => v.sizeName == cartProduct.variant?.sizeName));
      }
      _updateProduct([]);
    }
  }
}
