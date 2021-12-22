import 'package:collection/collection.dart';
import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/cart/cart.dart';
import 'package:fenix_user/models/api_response_models/product_data_response/product_data_response.dart';
import 'package:fenix_user/models/api_response_models/product_details_response/product_details_response.dart';
import 'package:fenix_user/models/api_response_models/sub_category_product_data_response/sub_category_product_data_response.dart';
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
    if (state.pageNumber == 1) {
      state = state.copyWith.call(isLoading: true, products: []);
    }
    final response = await api.productList(categoryId, state.pageNumber);
    if (ref.mounted) {
      state = state.copyWith.call(
        categoryTitle: response?.categoryTitle,
        products: [...state.products, ...response?.product?.data ?? []],
        totalProducts: state.totalProducts + (response?.product?.total ?? 0),
        pageNumber: state.pageNumber + 1,
        isLoading: false,
      );
      _updateProducts(cartState?.products ?? []);
    }
  }

  Future<SubCategoryProductDataResponse?> fetchSubCategoryProductData(
      String subCategoryId) async {
    if (state.pageNumber == 1) {
      state = state.copyWith.call(isLoading: true, products: []);
    }
    final response =
        await api.subCategoryProductList(subCategoryId, state.pageNumber);
    if (ref.mounted) {
      state = state.copyWith.call(
        categoryTitle: response?.subCategoryTitle,
        products: [...state.products, ...response?.product?.data ?? []],
        totalProducts: state.totalProducts + (response?.product?.total ?? 0),
        pageNumber: state.pageNumber + 1,
        isLoading: false,
      );
      _updateProducts(cartState?.products ?? []);
    }
  }

  Future<void> addOrRemoveProduct(
      ProductDetailsResponse product, bool isIncreased) async {
    if (cartState == null) {
      await _createCartWithFirstProduct(product);
    } else if (cartState?.products
            .every((element) => element.id != product.id) ??
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
      productId: product.id,
    );
    final cart = Cart(
      franchiseId: db.getFranchiseId(),
      franchiseName: db.getFranchiseName(),
      vendorId: db.getVendorId(),
      restaurantName: db.getRestaurantName(),
      userId: db.getId(),
      products: [product],
    );
    _updateProducts(cart.products, productFirstTimeAdded: true);
    await cartNotifier.updateCart(cart);
  }

  Future<void> showArrowTowardsCart() async {
    state = state.copyWith(productAdded: true);
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) state = state.copyWith(productAdded: false);
  }

  Future<void> _addProductInExistingCart(ProductDetailsResponse product) async {
    final totalPrice = product.variant?.price ?? 0;
    var newCart = cartState?.copyWith.call(
      products: [
        ...cartState?.products ?? [],
        product.copyWith.call(
          variantQuantity: db.getOrderId() != null ? 0 : 1,
          modifiedQuantity: db.getOrderId() != null ? 1 : null,
          isLastUsedVariant: true,
          totalProductPrice: totalPrice,
        ),
      ],
    );
    newCart =
        newCart?.copyWith(modifiedCart: getModifiedStatusFromProducts(newCart));
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
          'IS MODIFIED: ${newProduct.modified}  NORMALQUANTITY: ${newProduct.variantQuantity}  MODIFIEDQUANTITY: ${newProduct.modifiedQuantity ?? 'N/A'}');
      if ((newProduct.modified &&
              (newProduct.modifiedQuantity ?? newProduct.variantQuantity) >
                  0) ||
          newProduct.variantQuantity > 0) {
        final newProducts = cartState!.products..[i] = newProduct;
        Cart? newCart = cartState!.copyWith(products: newProducts);
        _updateProducts(newCart.products);
        newCart = newCart.copyWith(
            modifiedCart: getModifiedStatusFromProducts(newCart));
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

  bool getModifiedStatusFromProducts(Cart? cart) {
    for (var product in cart!.products) {
      if (product.modified) {
        return product.modified;
      }
    }
    return false;
  }

  void _updateProducts(List<ProductDetailsResponse> cartProducts,
      {bool productFirstTimeAdded = false}) {
    final newCartProducts =
        cartProducts.isEmpty ? (cartState?.products ?? []) : cartProducts;

    final newProducts = state.products.map((p) {
      final totalQuantity = (newCartProducts.isNotEmpty)
          ? newCartProducts
              .map((cp) => cp.id == p.id ? getCurrentQuanityOfProduct(cp) : 0)
              .reduce((_, __) => _ + __)
          : 0;
      final totalModifiedQuantity = (newCartProducts.isNotEmpty)
          ? newCartProducts
              .map((cp) => cp.id == p.id ? cp.modifiedQuantity ?? 0 : 0)
              .reduce((_, __) => _ + __)
          : 0;
      final totalPreviousQuantity = (newCartProducts.isNotEmpty)
          ? newCartProducts
              .map((cp) => cp.id == p.id ? cp.variantQuantity : 0)
              .reduce((_, __) => _ + __)
          : 0;
      final isSameProductMultipleTimes = (newCartProducts.isNotEmpty)
          ? newCartProducts.any((cp) =>
              cp.id == p.id &&
              (cp.variant?.sizeName != p.variant?.sizeName ||
                  !cp.selectedAddOnItems.equals(p.selectedAddOnItems)))
          : false;

      return p.copyWith(
        totalQuantity: totalQuantity,
        totalModifiedQuantity: totalModifiedQuantity,
        totalPreviousQuantity: totalPreviousQuantity,
        isSameProductMultipleTime: isSameProductMultipleTimes,
        modified: db.getOrderId() != null &&
            (p.modifiedQuantity == null ||
                (p.variantQuantity != p.modifiedQuantity)),
      );
    }).toList();

    state = state.copyWith.call(products: newProducts);
    if (productFirstTimeAdded) {
      print('Product is added for first Time => $productFirstTimeAdded');
      showArrowTowardsCart();
    }
  }

  int getCurrentQuanityOfProduct(ProductDetailsResponse product) =>
      product.modified
          ? product.modifiedQuantity ?? product.variantQuantity
          : product.variantQuantity;

  int getLastOrderedQuantityOfProduct(ProductDetailsResponse product) =>
      db.getOrderId() != null ? product.variantQuantity : 0;
}
