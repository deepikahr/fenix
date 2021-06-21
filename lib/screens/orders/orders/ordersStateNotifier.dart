import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/database/db.dart';
import 'package:restaurant_saas/models/api_request_models/cart/cart.dart';
import 'package:restaurant_saas/network/api_service.dart';
import 'package:restaurant_saas/providers/cart_notifier.dart';
import 'package:restaurant_saas/screens/checkout/cart_screen/cart_screen.dart';
import 'package:restaurant_saas/widgets/alertBox.dart';

import 'ordersState.dart';

class OrdersStateNotifier extends StateNotifier<OrdersState> {
  final API api;
  final DB db;
  final CartNotifier cartState;
  Cart? get cartData {
    return cartState.state;
  }

  OrdersStateNotifier(this.api, this.db, this.cartState) : super(OrdersState());

  Future<void> onUpcomingSelect() async {
    state = state.copyWith(
        showUpcoming: true,
        showDelivered: false,
        orders: [],
        pageNumber: 1,
        total: 0);
    await fetchUpComingOrders();
  }

  Future<void> onDeliveredSelect() async {
    state = state.copyWith(
        showUpcoming: false,
        showDelivered: true,
        orders: [],
        pageNumber: 1,
        total: 0);
    await fetchCompletedOrders();
  }

  Future<void> fetchUpComingOrders() async {
    if (state.pageNumber == 1) state = state.copyWith(isLoading: true);
    final res = await api.ordersUpcomingList(page: state.pageNumber);
    if (res != null) {
      state = state.copyWith.call(
          orders: [...state.orders, ...res.data],
          pageNumber: state.pageNumber + 1,
          total: res.total);
      state = state.copyWith(
        isLoading: false,
        currencySymbol: db.getCurrencySymbol(),
      );
    }
  }

  Future<void> fetchCompletedOrders() async {
    if (state.pageNumber == 1) state = state.copyWith(isLoading: true);
    final res = await api.ordersCompletedList(page: state.pageNumber);
    if (res != null) {
      state = state.copyWith(
          isLoading: false,
          orders: [...state.orders, ...res.data],
          pageNumber: state.pageNumber + 1,
          total: res.total);
    }

    state = state.copyWith(
      isLoading: false,
      currencySymbol: db.getCurrencySymbol(),
    );
  }

  Future<void> cancelOrder(String orderId, index) async {
    state = state.copyWith(isLoading: true);
    final res = await api.cancelOrder(orderId);
    if (res != null) {
      state.orders.removeAt(index);
      state = state.copyWith(orders: state.orders);
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
        status: DIALOG_STATUS.WARNING,
        title:
            '${'SOME_PRODUCTS_ARE_ALREADY_ADDED_IN'.tr} ${cartData?.franchiseName} ${'FIRST_CLEAN_YOUR_CART'.tr}',
        textConfirm: 'CLEAN_CART'.tr,
        onConfirmListener: () async {
          await cartState.deleteCart();
          Get.back();
        },
      );
    }
  }
}
