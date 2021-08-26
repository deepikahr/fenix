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
    if (ref.mounted) {
      state = state.copyWith.call(isLoading: false, productDetails: res);
      _updateProduct((cartState != null && cartState!.products.isNotEmpty
          ? cartState!.products
          : []));
    }
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
    state = state.copyWith.call(
        selectedAddOnItems: state.selectedAddOnItems?..add(addOnItem),
        showAddButton: false);
  }

  void removeAddOnItem(AddOnItem addOnItem) {
    state = state.copyWith.call(
        selectedAddOnItems: state.selectedAddOnItems?..remove(addOnItem),
        showAddButton: false);
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
                product.variants?[state.groupValue].sizeName &&
            element.selectedAddOnItems
                .equals(state.selectedAddOnItems?.toList() ?? [])) ??
        true) {
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
      totalProductPrice: (product.variants?[state.groupValue].price ?? 0) +
          ((state.selectedAddOnItems!.toList().isNotEmpty)
              ? state.selectedAddOnItems!
                  .toList()
                  .map((saot) => ((saot.addOnItemPrice ?? 0) * saot.quantity))
                  .reduce((_, __) => _ + __)
              : 0),
      variant: product.variants?[state.groupValue],
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
    _updateProduct(cart.products);
    await cartNotifier.updateCart(cart);
  }

  Future<void> _addProductInExistingCart(ProductDetailsResponse product) async {
    final totalPrice = (product.variants?[state.groupValue].price ?? 0) +
        ((state.selectedAddOnItems!.toList().isNotEmpty)
            ? state.selectedAddOnItems!
                .toList()
                .map((saot) => ((saot.addOnItemPrice ?? 0) * saot.quantity))
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
          variant: product.variants?[state.groupValue],
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

    final p = cartState?.products.singleWhereOrNull(
      (e) => e.id == state.productDetails?.id && e.isLastUsedVariant,
    );

    if (p != null && p.selectedAddOnItems.isEmpty) {
      state = state.copyWith(selectedAddOnItems: p.selectedAddOnItems.toSet());
    }

    for (var i = 0; i < (state.productDetails!.variants!.length); i++) {
      if (state.productDetails!.variants?[i].sizeName == p?.variant?.sizeName) {
        state = state.copyWith(groupValue: i);
      }
    }
    if (state.productDetails != null) {
      state = state.copyWith.productDetails!(
        totalQuantity: totalQuantity,
        isSameProductMultipleTime: isSameProductMultipleTimes,
        modified: cartState != null,
      );
      state = state.copyWith(
          showAddButton:
              state.productDetails!.totalQuantity > 0 ? true : false);
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
        state = state.copyWith.call(
            selectedAddOnItems: selectedAddon.toSet() as Set<AddOnItem>,
            showAddButton: false);
      }
    }
  }
}
