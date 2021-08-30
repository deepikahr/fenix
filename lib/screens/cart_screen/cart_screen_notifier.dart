import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/cart/cart.dart';
import 'package:fenix_user/models/api_request_models/update_cart/update_cart.dart';
import 'package:fenix_user/models/api_request_models/update_product/update_product.dart';
import 'package:fenix_user/models/api_response_models/order_response/order_response.dart';
import 'package:fenix_user/models/api_response_models/product_details_response/product_details_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/providers/cart_notifier.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'cart_screen_state.dart';

class CartScreenNotifier extends StateNotifier<CartScreenState> {
  final ProviderReference ref;
  API get api {
    return ref.read(apiProvider);
  }

  DB get db {
    return ref.read(dbProvider);
  }

  CartNotifier get cartState {
    return ref.read(cartProvider.notifier);
  }

  Cart? get cart {
    return ref.read(cartProvider);
  }

  CartScreenNotifier(this.ref) : super(CartScreenState());

  void onPageChanged(index) {
    state = state.copyWith(isLoading: true);
    state = state.copyWith.call(currentIndex: index);
    state = state.copyWith(isLoading: false);
  }

  Future<void> updateQuantity(ProductDetailsResponse product, increased) async {
    final newProduct = product.copyWith(
        variantQuantity: product.variantQuantity + (increased ? 1 : -1),
        modified: db.getOrderId() != null);
    if (newProduct.variantQuantity > 0) {
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
      }
    }
    await updateGrandTotal();
  }

  Future<void> removeProduct(ProductDetailsResponse product) async {
    await cartState
        .updateCart(cart?.copyWith(products: cart!.products..remove(product)));
    await updateGrandTotal();
  }

  Future<void> updateGrandTotal() async {
    if (cart?.products.isNotEmpty ?? false) {
      final total = cart!.products.map(
        (e) {
          return e.totalProductPrice * e.variantQuantity;
        },
      ).reduce((_, __) => _ + __);
      final tax = cart!.products.map(
        (e) {
          return e.tax;
        },
      ).reduce((_, __) => _ + __);
      final subTotal = total;
      final grandTotal = total;

      await cartState.updateCart(cart?.copyWith(
          subTotal: subTotal, grandTotal: grandTotal, taxTotal: tax));
    }
  }

  Future<OrderResponse?> createOrder() async {
    // updateGrandTotal();
    state = state.copyWith.call(isLoading: true);
    final response = await api.createOrder(
      cart!,
    );
    db.saveOrderId(response!.id);
    state = state.copyWith.call(isLoading: false, orderResponse: response);
  }

  UpdateProduct createUpdateProduct(ProductDetailsResponse product) {
    return UpdateProduct(
        productId: product.id,
        sizeName: product.variant?.sizeName,
        quantity: product.variantQuantity,
        addOnItems: product.selectedAddOnItems);
  }

  Future<String?> updateOrder() async {
    // updateGrandTotal();
    state = state.copyWith.call(isUpdateLoading: true);

    UpdateCart updateCart = UpdateCart(
        orderId: db.getOrderId(),
        products: cart!.products
            .where((element) => element.modified)
            .map((e) => createUpdateProduct(e))
            .toList());

    final updateResponse = await api.updateOrder(updateCart);
    state = state.copyWith.call(
      isUpdateLoading: false,
    );
    return updateResponse;
  }
}
