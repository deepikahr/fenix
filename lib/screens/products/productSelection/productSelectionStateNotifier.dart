import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/common/utils.dart';
import 'package:restaurant_saas/database/db.dart';
import 'package:restaurant_saas/models/api_request_models/cart/cart.dart';
import 'package:restaurant_saas/models/api_response_models/add_on_item/add_on_item.dart';
import 'package:restaurant_saas/models/api_response_models/product/product.dart';
import 'package:restaurant_saas/models/api_response_models/product_details_response/product_details_response.dart';
import 'package:restaurant_saas/models/api_response_models/variant/variant.dart';
import 'package:restaurant_saas/network/api_service.dart';
import 'package:restaurant_saas/providers/cart_notifier.dart';
import 'package:restaurant_saas/screens/checkout/cart_screen/cart_screen.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/alertBox.dart';
import 'package:collection/collection.dart';

import 'productSelectionState.dart';

class ProductSelectionStateNotifier
    extends StateNotifier<ProductSelectionState> {
  final API api;
  final DB db;
  final CartNotifier cartState;
  Cart? get cartData {
    return cartState.state;
  }

  ProductSelectionStateNotifier(this.api, this.db, this.cartState)
      : super(ProductSelectionState(selectedAddOnItems: <AddOnItem>{}));

  void onSizeSelect(value) {
    state = state.copyWith(groupValue: value);
  }

  void onSizeTabSelect() {
    state = state.copyWith(showSizeTab: true, showExtraTab: false);
  }

  void onExtraTabSelect() {
    state = state.copyWith(showSizeTab: false, showExtraTab: true);
  }

  void addSelectedAddOnItem(AddOnItem addOnItem) {
    state = state.copyWith
        .call(selectedAddOnItems: state.selectedAddOnItems?..add(addOnItem));
  }

  void removeAddOnItem(AddOnItem addOnItem) {
    state = state.copyWith
        .call(selectedAddOnItems: state.selectedAddOnItems?..remove(addOnItem));
  }

  void removeAllAddOnItem() {
    state = state.copyWith.call(selectedAddOnItems: {});
  }

  Future<void> fetchProductDetails(String productId) async {
    state = state.copyWith
        .call(isLoading: true, showSizeTab: true, showExtraTab: false);
    final res = await api.fetchProductDetails(productId);

    final leastPrice = res!.variants[0].price;
    final highestPrice = res.variants[res.variants.length - 1].price;
    state = state.copyWith.call(
      groupValue: res.variants.indexWhere(
        (element) => element.isDefaultVariant!,
      ),
    );
    state = state.copyWith.call(leastPrice: leastPrice!);
    state = state.copyWith.call(highestPrice: highestPrice!);
    state = state.copyWith.call(
      isLoading: false,
      showSizeTab: true,
      showExtraTab: false,
      productDetails: res,
      currencySymbol: db.getCurrencySymbol(),
    );
  }

  Future<void> saveCart(
    context,
    Set<AddOnItem>? selectedAddOnItems,
    Variant selectedVariant,
    type,
    ProductDetailsResponse productDetails,
    String productId,
  ) async {
    Cart? cart = Cart();

    var addOnItemsPrice = .0;
    if (selectedAddOnItems!.isNotEmpty) {
      addOnItemsPrice =
          selectedAddOnItems.map((value) => value.addOnItemPrice).reduce(
                    (_, __) => _! + __!,
                  ) ??
              .0;
    }
    final totalPrice = selectedVariant.price! + addOnItemsPrice;

    final product = Product(
      id: productId,
      productName: productDetails.productName,
      productImage: productDetails.productImage,
      franchiseName: productDetails.franchiseName,
      averageRating: productDetails.averageRating,
      franchiseId: productDetails.franchiseId,
      categoryId: productDetails.categoryId,
      vendorId: productDetails.vendorId,
      restaurantName: productDetails.restaurantName,
      discount: productDetails.discount,
      isVeg: productDetails.isVeg,
      description: productDetails.description,
      sizeName: selectedVariant.sizeName,
      sellingPrice: selectedVariant.price ?? 0,
      originalPrice: selectedVariant.price ?? 0,
      totalProductPrice: totalPrice,
      addOnItems: selectedAddOnItems.toList(),
      preparationTime: productDetails.preparationTime,
      quantity: 1,
      productId: productId,
      isLastVeriant: true,
    );

    if (cartData == null) {
      cart = cart.copyWith.call(
        franchiseId: product.franchiseId,
        franchiseName: product.franchiseName,
        preparationTime: product.preparationTime,
        vendorId: product.vendorId,
        restaurantName: product.restaurantName,
      );

      cart = cart.copyWith(products: [
        product,
        ...cart.products,
      ]);
      final cartTotal = cart.products
          .map((e) => e.totalProductPrice)
          .reduce((_, __) => _ + __);
      cart = cart.copyWith(subTotal: cartTotal);

      await cartState.updateCart(cart);
      Timer(Duration(seconds: 1), () async {
        if (type == 'ADDTOCART') {
          Get.back();
          Get.back();
        } else {
          Get.back();
          await Get.to(() => CartScreen(
                backButton: true,
              ));
        }
      });
      await showDialog(
        barrierColor: secondary,
        context: context,
        builder: (BuildContext context) {
          return blackAlertBox(
              context,
              'PRODUCT_ADDED_TO_CART_SUCCESSFULLY'.tr,
              Image.asset(
                'lib/assets/icons/done.png',
                scale: 3,
              ),
              null);
        },
      );
    } else if (product.franchiseId == cartData!.franchiseId) {
      var addOnItemsPrice = .0;
      if (selectedAddOnItems.isNotEmpty) {
        addOnItemsPrice =
            selectedAddOnItems.map((value) => value.addOnItemPrice).reduce(
                      (_, __) => _! + __!,
                    ) ??
                .0;
      }

      final totalProductPrice = selectedVariant.price! + addOnItemsPrice;
      if (cartData!.products.any(
        (p) =>
            p.id == productId &&
            p.sizeName == product.sizeName &&
            p.addOnItems.equals(selectedAddOnItems.toList()),
      )) {
        cart = cartData?.copyWith(
            products: cartData!.products.map((p) {
          if (p.id == productId &&
              p.sizeName == product.sizeName &&
              p.addOnItems.equals(selectedAddOnItems.toList())) {
            printWrapped('cartData$cartData');

            return p.copyWith(quantity: p.quantity + 1, isLastVeriant: true);
          } else {
            return p.copyWith(isLastVeriant: false);
          }
        }).toList());
        printWrapped('cartData===================$cartData');
      } else {
        cart = cartData?.copyWith(products: [
          product.copyWith.call(
            sizeName: selectedVariant.sizeName,
            sellingPrice: selectedVariant.price ?? 0,
            originalPrice: selectedVariant.price ?? 0,
            totalProductPrice: totalProductPrice,
            addOnItems: selectedAddOnItems.toList(),
          ),
          ...cartData!.products,
        ]);
      }
      cart = cartData?.copyWith(
          products: cartData!.products.map((p) {
        if (p.id == productId &&
            p.sizeName == product.sizeName &&
            p.addOnItems.equals(selectedAddOnItems.toList())) {
          return p.copyWith(isLastVeriant: true);
        } else {
          return p.copyWith(isLastVeriant: false);
        }
      }).toList());
      printWrapped('cartData===================$cartData');

      final cartTotal = cartData!.products
          .map((e) => e.totalProductPrice)
          .reduce((_, __) => _ + __);
      cart = cartData?.copyWith(subTotal: cartTotal);

      await cartState.updateCart(cart);
      Timer(Duration(seconds: 1), () async {
        if (type == 'ADDTOCART') {
          Get.back();
          Get.back();
        } else {
          Get.back();
          await Get.to(() => CartScreen(
                backButton: true,
              ));
        }
      });
      await showDialog(
        barrierColor: secondary,
        context: context,
        builder: (BuildContext context) {
          return blackAlertBox(
              context,
              'PRODUCT_ADDED_TO_CART_SUCCESSFULLY'.tr,
              Image.asset(
                'lib/assets/icons/done.png',
                scale: 3,
              ),
              null);
        },
      );
    } else {
      await customDialog(
        status: DIALOG_STATUS.WARNING,
        title:
            '${'SOME_PRODUCTS_ARE_ALREADY_ADDED_IN'.tr} ${cartData?.franchiseName} ${'FIRST_CLEAN_YOUR_CART'.tr}',
        textConfirm: 'CLEAN_CART'.tr,
        onConfirmListener: () {
          cartState.deleteCart();
          Get.back();
        },
      );
    }
  }
}
