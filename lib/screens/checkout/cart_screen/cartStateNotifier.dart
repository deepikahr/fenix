import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/database/db.dart';
import 'package:restaurant_saas/models/api_request_models/cart/cart.dart';
import 'package:restaurant_saas/models/api_response_models/product/product.dart';
import 'package:restaurant_saas/models/api_response_models/user_address/user_address.dart';
import 'package:restaurant_saas/network/api_service.dart';
import 'package:restaurant_saas/providers/cart_notifier.dart';

import 'cartScreenState.dart';

class CartStateNotifier extends StateNotifier<CartScreenState> {
  final API api;
  final DB db;
  final CartNotifier cartState;
  Cart? get cart {
    return cartState.state;
  }

  CartStateNotifier(this.api, this.db, this.cartState)
      : super(CartScreenState());

  Future<void> init() async {
    state = state.copyWith(isLoading: true);

    if (cart != null) {
      if (db.isLoggedIn() == true) {
        final address = await getUserDefaultAddress();
        await cartState.updateCart(cart?.copyWith(address: address));

        if (db.getFutureTipValue() == true) {
          await setSaveTipAmount();
          state = state.copyWith(tipCheckBox: true);
        } else {
          await removeTipAmount();
          state = state.copyWith(tipCheckBox: false);
        }

        await updateGrandTotal();
      }
    }

    state = state.copyWith(
      isLoading: false,
      showLogin: false,
      currencySymbol: db.getCurrencySymbol(),
    );
  }

  Future<void> removeTipAmount() async {
    // state = state.copyWith(
    //   cart: state.cart?.copyWith(tipAmount: 0.0),
    // );
    await cartState.updateCart(cart?.copyWith(tipAmount: 0.0));
    await updateGrandTotal();
  }

  Future<void> setSaveTipAmount() async {
    // state = state.copyWith(
    //   cart: state.cart?.copyWith(tipAmount: db.getFutureTipAmount()),
    // );
    await cartState
        .updateCart(cart?.copyWith(tipAmount: db.getFutureTipAmount()));
    await updateGrandTotal();
  }

  Future<Cart?> verifyCart() async {
    final res = await api.verifyCart(cart);
    return res;
  }

  Future<void> selectTip(double tip) async {
    // state = state.copyWith(
    //   cart: state.cart?.copyWith(tipAmount: tip),
    // );
    await cartState.updateCart(cart?.copyWith(tipAmount: tip));
    await updateGrandTotal();
  }

  Future<void> checkBoxSaveTip(value) async {
    state = state.copyWith(tipCheckBox: value);
    await db.storeFutureOrderTipData(
      cart?.tipAmount,
      state.tipCheckBox,
    );
  }

  Future<void> removeCoupon() async {
    // state = state.copyWith(
    //   cart: state.cart!.copyWith(couponCode: null, couponAmount: 0.0),
    // );
    await cartState
        .updateCart(cart?.copyWith(couponCode: null, couponAmount: 0.0));
    await updateGrandTotal();
  }

  Future<void> updateQuantity(Product product, increased) async {
    final newProduct = product.copyWith(
      quantity: product.quantity + (increased ? 1 : -1),
    );

    if (newProduct.quantity > 0) {
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

  Future<void> fetchTaxDetails(String? vendorId) async {
    state = state.copyWith(isLoading: true);
    if (vendorId != null) {
      final res = await api.fetchTaxDetails(vendorId);
      await cartState.updateCart(cart!.copyWith(
        tax: (res!.taxPercentage! / 100.0) * cart!.subTotal,
      ));
      await updateGrandTotal();
    }
    state = state.copyWith(isLoading: false);
  }

  Future<void> updateGrandTotal() async {
    if (cart != null) {
      final total = cart!.products
          .map(
            (e) => e.totalProductPrice * e.quantity,
          )
          .reduce((_, __) => _ + __);
      final grandTotal = total +
          cart!.tipAmount +
          cart!.tax +
          cart!.deliveryCharges -
          cart!.couponAmount;

      await cartState.updateCart(cart?.copyWith(
        subTotal: total,
        grandTotal: grandTotal,
      ));
    }
  }

  Future<void> setUserAddress(UserAddress userAddress) async {
    await cartState.updateCart(cart?.copyWith(address: userAddress));
  }

  Future<UserAddress?> getUserDefaultAddress() async {
    final address = await api.fetchDefaultAddress(autoErrorHandle: false);
    return address;
  }

  // void setCart(Cart cart) {
  //   state = state.copyWith(cart: cart);
  // }
}
