import 'dart:async';

import 'package:fenix_user/common/utils.dart';
import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/cart/cart.dart';
import 'package:fenix_user/models/api_response_models/add_on_category/add_on_category.dart';
import 'package:fenix_user/models/api_response_models/add_on_item/add_on_item.dart';
import 'package:fenix_user/models/api_response_models/product_details_response/product_details_response.dart';
import 'package:fenix_user/models/api_response_models/product_response/product_response.dart';
import 'package:fenix_user/models/api_response_models/variant_response/variant_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/providers/cart_notifier.dart';
import 'package:fenix_user/screens/others/cart/cart.dart';
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

  void onSizeSelect(value) {
    state = state.copyWith(groupValue: value);
  }

  void addSelectedAddOnItem(AddOnItem addOnItem, AddOnCategory addOnCategory) {
    print('aaaaaaa $addOnItem');

    state = state.copyWith
        .call(selectedAddOnItems: state.selectedAddOnItems?..add(addOnItem));
  }

  void removeAddOnItem(AddOnItem addOnItem) {
    state = state.copyWith
        .call(selectedAddOnItems: state.selectedAddOnItems?..remove(addOnItem));
  }

  void onProsuct(value) {
    state = state.copyWith(groupValue: value);
  }


  Future<void> saveCart(
    context,
    Set<AddOnItem>? selectedAddOnItems,
    VariantResponse selectedVariant,
    ProductDetailsResponse productDetails,
    String productId,
  ) async {
    Cart? cart = Cart();

    printWrapped('zzzzzzz $selectedAddOnItems $selectedVariant ');

    var addOnItemsPrice = .0;
    if (selectedAddOnItems!.isNotEmpty) {
      addOnItemsPrice =
          selectedAddOnItems.map((value) => value.addOnItemPrice).reduce(
                    (_, __) => _! + __!,
                  ) ??
              .0;
    }

    final totalPrice = selectedVariant.price! + addOnItemsPrice;

    print('ssssssssssssssss $selectedAddOnItems $addOnItemsPrice $totalPrice');


    final product = ProductDetailsResponse(
      id: productId,
      productName: productDetails.productName,
      productImage: productDetails.productImage,
      franchiseName: productDetails.franchiseName,
      averageRating: productDetails.averageRating,
      franchiseId: productDetails.franchiseId,
      categoryId: productDetails.category,
      vendorId: productDetails.vendorId,
      restaurantName: productDetails.franchiseName,
      discount: productDetails.offerPercentage!,
      isVeg: productDetails.isVeg,
      description: productDetails.productDescription,
      sizeName: selectedVariant.sizeName,
      sellingPrice: selectedVariant.price ?? 0,
      originalPrice: selectedVariant.price ?? 0,
      totalProductPrice: totalPrice,
      selectedAddOnItems: selectedAddOnItems.toList(),
      // preparationTime: productDetails.preparationTime,
      quantity: 1,
      productId: productId,
      isLastVariant: true,
      totalQuantity: 1,
      tags: productDetails.tags,
      allergens: productDetails.allergens,
    );

    if (cartData == null) {
      cart = cart.copyWith.call(
        franchiseId: product.franchiseId,
        franchiseName: product.franchiseName,
        preparationTime: product.preparationTime,
        vendorId: product.vendorId,
        restaurantName: product.franchiseName,
      );

      cart = cart.copyWith(products: [
        product,
        ...cart.products,
      ]);
      final cartTotal = cart.products
          .map((e) => e.totalProductPrice)
          .reduce((_, __) => _ + __);
      cart = cart.copyWith(subTotal: cartTotal);

      printWrapped('qqqqqqqqqqqqqqqqqqqqq  $cart');
      state.productDetails!.copyWith.call(totalQuantity: product.totalQuantity, isSameProductMultipleTime: false);
      await cartState.updateCart(cart);
      // Timer(Duration(seconds: 1), () async {
      //   await Get.to(() => CartScreen());
      // });
      // await showDialog(
      //   barrierColor: secondary,
      //   context: context,
      //   builder: (BuildContext context) {
      //     return blackAlertBox(
      //         context,
      //         'PRODUCT_ADDED_TO_CART_SUCCESSFULLY',
      //         Image.asset(
      //           'lib/assets/icons/done.png',
      //           scale: 3,
      //         ),
      //         null);
      //   },
      // );
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
            p.selectedAddOnItems.equals(selectedAddOnItems.toList()),
      )) {
        cart = cartData?.copyWith(
            products: cartData!.products.map((p) {
          if (p.id == productId &&
              p.sizeName == product.sizeName &&
              p.selectedAddOnItems.equals(selectedAddOnItems.toList())) {
            printWrapped('cartData ================= $cartData');

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
          ),
          ...cartData!.products,
        ]);
      }
      cart = cartData?.copyWith(
          products: cartData!.products.map((p) {
        if (p.id == productId &&
            p.sizeName == product.sizeName &&
            p.selectedAddOnItems.equals(selectedAddOnItems.toList())) {
          return p.copyWith(isLastVariant: true);
        } else {
          return p.copyWith(isLastVariant: false);
        }
      }).toList());
      printWrapped('cartData===================$cartData');

      final cartTotal = cartData!.products
          .map((e) => e.totalProductPrice)
          .reduce((_, __) => _ + __);
      cart = cartData?.copyWith(subTotal: cartTotal);

      await cartState.updateCart(cart);
      // Timer(Duration(seconds: 1), () async {
      //   await Get.to(() => CartScreen());
      // });
      // await showDialog(
      //   barrierColor: secondary,
      //   context: context,
      //   builder: (BuildContext context) {
      //     return blackAlertBox(
      //         context,
      //         'PRODUCT_ADDED_TO_CART_SUCCESSFULLY',
      //         Image.asset(
      //           'lib/assets/icons/done.png',
      //           scale: 3,
      //         ),
      //         null);
      //   },
      // );
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


  void updateQuantity({Cart? newCart}) {
    newCart ??= cartData;
    state.productDetails!.copyWith.call(totalQuantity: 0, isSameProductMultipleTime: false);

    // if (state.productDetails!.isNotEmpty &&
    //     newCart != null &&
    //     newCart.products.isNotEmpty) {
    //   state.products!.forEach((categoriesElement) {
    //     if (categoriesElement.products.isNotEmpty) {
    //       categoriesElement.products.forEach((productsElement) {
    //         final quantity = newCart!.products
    //             .map((e) => (e.id == productsElement.id) ? e.quantity : 0)
    //             .reduce((_, __) => _ + __);
    //         final productData = newCart.products
    //             .map((e) => (e.id == productsElement.id) ? 1 : 0)
    //             .reduce((_, __) => _ + __);
    //         productsElement = productsElement.copyWith.call(
    //             totalQuantity: quantity,
    //             isSameProductMultipleTime: productData > 1 ? true : false);
    //         categoriesElement = categoriesElement.copyWith(
    //             products: categoriesElement.products.map((p) {
    //               if (p.id == productsElement.id) {
    //                 return productsElement;
    //               }
    //               return p;
    //             }).toList());
    //         state = state.copyWith.restaurant!(
    //             categories: state.restaurant!.categories.map((p) {
    //               if (p.id == categoriesElement.id) {
    //                 return categoriesElement;
    //               }
    //               return p;
    //             }).toList());
    //       });
    //     }
    //   });
    // } else {
      // state.restaurant!.categories.forEach((categoriesElement) {
      //   if (categoriesElement.products.isNotEmpty) {
      //     state.productDetails!.forEach((productsElement) {
      //       productsElement = productsElement.copyWith
      //           .call(totalQuantity: 0, isSameProductMultipleTime: false);
      //       categoriesElement = categoriesElement.copyWith(
      //           products: categoriesElement.products.map((p) {
      //             if (p.id == productsElement.id) {
      //               return productsElement;
      //             }
      //             return p;
      //           }).toList());
      //       state = state.copyWith.restaurant!(
      //           categories: state.restaurant!.categories.map((p) {
      //             if (p.id == categoriesElement.id) {
      //               return categoriesElement;
      //             }
      //             return p;
      //           }).toList());
      //     });
        // }
      // });
    // }
  }

  Future<void> findLastUpdateProduct(
      ProductDetailsResponse product,
      bool increased,
      String? restaurantName,
      ) async {
    printWrapped('bbbb $cartData');
    if (cartData == null) {
      print('qqq $cartData');
      final cart = Cart(
        franchiseId: product.franchiseId,
        franchiseName: product.franchiseName,
        preparationTime: product.preparationTime,
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
      updateQuantity(newCart: cart);
    } else if (product.franchiseId != cartData?.franchiseId) {
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
      final cart = cartData?.copyWith(products: [
        ...cartData?.products ?? [],
        product.copyWith(
          isLastVariant: true,
          totalQuantity: product.quantity,
          totalProductPrice: product.sellingPrice.toDouble(),
        )
      ]);
      await cartState.updateCart(cart);
      updateQuantity(newCart: cart);
    } else {
      cartData?.products.forEach(
            (element) async {
          if (element.id == product.id && element.isLastVariant == true) {
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
              await cartState.updateCart(cart);
              updateQuantity(newCart: cart);
            } else {
              Cart? cart = cartData!
                  .copyWith(products: cartData!.products..remove(element));
              await cartState.updateCart(cart);
              updateQuantity(newCart: cart);
              if (cart.products.isEmpty) {
                await cartState.deleteCart();
              }
            }
          }
        },
      );
    }
  }

  void updateProductsQuantity(ProductResponse product, increased) async {
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
          updateQuantity(newCart: cart);
        } else {
          Cart? cart =
          cartData!.copyWith(products: cartData!.products..remove(element));
          await cartState.updateCart(cart);
          updateQuantity(newCart: cart);
          if (cart.products.isEmpty) {
            await cartState.deleteCart();
          }
        }
      }
    }
  }

}
