import 'package:fenix_user/common/utils.dart';
import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/add_on_category/add_on_category.dart';
import 'package:fenix_user/models/api_response_models/add_on_item/add_on_item.dart';
import 'package:fenix_user/models/api_response_models/product_details_response/product_details_response.dart';
import 'package:fenix_user/models/api_response_models/product_response/product_response.dart';
import 'package:fenix_user/models/api_response_models/variant_response/variant_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/alertBox.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'productDetailsState.dart';
import 'package:get/get.dart';

class ProductDetailsStateNotifier extends StateNotifier<ProductDetailsState> {
  final API api;
  final DB db;

  ProductDetailsStateNotifier(this.api, this.db) :
        super(ProductDetailsState(isLoading: true, selectedAddOnItems: <AddOnItem>{}));

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

  Future<void> saveCart(
      context,
      Set<AddOnItem>? selectedAddOnItems,
      VariantResponse selectedVariant,
      ProductDetailsResponse productDetails,
      String productId,
      ) async {
    // Cart? cart = Cart();
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

    // final product = ProductResponse(
    //   id: productId,
    //   productName: productDetails.productName,
    //   productImage: productDetails.productImage,
    //   franchiseName: productDetails.franchiseName,
    //   averageRating: productDetails.averageRating,
    //   franchiseId: productDetails.franchiseId,
    //   categoryId: productDetails.categoryId,
    //   vendorId: productDetails.vendorId,
    //   restaurantName: productDetails.restaurantName,
    //   discount: productDetails.discount,
    //   isVeg: productDetails.isVeg,
    //   description: productDetails.description,
    //   sizeName: selectedVariant.sizeName,
    //   sellingPrice: selectedVariant.price ?? 0,
    //   originalPrice: selectedVariant.price ?? 0,
    //   totalProductPrice: totalPrice,
    //   addOnItems: selectedAddOnItems.toList(),
    //   preparationTime: productDetails.preparationTime,
    //   quantity: 1,
    //   productId: productId,
    //   isLastVeriant: true,
    // );

    // if (cartData == null) {
    //   cart = cart.copyWith.call(
    //     franchiseId: product.franchiseId,
    //     franchiseName: product.franchiseName,
    //     preparationTime: product.preparationTime,
    //     vendorId: product.vendorId,
    //     restaurantName: product.restaurantName,
    //   );
    //
    //   cart = cart.copyWith(products: [
    //     product,
    //     ...cart.products,
    //   ]);
    //   final cartTotal = cart.products
    //       .map((e) => e.totalProductPrice)
    //       .reduce((_, __) => _ + __);
    //   cart = cart.copyWith(subTotal: cartTotal);
    //
    //   await cartState.updateCart(cart);
    //   Timer(Duration(seconds: 1), () async {
    //     if (type == 'ADDTOCART') {
    //       Get.back();
    //       Get.back();
    //     } else {
    //       Get.back();
    //       // await Get.to(() => CartScreen(
    //       //   backButton: true,
    //       // ));
    //     }
    //   });
    //   await showDialog(
    //     barrierColor: secondary,
    //     context: context,
    //     builder: (BuildContext context) {
    //       return blackAlertBox(
    //           context,
    //           'PRODUCT_ADDED_TO_CART_SUCCESSFULLY',
    //           Image.asset(
    //             'lib/assets/icons/done.png',
    //             scale: 3,
    //           ),
    //           null);
    //     },
    //   );
    // } else if (product.franchiseId == cartData!.franchiseId) {
    //   var addOnItemsPrice = .0;
    //   if (selectedAddOnItems.isNotEmpty) {
    //     addOnItemsPrice =
    //         selectedAddOnItems.map((value) => value.addOnItemPrice).reduce(
    //               (_, __) => _! + __!,
    //         ) ??
    //             .0;
    //   }
    //
    //   final totalProductPrice = selectedVariant.price! + addOnItemsPrice;
    //   if (cartData!.products.any(
    //         (p) =>
    //     p.id == productId &&
    //         p.sizeName == product.sizeName &&
    //         p.addOnItems.equals(selectedAddOnItems.toList()),
    //   )) {
    //     cart = cartData?.copyWith(
    //         products: cartData!.products.map((p) {
    //           if (p.id == productId &&
    //               p.sizeName == product.sizeName &&
    //               p.addOnItems.equals(selectedAddOnItems.toList())) {
    //             printWrapped('cartData$cartData');
    //
    //             return p.copyWith(quantity: p.quantity + 1, isLastVeriant: true);
    //           } else {
    //             return p.copyWith(isLastVeriant: false);
    //           }
    //         }).toList());
    //     printWrapped('cartData===================$cartData');
    //   } else {
    //     cart = cartData?.copyWith(products: [
    //       product.copyWith.call(
    //         sizeName: selectedVariant.sizeName,
    //         sellingPrice: selectedVariant.price ?? 0,
    //         originalPrice: selectedVariant.price ?? 0,
    //         totalProductPrice: totalProductPrice,
    //         addOnItems: selectedAddOnItems.toList(),
    //       ),
    //       ...cartData!.products,
    //     ]);
    //   }
    //   cart = cartData?.copyWith(
    //       products: cartData!.products.map((p) {
    //         if (p.id == productId &&
    //             p.sizeName == product.sizeName &&
    //             p.addOnItems.equals(selectedAddOnItems.toList())) {
    //           return p.copyWith(isLastVeriant: true);
    //         } else {
    //           return p.copyWith(isLastVeriant: false);
    //         }
    //       }).toList());
    //   printWrapped('cartData===================$cartData');
    //
    //   final cartTotal = cartData!.products
    //       .map((e) => e.totalProductPrice)
    //       .reduce((_, __) => _ + __);
    //   cart = cartData?.copyWith(subTotal: cartTotal);
    //
    //   await cartState.updateCart(cart);
    //   Timer(Duration(seconds: 1), () async {
    //     if (type == 'ADDTOCART') {
    //       Get.back();
    //       Get.back();
    //     } else {
    //       Get.back();
    //       await Get.to(() => CartScreen(
    //         backButton: true,
    //       ));
    //     }
    //   });
    //   await showDialog(
    //     barrierColor: secondary,
    //     context: context,
    //     builder: (BuildContext context) {
    //       return blackAlertBox(
    //           context,
    //           'PRODUCT_ADDED_TO_CART_SUCCESSFULLY',
    //           Image.asset(
    //             'lib/assets/icons/done.png',
    //             scale: 3,
    //           ),
    //           null);
    //     },
    //   );
    // } else {
    //   await customDialog(
    //     status: DIALOG_STATUS.WARNING,
    //     title:
    //     '${'SOME_PRODUCTS_ARE_ALREADY_ADDED_IN'} ${cartData?.franchiseName} ${'FIRST_CLEAN_YOUR_CART'}',
    //     textConfirm: 'CLEAN_CART',
    //     onConfirmListener: () {
    //       cartState.deleteCart();
    //       Get.back();
    //     },
    //   );
    // }
  }

}
