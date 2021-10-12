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
    print(res?.variants);
    if (ref.mounted) {
      state = state.copyWith.call(
        isLoading: false,
        productDetails: res,
        groupValue: res?.variants.indexWhere((v) => v.isDefaultVariant) ?? 0,
      );
      _updateProduct(
        cartProducts: cartState?.products ?? [],
      );
    }
    return res;
  }

  void showAddButton(bool value) {
    state = state.copyWith(showAddButton: value);
  }

  void onSizeSelect(int value) {
    state = state.copyWith(groupValue: value);
    _updateProduct();
  }

  void addSelectedAddOnItem(AddOnItem addOnItem, AddOnCategory addOnCategory) {
    state = state.copyWith
        .call(selectedAddOnItems: state.selectedAddOnItems?..add(addOnItem));
    _updateProduct();
  }

  void removeAddOnItem(AddOnItem addOnItem) {
    state = state.copyWith
        .call(selectedAddOnItems: state.selectedAddOnItems?..remove(addOnItem));
    _updateProduct();
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

  Future<void> showArrowTowardsCart() async {
    state = state.copyWith(productAdded: true);
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) state = state.copyWith(productAdded: false);
  }

  Future<void> _createCartWithFirstProduct(
      ProductDetailsResponse product) async {
    product = product.copyWith.call(
      productId: product.id,
      variantQuantity: 1,
      isLastUsedVariant: true,
      totalProductPrice: (product.variants[state.groupValue].price) +
          ((state.selectedAddOnItems!.toList().isNotEmpty)
              ? state.selectedAddOnItems!
                  .toList()
                  .map((i) => ((i.addOnItemPrice ?? 0) * i.quantity))
                  .reduce((_, __) => _ + __)
              : 0),
      variant: product.variants[state.groupValue],
      selectedAddOnItems: state.selectedAddOnItems?.toList() ?? [],
      modified: db.getOrderId() != null &&
          (product.modifiedQuantity == null ||
              (product.variantQuantity != product.modifiedQuantity)),
    );
    final cart = Cart(
      franchiseId: db.getFranchiseId(),
      franchiseName: db.getFranchiseName(),
      vendorId: db.getVendorId(),
      restaurantName: db.getRestaurantName(),
      userId: db.getId(),
      products: [product],
    );
    await cartNotifier.updateCart(cart);
    state = state.copyWith(productDetails: product);
    _updateProduct(cartProducts: cart.products, productUpdated: true);
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

    final newProduct = product.copyWith.call(
      variantQuantity: db.getOrderId() != null ? 0 : 1,
      modifiedQuantity: db.getOrderId() != null ? 1 : null,
      isLastUsedVariant: true,
      totalProductPrice: totalPrice,
      variant: product.variants[state.groupValue],
      selectedAddOnItems: state.selectedAddOnItems?.toList() ?? [],
      modified: db.getOrderId() != null,
      productId: product.id,
      variants: product.variants,
    );

    var newCart = data?.copyWith.call(
      products: [
        ...data.products,
        newProduct,
      ],
    );
    newCart =
        newCart?.copyWith(modifiedCart: getModifiedStatusFromProducts(newCart));
    await cartNotifier.updateCart(newCart);
    state = state.copyWith(productDetails: newProduct);
    _updateProduct(cartProducts: newCart?.products ?? []);
  }

  Future<void> _updateQuantityOfLastVariant(
    ProductDetailsResponse product,
    bool isIncreased,
  ) async {
    final p = getProductFromCartWithSameVariant(product);
    if (p != null) {
      final i = cartState!.products.indexOf(p);

      late ProductDetailsResponse newProduct;
      if (db.getOrderId() != null) {
        newProduct = p.copyWith.call(
            modifiedQuantity: p.modifiedQuantity != null
                ? p.modifiedQuantity! + (isIncreased ? 1 : -1)
                : p.variantQuantity + (isIncreased ? 1 : -1));
        newProduct = newProduct.copyWith(
          modified: db.getOrderId() != null &&
              (newProduct.modifiedQuantity == null ||
                  (newProduct.variantQuantity != newProduct.modifiedQuantity)),
        );
      } else {
        newProduct = p.copyWith
            .call(variantQuantity: p.variantQuantity + (isIncreased ? 1 : -1));
      }
      print(
          'IS MODIFIED: ${newProduct.modified}  NORMALQUANTITY: ${newProduct.variantQuantity}  MODIFIEDQUANTITY: ${newProduct.modifiedQuantity ?? 'N/A'} Variants: ${newProduct.variants}');
      if ((newProduct.modified &&
              (newProduct.modifiedQuantity ?? newProduct.variantQuantity) >
                  0) ||
          newProduct.variantQuantity > 0) {
        final newProducts = cartState!.products..[i] = newProduct;
        Cart? newCart = cartState!.copyWith(
          products: newProducts,
        );
        newCart = newCart.copyWith(
            modifiedCart: getModifiedStatusFromProducts(newCart));
        await cartNotifier.updateCart(newCart);

        state = state.copyWith(productDetails: newProduct);
        _updateProduct(cartProducts: newCart.products);
      } else {
        final newCart = cartState!.copyWith(
          products: (cartState!.products..remove(p)),
        );
        await cartNotifier.updateCart(newCart);
        state = state.copyWith(productDetails: newProduct);
        _updateProduct(cartProducts: newCart.products);
        if (newCart.products.isEmpty) {
          await cartNotifier.deleteCart();
        }
      }
    }
  }

  bool getModifiedStatusFromProducts(Cart? cart) {
    for (var product in cart!.products) {
      if (product.modified) {
        return product.modified;
      }
    }
    return false;
  }

  void _updateProduct(
      {List<ProductDetailsResponse>? cartProducts,
      bool productUpdated = false}) {
    final newCartProducts = (cartProducts?.isEmpty ?? true)
        ? (cartState?.products ?? [])
        : cartProducts;

    final totalQuantity = (newCartProducts?.isNotEmpty ?? false)
        ? newCartProducts
                ?.map((cp) => cp.id == state.productDetails?.id
                    ? cp.modified
                        ? cp.modifiedQuantity ?? cp.variantQuantity
                        : cp.variantQuantity
                    : 0)
                .reduce((_, __) => _ + __) ??
            0
        : 0;

    final isSameProductMultipleTimes = (newCartProducts?.isNotEmpty ?? false)
        ? newCartProducts?.any((cp) =>
                cp.id == state.productDetails?.id &&
                (cp.variant?.sizeName !=
                        state.productDetails?.variants[state.groupValue]
                            .sizeName ||
                    !cp.selectedAddOnItems.equals(
                        state.productDetails?.selectedAddOnItems ?? []))) ??
            false
        : false;

    if (state.productDetails != null) {
      final cp = getProductFromCartWithSameVariant(
        state.productDetails!,
      );

      state = state.copyWith.productDetails!(
        variantQuantity: cp?.variantQuantity ?? 0,
        totalQuantity: totalQuantity,
        isSameProductMultipleTime: isSameProductMultipleTimes,
        modified: db.getOrderId() != null &&
            (cp?.modifiedQuantity == null ||
                (cp!.variantQuantity != cp.modifiedQuantity)),
        modifiedQuantity: cp?.modified ?? false ? cp!.modifiedQuantity : null,
      );

      showAddButton(state.productDetails!.totalQuantity < 1);
    }
    if (productUpdated) showArrowTowardsCart();
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
        _updateProduct();
      }
    }
  }

  ProductDetailsResponse? getProductFromCartWithSameVariantOrLastUsedVariant(
      ProductDetailsResponse product) {
    return cartState?.products.singleWhereOrNull((cp) =>
            cp.id == product.id &&
            cp.variant?.sizeName ==
                product.variants[state.groupValue].sizeName &&
            cp.selectedAddOnItems
                .equals(state.selectedAddOnItems?.toList() ?? [])) ??
        cartState?.products.singleWhereOrNull(
          (e) => e.id == state.productDetails?.id && e.isLastUsedVariant,
        );
  }

  ProductDetailsResponse? getProductFromCartWithSameVariant(
      ProductDetailsResponse product) {
    return cartState?.products.singleWhereOrNull((cp) =>
        cp.id == product.id &&
        cp.variant?.sizeName == product.variants[state.groupValue].sizeName &&
        cp.selectedAddOnItems.equals(state.selectedAddOnItems?.toList() ?? []));
  }

  void updateProductWithCartProduct(ProductDetailsResponse cartProduct) {
    if (state.productDetails != null) {
      state = state.copyWith.productDetails!(
        variantQuantity: cartProduct.variantQuantity,
        isSameProductMultipleTime: cartProduct.isSameProductMultipleTime,
        isLastUsedVariant: cartProduct.isLastUsedVariant,
        totalQuantity: cartProduct.totalQuantity,
        variant: cartProduct.variant,
        modified: cartProduct.modified,
        totalProductPrice: cartProduct.totalProductPrice,
        selectedAddOnItems: cartProduct.selectedAddOnItems,
        variants: cartProduct.variants,
        modifiedQuantity: cartProduct.modifiedQuantity,
      );
      if (state.productDetails!.variants.isNotEmpty &&
          cartProduct.variant != null) {
        onSizeSelect(state.productDetails!.variants
            .indexWhere((v) => v.sizeName == cartProduct.variant?.sizeName));
      }
    }
  }
}
