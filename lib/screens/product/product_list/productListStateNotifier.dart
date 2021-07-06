import 'package:fenix_user/common/utils.dart';
import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/cart/cart.dart';
import 'package:fenix_user/models/api_response_models/product_data_response/product_data_response.dart';
import 'package:fenix_user/models/api_response_models/product_response/product_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/widgets/alertBox.dart';
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

  void updateQuantity({Cart? newCart}) {
    newCart ??= cartData;
    // if (state.productData!.isNotEmpty &&
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
    //   state.restaurant!.categories.forEach((categoriesElement) {
    //     if (categoriesElement.products.isNotEmpty) {
    //       categoriesElement.products.forEach((productsElement) {
    //         productsElement = productsElement.copyWith
    //             .call(totalQuantity: 0, isSameProductMultipleTime: false);
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
    // }
  }

  // Future<void> findLastUpdateProduct(
  //     ProductResponse product,
  //     bool increased,
  //     String? restaurantName,
  //     ) async {
  //   printWrapped('bbbb $cartData');
  //   if (cartData == null) {
  //     print('qqq $cartData');
  //     final cart = Cart(
  //       franchiseId: product.franchiseId,
  //       franchiseName: product.franchiseName,
  //       preparationTime: product.preparationTime,
  //       vendorId: product.vendorId,
  //       restaurantName: restaurantName,
  //       products: [
  //         product.copyWith(
  //           isLastVariant: true,
  //           totalQuantity: product.quantity,
  //           totalProductPrice: product.sellingPrice.toDouble(),
  //         )
  //       ],
  //     );
  //     await cartNotifier.updateCart(cart);
  //     updateQuantity(newCart: cart);
  //   } else if (product.franchiseId != cartData?.franchiseId) {
  //     await customDialog(
  //       status: DIALOG_STATUS.WARNING,
  //       title:
  //       '${'SOME_PRODUCTS_ARE_ALREADY_ADDED_IN'} ${cartData?.franchiseName} ${'FIRST_CLEAN_YOUR_CART'}',
  //       textConfirm: 'CLEAN_CART',
  //       onConfirmListener: () {
  //         cartNotifier.deleteCart();
  //         updateQuantity();
  //         Get.back();
  //       },
  //     );
  //   } else if (!cartData!.products.any((element) => element.id == product.id)) {
  //     final cart = cartData?.copyWith(products: [
  //       ...cartData?.products ?? [],
  //       product.copyWith(
  //         isLastVariant: true,
  //         totalQuantity: product.quantity,
  //         totalProductPrice: product.sellingPrice.toDouble(),
  //       )
  //     ]);
  //     await cartNotifier.updateCart(cart);
  //     updateQuantity(newCart: cart);
  //   } else {
  //     cartData?.products.forEach(
  //           (element) async {
  //         if (element.id == product.id && element.isLastVariant == true) {
  //           final newProduct = element.copyWith(
  //               quantity: element.quantity + (increased ? 1 : -1));
  //           if (newProduct.quantity > 0) {
  //             var products = cartData!.products;
  //             products = products.map((p) {
  //               if (p == element) {
  //                 return newProduct;
  //               }
  //               return p;
  //             }).toList();
  //
  //             Cart? cart = cartData!.copyWith(products: products);
  //             await cartNotifier.updateCart(cart);
  //             updateQuantity(newCart: cart);
  //           } else {
  //             Cart? cart = cartData!
  //                 .copyWith(products: cartData!.products..remove(element));
  //             await cartNotifier.updateCart(cart);
  //             updateQuantity(newCart: cart);
  //             if (cart.products.isEmpty) {
  //               await cartNotifier.deleteCart();
  //             }
  //           }
  //         }
  //       },
  //     );
  //   }
  // }

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
