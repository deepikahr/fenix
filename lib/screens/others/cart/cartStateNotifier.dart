import 'package:fenix_user/common/utils.dart';
import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/cart/cart.dart';
import 'package:fenix_user/models/api_response_models/product_details_response/product_details_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/providers/cart_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'cartState.dart';

class CartScreenStateNotifier extends StateNotifier<CartScreenState> {
  final API api;
  final DB db;
  final CartNotifier cartState;
  Cart? get cart {
    return cartState.state;
  }

  CartScreenStateNotifier(this.api, this.db, this.cartState)
      : super(CartScreenState());

  Future<void> updateQuantity(ProductDetailsResponse product, increased) async {

    final newProduct = product.copyWith(
      totalQuantity: product.totalQuantity + (increased ? 1 : -1),
    );

    if (newProduct.totalQuantity > 0) {
      var products = cart!.products;
      products = products.map((p) {
        if (p == product) {
          return newProduct;
        }
        return p;
      }).toList();

      await cartState.updateCart(cart?.copyWith(products: products));

    } else {
      await cartState.updateCart(
          cart?.copyWith(products: cart!.products..remove(product)));

      if (cart!.products.isEmpty) {
        await cartState.deleteCart();
        await cartState.updateCart(null);
      }
    }
    await updateGrandTotal();
  }

  Future<void> removeProduct(ProductDetailsResponse product) async {
    await cartState.updateCart(
        cart?.copyWith(products: cart!.products..remove(product)));
    await updateGrandTotal();
  }

  Future<void> updateGrandTotal() async {

    if (cart != null) {
      final total = cart!.products
          .map(
            (e) {
              return e.totalProductPrice * e.totalQuantity;
            },
      )
          .reduce((_, __) => _ + __);
      final grandTotal = total + 1;

      await cartState.updateCart(cart?.copyWith(
        subTotal: total,
        grandTotal: grandTotal,
      ));
    }
  }

}
