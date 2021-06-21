import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/database/db.dart';
import 'package:restaurant_saas/models/api_request_models/cart/cart.dart';
import 'package:restaurant_saas/models/api_request_models/favourite_request/favourite_request.dart';
import 'package:restaurant_saas/models/api_response_models/product/product.dart';
import 'package:restaurant_saas/network/api_service.dart';
import 'package:restaurant_saas/providers/cart_notifier.dart';
import 'package:restaurant_saas/widgets/alertBox.dart';

import 'restaurantScreenState.dart';

class RestaurantScreenStateNotifier
    extends StateNotifier<RestaurantScreenState> {
  final API api;
  final DB db;
  final CartNotifier cartNotifier;
  Cart? get cartData {
    return cartNotifier.state;
  }

  RestaurantScreenStateNotifier(this.api, this.db, this.cartNotifier)
      : super(RestaurantScreenState());

  bool isLoggedIn() => db.isLoggedIn();

  Future<void> fetchMenu(
      String franchiseId, String vendorId, String? categoryId) async {
    state = state.copyWith.call(isLoading: true);
    final res = await api.fetchRestaurantDetails(
      franchiseId,
      vendorId,
      categoryId: categoryId,
    );
    state = state.copyWith.call(
      restaurant: res,
      isLoading: false,
      currencySymbol: db.getCurrencySymbol(),
    );
  }

  Future<void> addToFavourite(String? franchiseId) async {
    state = state.copyWith.call(isFavouriteLoading: true);
    final res = await api
        .addRestaurantToFavourite(FavouriteRequest(franchiseId: franchiseId));
    if (res != null) {
      state = state.copyWith.restaurant!(isFavorite: true);
    }
    state = state.copyWith.call(isFavouriteLoading: false);
  }

  Future<void> removeFromFavourite(String franchiseId) async {
    state = state.copyWith.call(isFavouriteLoading: true);
    final res = await api.removeRestaurantFromFavourite(franchiseId);
    if (res != null) {
      state = state.copyWith.restaurant!(isFavorite: false);
    }
    state = state.copyWith.call(isFavouriteLoading: false);
  }

  void onSelectVegOnly(value) {
    state = state.copyWith(isVegOnly: value);
  }

  void updateQuantity({Cart? newCart}) {
    newCart ??= cartData;
    if (state.restaurant!.categories.isNotEmpty &&
        newCart != null &&
        newCart.products.isNotEmpty) {
      state.restaurant!.categories.forEach((categoriesElement) {
        if (categoriesElement.products.isNotEmpty) {
          categoriesElement.products.forEach((productsElement) {
            final quantity = newCart!.products
                .map((e) => (e.id == productsElement.id) ? e.quantity : 0)
                .reduce((_, __) => _ + __);
            final productData = newCart.products
                .map((e) => (e.id == productsElement.id) ? 1 : 0)
                .reduce((_, __) => _ + __);
            productsElement = productsElement.copyWith.call(
                totalQuantity: quantity,
                isSameProductMultipleTime: productData > 1 ? true : false);
            categoriesElement = categoriesElement.copyWith(
                products: categoriesElement.products.map((p) {
              if (p.id == productsElement.id) {
                return productsElement;
              }
              return p;
            }).toList());
            state = state.copyWith.restaurant!(
                categories: state.restaurant!.categories.map((p) {
              if (p.id == categoriesElement.id) {
                return categoriesElement;
              }
              return p;
            }).toList());
          });
        }
      });
    } else {
      state.restaurant!.categories.forEach((categoriesElement) {
        if (categoriesElement.products.isNotEmpty) {
          categoriesElement.products.forEach((productsElement) {
            productsElement = productsElement.copyWith
                .call(totalQuantity: 0, isSameProductMultipleTime: false);
            categoriesElement = categoriesElement.copyWith(
                products: categoriesElement.products.map((p) {
              if (p.id == productsElement.id) {
                return productsElement;
              }
              return p;
            }).toList());
            state = state.copyWith.restaurant!(
                categories: state.restaurant!.categories.map((p) {
              if (p.id == categoriesElement.id) {
                return categoriesElement;
              }
              return p;
            }).toList());
          });
        }
      });
    }
  }

  Future<void> findLastUpdateProduct(
    Product product,
    bool increased,
    String? restaurantName,
  ) async {
    if (cartData == null) {
      final cart = Cart(
        franchiseId: product.franchiseId,
        franchiseName: product.franchiseName,
        preparationTime: product.preparationTime,
        vendorId: product.vendorId,
        restaurantName: restaurantName,
        products: [
          product.copyWith(
            isLastVeriant: true,
            totalQuantity: product.quantity,
            totalProductPrice: product.sellingPrice,
          )
        ],
      );
      await cartNotifier.updateCart(cart);
      updateQuantity(newCart: cart);
    } else if (product.franchiseId != cartData?.franchiseId) {
      await customDialog(
        status: DIALOG_STATUS.WARNING,
        title:
            '${'SOME_PRODUCTS_ARE_ALREADY_ADDED_IN'.tr} ${cartData?.franchiseName} ${'FIRST_CLEAN_YOUR_CART'.tr}',
        textConfirm: 'CLEAN_CART'.tr,
        onConfirmListener: () {
          cartNotifier.deleteCart();
          updateQuantity();
          Get.back();
        },
      );
    } else if (!cartData!.products.any((element) => element.id == product.id)) {
      final cart = cartData?.copyWith(products: [
        ...cartData?.products ?? [],
        product.copyWith(
          isLastVeriant: true,
          totalQuantity: product.quantity,
          totalProductPrice: product.sellingPrice,
        )
      ]);
      await cartNotifier.updateCart(cart);
      updateQuantity(newCart: cart);
    } else {
      cartData?.products.forEach(
        (element) async {
          if (element.id == product.id && element.isLastVeriant == true) {
            final newProduct = element.copyWith(
                quantity: element.quantity + (increased ? 1 : -1));
            if (newProduct.quantity > 0) {
              var products = cartData!.products;
              products = products.map((p) {
                if (p == element) {
                  return newProduct;
                }
                return p;
              }).toList();

              Cart? cart = cartData!.copyWith(products: products);
              await cartNotifier.updateCart(cart);
              updateQuantity(newCart: cart);
            } else {
              Cart? cart = cartData!
                  .copyWith(products: cartData!.products..remove(element));
              await cartNotifier.updateCart(cart);
              updateQuantity(newCart: cart);
              if (cart.products.isEmpty) {
                await cartNotifier.deleteCart();
              }
            }
          }
        },
      );
    }
  }

  void updateProductsQuantity(Product product, increased) async {
    if (cartData == null) {
      return;
    }
    for (var i = 0; i < (cartData?.products.length ?? 0); i++) {
      final element = cartData!.products[i];
      if (element.id == product.id) {
        final newProduct =
            element.copyWith(quantity: element.quantity + (increased ? 1 : -1));
        if (newProduct.quantity > 0) {
          Cart? cart = cartData!.copyWith(
            products: cartData!.products
              ..remove(element)
              ..add(newProduct),
          );
          await cartNotifier.updateCart(cart);
          updateQuantity(newCart: cart);
        } else {
          Cart? cart =
              cartData!.copyWith(products: cartData!.products..remove(element));
          await cartNotifier.updateCart(cart);
          updateQuantity(newCart: cart);
          if (cart.products.isEmpty) {
            await cartNotifier.deleteCart();
          }
        }
      }
    }
  }
}
