import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/database/db.dart';
import 'package:restaurant_saas/models/api_request_models/cart/cart.dart';
import 'package:restaurant_saas/network/api_service.dart';
import 'package:restaurant_saas/providers/cart_notifier.dart';
import 'package:restaurant_saas/screens/checkout/cart_screen/cart_screen.dart';
import 'package:restaurant_saas/widgets/alertBox.dart';

import 'orderDetailsState.dart';

class OrderDetailsStateNotifier extends StateNotifier<OrderDetailsState> {
  final API api;
  final DB db;
  final CartNotifier cartState;
  Cart? get cartData {
    return cartState.state;
  }

  OrderDetailsStateNotifier(this.api, this.db, this.cartState)
      : super(OrderDetailsState());

  Future<void> fetchOrderDetail(orderId) async {
    state = state.copyWith(isLoading: true);
    final res = await api.orderDetails(orderId);
    state = state.copyWith.call(
      orderDetailsData: res,
      currencySymbol: db.getCurrencySymbol(),
    );
    state = state.copyWith(isLoading: false);
  }

  Future<void> cancelOrder(String orderId) async {
    state = state.copyWith(isLoading: true);
    final res = await api.cancelOrder(orderId);
    if (res != null) {
      await fetchOrderDetail(orderId);
    }
    state = state.copyWith(isLoading: false);
  }

  Future<Cart?> reOrder(String orderId) async {
    state = state.copyWith(isLoading: true);
    final res = await api.reOrder(orderId);
    state = state.copyWith(isLoading: false);
    return res;
  }

  Future<void> saveCart(Cart? cart) async {
    if (cartData == null) {
      cart = cart!.copyWith.call(
        franchiseId: cart.franchiseId,
        franchiseName: cart.franchiseName,
        preparationTime: cart.preparationTime,
        vendorId: cart.vendorId,
        restaurantName: cart.restaurantName,
      );
      cart = cart.copyWith(products: cart.products);
      final cartTotal = cart.products
          .map((e) => e.totalProductPrice)
          .reduce((_, __) => _ + __);
      cart = cart.copyWith(subTotal: cartTotal);
      await cartState.updateCart(cart);

      await Get.to(() => CartScreen(
            backButton: true,
          ));
    } else {
      await customDialog(
        title:
            '${'SOME_PRODUCTS_ARE_ALREADY_ADDED_IN'.tr} ${cartData?.franchiseName} ${'FIRST_CLEAN_YOUR_CART'.tr}',
        textConfirm: 'CLEAN CART'.tr,
        onConfirmListener: () async {
          await cartState.deleteCart();
          Get.back();
        },
      );
    }
  }
}
