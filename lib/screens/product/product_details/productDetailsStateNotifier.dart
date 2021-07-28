import 'dart:async';

import 'package:fenix_user/common/utils.dart';
import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/cart/cart.dart';
import 'package:fenix_user/models/api_response_models/add_on_category/add_on_category.dart';
import 'package:fenix_user/models/api_response_models/add_on_item/add_on_item.dart';
import 'package:fenix_user/models/api_response_models/cart_product/cart_product.dart';
import 'package:fenix_user/models/api_response_models/product_details_response/product_details_response.dart';
import 'package:fenix_user/models/api_response_models/product_response/product_response.dart';
import 'package:fenix_user/models/api_response_models/variant_response/variant_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/providers/cart_notifier.dart';
import 'package:fenix_user/screens/tabs/cart/cart.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/alertBox.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'productDetailsState.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';

class ProductDetailsStateNotifier extends StateNotifier<ProductDetailsState> {
  final API api;
  final DB db;
  final CartNotifier cartState;
  Cart? get cartData {
    return cartState.state;
  }

  ProductDetailsStateNotifier(this.api, this.db, this.cartState)
      : super(ProductDetailsState(selectedAddOnItems: <AddOnItem>{}));

  Future<void> fetchProductDetails(String productId) async {
    state = state.copyWith.call(isLoading: true);
    final res = await api.productDetails(productId);
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

  void onSizeSelect(value) {
    state = state.copyWith(groupValue: value);
  }

  void addSelectedAddOnItem(AddOnItem addOnItem, AddOnCategory addOnCategory) {
    // print('aaaaaaa $addOnItem');

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

  void updateAddonItemQuantity(AddOnItem addOnItem, increased) async {
    print('object $addOnItem');



    var selectedAddon = List.empty(growable: true);
    selectedAddon = state.selectedAddOnItems!.toList(growable: true);

    AddOnItem item = selectedAddon.toList().singleWhere((element) =>
    element.id == addOnItem.id, orElse: () => AddOnItem());

    for (var i = 0; i < (selectedAddon.length); i++) {
      if (selectedAddon[i].id == addOnItem.id) {
        final AddOnItem newAddon =
        addOnItem.copyWith(quantity: increased? item.quantity! + 1 : item.quantity! >= 2 ? item.quantity! - 1 : 1);

        selectedAddon[i] = newAddon;
        state = state.copyWith.call(
            selectedAddOnItems: selectedAddon.toSet() as Set<AddOnItem>
        );
      }
    }
  }


  Future<void> saveCart(
    context,
    Set<AddOnItem>? selectedAddOnItems,
    VariantResponse selectedVariant,
    ProductDetailsResponse productDetails,
    String productId,
      String note
  ) async {
    Cart? cart = Cart();

    printWrapped('zzzzzzz $selectedAddOnItems $selectedVariant ');

    var addOnItemsPrice = .0;
    if (selectedAddOnItems!.isNotEmpty) {
      addOnItemsPrice =
          selectedAddOnItems.map((value) => value.addOnItemPrice! * value.quantity!.toDouble()).reduce(
                    (_, __) => _+ __,
                  );
    }

    // final productPrice = selectedVariant.price! + productDetails.taxInfo!.taxPercentage!/100;
    final productPrice = selectedVariant.price!;

    final totalPrice = productPrice  + addOnItemsPrice;

    final productTax = totalPrice * productDetails.taxInfo!.taxPercentage!/100;

    print('ssssssssssssssss $selectedAddOnItems $addOnItemsPrice $totalPrice $productTax');

    final product = ProductDetailsResponse(
      id: productId,
      productName: productDetails.productName,
      productImage: productDetails.productImage,
      categoryId: productDetails.category,
      categoryName: productDetails.categoryName,
      sellingPrice: selectedVariant.price ?? 0,
      originalPrice: selectedVariant.price ?? 0,
      taxInfo: productDetails.taxInfo,
      tax: productTax,
      quantity: 1,
      isLastVariant: true,
      totalQuantity: 1,
      totalProductPrice: totalPrice,
      selectedAddOnItems: selectedAddOnItems.toList(),
      variant: selectedVariant,
      franchiseName: productDetails.franchiseName,
      franchiseId: productDetails.franchiseId,
      vendorId: productDetails.vendorId,
      restaurantName: productDetails.franchiseName,
      description: productDetails.productDescription,
      sizeName: selectedVariant.sizeName,
      productId: productId,
      allergens: productDetails.allergens,
      productInstructions: note,
      modified: db.getOrderId() == null ? false : true
    );

    state = state.copyWith.productDetails!(
        totalQuantity: product.totalQuantity,
        isSameProductMultipleTime: product.isSameProductMultipleTime,
        selectedAddOnItems: product.selectedAddOnItems,
        totalProductPrice: product.totalProductPrice,
      tax: productTax,
    );

    if (cartData == null) {
      cart = cart.copyWith.call(
        franchiseId: product.franchiseId,
        franchiseName: product.franchiseName,
        vendorId: product.vendorId,
        restaurantName: product.franchiseName,
        userId: db.getId()
      );

      cart = cart.copyWith(products: [
        product,
        ...cart.products,
      ]);
      final cartTotal = cart.products
          .map((e) => e.totalProductPrice * e.quantity)
          .reduce((_, __) => _ + __);
      cart = cart.copyWith(subTotal: cartTotal);

      state.productDetails!.copyWith.call(selectedAddOnItems : selectedAddOnItems.toList(), variant : selectedVariant,
          totalQuantity: product.totalQuantity, isSameProductMultipleTime: false);
      await cartState.updateCart(cart);
      Timer(Duration(seconds: 1), () async {
        await Get.to(() => CartScreen());
      });
      await showDialog(

        context: context,
        builder: (BuildContext context) {
          return blackAlertBox(
              context,
              'PRODUCT_ADDED_TO_CART_SUCCESSFULLY',
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
            selectedAddOnItems.map((value) => value.addOnItemPrice! * value.quantity!.toDouble()).reduce(
                      (_, __) => _ + __,
                    );
      }

      state.productDetails!.copyWith.call(selectedAddOnItems : selectedAddOnItems.toList(), variant : selectedVariant,
          totalQuantity: product.totalQuantity, isSameProductMultipleTime: false);
      // final totalProductPrice = (selectedVariant.price! + product.taxInfo!.taxPercentage!/100) + addOnItemsPrice;
      final totalProductPrice = selectedVariant.price! + addOnItemsPrice;
      final productTax = totalProductPrice * productDetails.taxInfo!.taxPercentage!/100;
      print('hhhh $totalProductPrice $productTax');
      if (cartData!.products.any(
        (p) =>
            p.id == productId &&
            p.sizeName == product.sizeName &&
            p.selectedAddOnItems.equals(selectedAddOnItems.toList()),
      )) {
        cart = cartData?.copyWith(
            products: cartData!.products.map((p) {
          if (p.id == productId &&
              p.sizeName == product.sizeName &&
              p.selectedAddOnItems.equals(selectedAddOnItems.toList())) {
            printWrapped('1cartData ================= $cartData');

            return p.copyWith(quantity: p.quantity + 1, isLastVariant: true);
          } else {
            return p.copyWith(isLastVariant: false);
          }
        }).toList());
      } else {
        cart = cartData?.copyWith(products: [
          product.copyWith.call(
            sizeName: selectedVariant.sizeName,
            sellingPrice: selectedVariant.price!,
            originalPrice: selectedVariant.price!,
            totalProductPrice: totalProductPrice,
            selectedAddOnItems: selectedAddOnItems.toList(),
            variant: selectedVariant,
            tax: productTax,
          ),
          ...cartData!.products,
        ]);
      }

      // cart = cartData!.copyWith(
      //     products: cartData!.products.map((p) {
      //   if (p.id == productId &&
      //       p.sizeName == product.sizeName &&
      //       p.selectedAddOnItems.equals(selectedAddOnItems.toList())) {
      //     return p.copyWith(isLastVariant: true);
      //   } else {
      //     return p.copyWith(isLastVariant: false);
      //   }
      // }).toList());
      await cartState.updateCart(cart);

      final cartTotal = cartData!.products
          .map((e) => e.totalProductPrice * e.quantity)
          .reduce((_, __) => _ + __);
      cart = cartData?.copyWith(subTotal: cartTotal);

      await cartState.updateCart(cart);
      Timer(Duration(seconds: 1), () async {
        await Get.to(() => CartScreen());
      });
      await showDialog(

        context: context,
        builder: (BuildContext context) {
          return blackAlertBox(
              context,
              'PRODUCT_ADDED_TO_CART_SUCCESSFULLY',
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
            '${'SOME_PRODUCTS_ARE_ALREADY_ADDED_IN'} ${cartData?.franchiseName} ${'FIRST_CLEAN_YOUR_CART'}',
        textConfirm: 'CLEAN_CART',
        onConfirmListener: () {
          cartState.deleteCart();
          Get.back();
        },
      );
    }
  }

  void updateQuantity({Cart? newCart, ProductDetailsResponse? product}) {
    newCart ??= cartData;
    if (
        newCart != null
        ) {
            final quantity = newCart.products
                .map((e) => (e.id == state.productDetails!.id) ? e.quantity : 0)
                .reduce((_, __) => _ + __);
            final productData = newCart.products
                .map((e) => (e.id == state.productDetails!.id) ? 1 : 0)
                .reduce((_, __) => _ + __);
    product = state.productDetails!.copyWith.call(
                totalQuantity: quantity,
                isSameProductMultipleTime: productData > 1 ? true : false);

            state = state.copyWith.productDetails!(
                totalQuantity: product.totalQuantity,
                isSameProductMultipleTime: product.isSameProductMultipleTime
                );

    } else {
            product = product!.copyWith
                .call(totalQuantity: 0, isSameProductMultipleTime: false);

            state = state.copyWith.productDetails!(
                totalQuantity: product.totalQuantity,
                isSameProductMultipleTime: product.isSameProductMultipleTime
            );

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
      final cart = Cart(
        franchiseId: product.franchiseId,
        franchiseName: product.franchiseName,
        vendorId: product.vendorId,
        restaurantName: restaurantName,
        products: [
          product.copyWith(
            isLastVariant: true,
            totalQuantity: product.quantity,
            totalProductPrice: product.sellingPrice.toDouble(),
          )
        ],
      );
      await cartState.updateCart(cart);
      updateQuantity(newCart: cart, product: product);
    } else if (product.franchiseId != cartData?.franchiseId) {
      print('333');
      await customDialog(
        status: DIALOG_STATUS.WARNING,
        title:
        '${'SOME_PRODUCTS_ARE_ALREADY_ADDED_IN'} ${cartData?.franchiseName} ${'FIRST_CLEAN_YOUR_CART'}',
        textConfirm: 'CLEAN_CART',
        onConfirmListener: () {
          cartState.deleteCart();
          updateQuantity();
          Get.back();
        },
      );
    } else if (!cartData!.products.any((element) => element.id == product.id)) {
      print('44444');
      final cart = cartData?.copyWith(products: [
        ...cartData?.products ?? [],
        product.copyWith(
          isLastVariant: true,
          totalQuantity: product.quantity,
          totalProductPrice: product.sellingPrice.toDouble(),
        )
      ]);
      await cartState.updateCart(cart);
      updateQuantity(newCart: cart, product: product);
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

              printWrapped('qqqqqqqqq $products');
              Cart? cart = cartData!.copyWith(products: products);
              await cartState.updateCart(cart);
              updateQuantity(newCart: cart, product: product);
            } else {
              print('555 22');
              Cart? cart = cartData!
                  .copyWith(products: cartData!.products..remove(element));
              await cartState.updateCart(cart);
              updateQuantity(newCart: cart, product: product);
              if (cart.products.isEmpty) {
                await cartState.deleteCart();
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
          await cartState.updateCart(cart);
          updateQuantity(newCart: cart, product: product);
        } else {
          Cart? cart =
          cartData!.copyWith(products: cartData!.products..remove(element));
          await cartState.updateCart(cart);
          updateQuantity(newCart: cart, product: product);
          if (cart.products.isEmpty) {
            await cartState.deleteCart();
          }
        }
      }
    }
  }


}
