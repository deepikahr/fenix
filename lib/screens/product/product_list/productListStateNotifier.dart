import 'dart:async';

import 'package:fenix_user/common/utils.dart';
import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/cart/cart.dart';
import 'package:fenix_user/models/api_response_models/cart_product/cart_product.dart';
import 'package:fenix_user/models/api_response_models/product_data_response/product_data_response.dart';
import 'package:fenix_user/models/api_response_models/product_details_response/product_details_response.dart';
import 'package:fenix_user/models/api_response_models/product_response/product_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/screens/tabs/cart/cart.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/alertBox.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'productListState.dart';
import 'package:fenix_user/providers/cart_notifier.dart';
import 'package:fenix_user/models/api_request_models/cart/cart.dart';
import 'package:get/get.dart';

class ProductListStateNotifier extends StateNotifier<ProductListState> {
  final API api;
  final DB db;
  final CartNotifier cartNotifier;
  Cart? get cartData {
    return cartNotifier.state;
  }

  ProductListStateNotifier(this.api, this.db, this.cartNotifier)
      : super(ProductListState());

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

  void onSelectLanguage(String value) {
    state = state.copyWith(selectedLanguage: value);
  }

  void updateQuantity({Cart? newCart}) {
    newCart ??= cartData;
    if (state.products!.isNotEmpty &&
        newCart != null &&
        newCart.products.isNotEmpty) {
          state.products!.forEach((productsElement) {
            final quantity = newCart!.products
                .map((e) => (e.id == productsElement.id) ? e.quantity : 0)
                .reduce((_, __) => _ + __);
            final productData = newCart.products
                .map((e) => (e.id == productsElement.id) ? 1 : 0)
                .reduce((_, __) => _ + __);
            productsElement = productsElement.copyWith.call(
                totalQuantity: quantity,
                isSameProductMultipleTime: productData > 1 ? true : false,
                modified: db.getOrderId() == null ? false : true
            );

            state = state.copyWith.productData!(
                data: state.productData!.data!.map((p) {
                  if (p.id == productsElement.id) {
                    return productsElement;
                  }
                  return p;
                }).toList());
      });
    } else {
      state.products!.forEach((productsElement) {
            productsElement = productsElement.copyWith
                .call(totalQuantity: 0, isSameProductMultipleTime: false);
            state = state.copyWith.productData!(
                data: state.productData!.data!.map((p) {
                  if (p.id == productsElement.id) {
                    return productsElement;
                  }
                  return p;
                }).toList());
          });
    }
  }

  Future<void> findLastUpdateProduct(
      ProductDetailsResponse product,
      bool increased,
      String? restaurantName,
      ) async {
    printWrapped('11111');
    if (cartData == null) {
      print('222222 ');
      final totalPrice = product.variant!.price!.toDouble();
      final productTax = totalPrice * product.taxInfo!.taxPercentage!/100;
      print('ssssssssssssssss  $totalPrice $productTax ${product.description} ${product.productDescription}');
      var cart = Cart(
        franchiseId: product.franchiseId,
        franchiseName: product.franchiseName,
        vendorId: product.vendorId,
        restaurantName: restaurantName,
        userId: db.getId(),
        products: [
          product.copyWith(
            description: product.productDescription,
            isLastVariant: true,
            totalQuantity: product.quantity,
            totalProductPrice: totalPrice,
              tax: productTax,
              modified: db.getOrderId() == null ? false : true
          )
        ],
      );
      final cartTotal = cart.products
          .map((e) => e.totalProductPrice * e.quantity)
          .reduce((_, __) => _ + __);
      final taxTotal = cart.products
          .map((e) => e.tax)
          .reduce((_, __) => _ + __);
      print('tttttt $taxTotal');
      final grandTotal = cartTotal + taxTotal;
      cart = cart.copyWith(subTotal: cartTotal, taxTotal: taxTotal, grandTotal: grandTotal);
      await cartNotifier.updateCart(cart);
      updateQuantity(newCart: cart,);
    } else if (product.franchiseId != cartData?.franchiseId) {
      print('333');
      await customDialog(
        status: DIALOG_STATUS.WARNING,
        title:
        '${'SOME_PRODUCTS_ARE_ALREADY_ADDED_IN'} ${cartData?.franchiseName} ${'FIRST_CLEAN_YOUR_CART'}',
        textConfirm: 'CLEAN_CART',
        onConfirmListener: () {
          cartNotifier.deleteCart();
          updateQuantity();
          Get.back();
        },
      );
    } else if (!cartData!.products.any((element) => element.id == product.id)) {
      print('44444');
      final totalPrice = product.variant!.price!.toDouble();
      final productTax = totalPrice * product.taxInfo!.taxPercentage!/100;
      print('ssssssssssssssss  $totalPrice $productTax ');
      var cart = cartData?.copyWith(products: [
        ...cartData?.products ?? [],
        product.copyWith(
          description: product.productDescription,
          isLastVariant: true,
          totalQuantity: product.quantity,
          totalProductPrice: totalPrice,
            tax: productTax,
            modified: db.getOrderId() == null ? false : true
        )
      ]);
      final cartTotal = cart!.products
          .map((e) => e.totalProductPrice * e.quantity)
          .reduce((_, __) => _ + __);
      final taxTotal = cart.products
          .map((e) => e.tax)
          .reduce((_, __) => _ + __);
      print('tttttt $taxTotal');
      final grandTotal = cartTotal + taxTotal;
      cart = cart.copyWith(subTotal: cartTotal, taxTotal: taxTotal, grandTotal: grandTotal);
      await cartNotifier.updateCart(cart);
      updateQuantity(newCart: cart, );
    } else {
      print('5555');
      cartData?.products.forEach(
            (element) async {
          if (element.id == product.id && element.isLastVariant == true) {
            final newProduct = element.copyWith(
                quantity: element.quantity + (increased ? 1 : -1));
            if (newProduct.quantity > 0) {
              print('555 11111');
              var products = cartData!.products;
              products = products.map((p) {
                if (p == element) {
                  return newProduct;
                }
                return p;
              }).toList();

              Cart? cart = cartData!.copyWith(products: products);
              await cartNotifier.updateCart(cart);
              updateQuantity(newCart: cart,);
            } else {
              print('555 22');
              Cart? cart = cartData!
                  .copyWith(products: cartData!.products..remove(element));
              await cartNotifier.updateCart(cart);
              updateQuantity(newCart: cart,);
              if (cart.products.isEmpty) {
                await cartNotifier.deleteCart();
              }
            }
          }
        },
      );
    }
  }

  void updateProductsQuantity(ProductDetailsResponse product, increased) async {
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
