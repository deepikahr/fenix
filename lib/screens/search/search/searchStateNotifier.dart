import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/database/db.dart';
import 'package:restaurant_saas/models/api_request_models/cart/cart.dart';
import 'package:restaurant_saas/models/api_response_models/product/product.dart';
import 'package:restaurant_saas/providers/cart_notifier.dart';
import 'package:restaurant_saas/widgets/alertBox.dart';

import 'searchState.dart';
import 'package:restaurant_saas/network/api_service.dart';

class SearchStateNotifier extends StateNotifier<SearchState> {
  final API api;
  final DB db;
  final CartNotifier cartState;
  Cart? get cartData {
    return cartState.state;
  }

  SearchStateNotifier(this.api, this.db, this.cartState) : super(SearchState());

  Future<void> search(String searchWord,
      {bool isScroll = false, int? pageNumber}) async {
    if (pageNumber != null && pageNumber == 1) {
      state = state.copyWith
          .call(products: [], restaurants: [], pageNumber: 1, total: 0);
    }

    if (state.pageNumber == 1 || isScroll == true) {
      state = state.copyWith.call(isLoading: true);
    }

    if (state.showDishes) {
      final res = await api.searchByProduct(searchWord, state.pageNumber);
      state = state.copyWith.call(
          pageNumber: state.pageNumber + 1,
          total: res?.total ?? 0,
          products: [...state.products, ...res?.data ?? []]);
    }
    if (state.showRestaurants) {
      final res = await api.searchByRestaurant(searchWord, state.pageNumber);
      state = state.copyWith.call(
          pageNumber: state.pageNumber + 1,
          total: res?.total ?? 0,
          restaurants: [...state.restaurants, ...res?.data ?? []]);
    }

    updateQuantity();

    state = state.copyWith
        .call(isLoading: false, currencySymbol: db.getCurrencySymbol());
  }

  Future<void> onRestaurantSelect({required String searchWord}) async {
    state = state.copyWith(showRestaurants: true);
    state = state.copyWith.call(
        showDishes: false,
        products: [],
        restaurants: [],
        pageNumber: 1,
        total: 0);
    if (searchWord.isNotEmpty) {
      await search(searchWord);
    }
  }

  Future<void> onDishesSelect({required String searchWord}) async {
    state = state.copyWith(showRestaurants: false);
    state = state.copyWith.call(
        showDishes: true,
        products: [],
        restaurants: [],
        pageNumber: 1,
        total: 0);
    if (searchWord.isNotEmpty) {
      await search(searchWord);
    }
  }

  void updateQuantity({Cart? newCart}) {
    newCart ??= cartData;
    if (state.products.isNotEmpty &&
        newCart != null &&
        newCart.products.isNotEmpty) {
      state.products.forEach((productsElement) {
        final quantity = newCart!.products
            .map((e) => (e.id == productsElement.id) ? e.quantity : 0)
            .reduce((_, __) => _ + __);
        final productData = newCart.products
            .map((e) => (e.id == productsElement.id) ? 1 : 0)
            .reduce((_, __) => _ + __);
        productsElement = productsElement.copyWith.call(
            totalQuantity: quantity,
            isSameProductMultipleTime: productData > 1 ? true : false);
        state = state.copyWith(
            products: state.products.map((p) {
          if (p.id == productsElement.id) {
            return productsElement;
          }
          return p;
        }).toList());
      });
    } else {
      state.products.forEach((productsElement) {
        productsElement = productsElement.copyWith
            .call(totalQuantity: 0, isSameProductMultipleTime: false);

        state = state.copyWith(
            products: state.products.map((p) {
          if (p.id == productsElement.id) {
            return productsElement;
          }
          return p;
        }).toList());
      });
    }
  }

  Future<void> findLastUpdateProduct(
    Product product,
    bool increased,
  ) async {
    if (cartData == null) {
      final cart = Cart(
        franchiseId: product.franchiseId,
        franchiseName: product.franchiseName,
        preparationTime: product.preparationTime,
        vendorId: product.vendorId,
        restaurantName: product.restaurantName,
        products: [
          product.copyWith(
            isLastVeriant: true,
            totalQuantity: product.quantity,
            totalProductPrice: product.sellingPrice,
          )
        ],
      );
      await cartState.updateCart(cart);
      updateQuantity(newCart: cart);
    } else if (product.franchiseId != cartData?.franchiseId) {
      await customDialog(
        status: DIALOG_STATUS.WARNING,
        title:
            '${'SOME_PRODUCTS_ARE_ALREADY_ADDED_IN'.tr} ${cartData?.franchiseName} ${'FIRST_CLEAN_YOUR_CART'.tr}',
        textConfirm: 'CLEAN_CART'.tr,
        onConfirmListener: () {
          cartState.deleteCart();
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
      await cartState.updateCart(cart);
      updateQuantity(newCart: cart);
    } else {
      cartData?.products.forEach((element) async {
        if (element.id == product.id && element.isLastVeriant == true) {
          final newProduct = element.copyWith(
              quantity: element.quantity + (increased ? 1 : -1));
          if (newProduct.quantity > 0) {
            var products = cartData!.products;
            products = products.map(
              (p) {
                if (p == element) {
                  return newProduct;
                }
                return p;
              },
            ).toList();

            var cart = cartData?.copyWith(products: products);
            await cartState.updateCart(cart);
            updateQuantity(newCart: cart);
          } else {
            var cart = cartData?.copyWith(
                products: cartData!.products..remove(element));
            await cartState.updateCart(cart);
            updateQuantity(newCart: cart);
            if (cart?.products.isEmpty ?? false) {
              await cartState.deleteCart();
            }
          }
        }
      });
    }
  }

  void updateProductsQuantity(Product product, increased) {
    cartData?.products.forEach((element) async {
      if (element.id == product.id) {
        final newProduct =
            element.copyWith(quantity: element.quantity + (increased ? 1 : -1));
        if (newProduct.quantity > 0) {
          var cart = cartData?.copyWith(
            products: cartData!.products
              ..remove(element)
              ..add(newProduct),
          );
          await cartState.updateCart(cart);
          updateQuantity(newCart: cart);
        } else {
          var cart =
              cartData?.copyWith(products: cartData!.products..remove(element));
          await cartState.updateCart(cart);
          updateQuantity(newCart: cart);
          if (cart?.products.isEmpty ?? false) {
            await cartState.deleteCart();
          }
        }
      }
    });
  }
}
