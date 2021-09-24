import 'dart:convert';

import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/cart/cart.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/network/printer.dart';
import 'package:fenix_user/providers/cart_notifier.dart';
import 'package:fenix_user/screens/auth/access_setting/access_setting_state.dart';
import 'package:fenix_user/screens/auth/access_setting/access_setting_state_notifier.dart';
import 'package:fenix_user/screens/auth/change_password/change_password_state.dart';
import 'package:fenix_user/screens/auth/change_password/change_password_state_notifier.dart';
import 'package:fenix_user/screens/auth/login/login_notifier.dart';
import 'package:fenix_user/screens/auth/login/login_state.dart';
import 'package:fenix_user/screens/cart_screen/cart_screen_notifier.dart';
import 'package:fenix_user/screens/cart_screen/cart_screen_state.dart';
import 'package:fenix_user/screens/category/category_state.dart';
import 'package:fenix_user/screens/category/category_state_notifier.dart';
import 'package:fenix_user/screens/drawer/drawer_state.dart';
import 'package:fenix_user/screens/drawer/drawer_state_notifier.dart';
import 'package:fenix_user/screens/home/home_notifier.dart';
import 'package:fenix_user/screens/home/home_state.dart';
import 'package:fenix_user/screens/home_tabs/home_tabs_notifier.dart';
import 'package:fenix_user/screens/home_tabs/home_tabs_state.dart';
import 'package:fenix_user/screens/notify_waiter/notify_waiter_state.dart';
import 'package:fenix_user/screens/notify_waiter/notify_waiter_state_notifier.dart';
import 'package:fenix_user/screens/order_details/order_details_state.dart';
import 'package:fenix_user/screens/order_details/order_details_state_notifier.dart';
import 'package:fenix_user/screens/order_in_processs/order_in_process_state.dart';
import 'package:fenix_user/screens/order_in_processs/order_in_process_state_notifier.dart';
import 'package:fenix_user/screens/payment/payment_screen_state.dart';
import 'package:fenix_user/screens/payment/payment_screen_state_notifier.dart';
import 'package:fenix_user/screens/payment_in_processs/payment_in_processs_state.dart';
import 'package:fenix_user/screens/payment_in_processs/payment_in_processs_state_notifier.dart';
import 'package:fenix_user/screens/product/product_details/product_details_notifier.dart';
import 'package:fenix_user/screens/product/product_details/product_details_state.dart';
import 'package:fenix_user/screens/product/product_list/product_list_notifier.dart';
import 'package:fenix_user/screens/product/product_list/product_list_state.dart';
import 'package:fenix_user/screens/settings/settings_state.dart';
import 'package:fenix_user/screens/settings/settings_state_notifier.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final apiProvider = Provider((ref) => API());
final dbProvider = Provider((ref) => DB());
final printerProvider = Provider((ref) => PrinterService(ref));

final cartProvider = StateNotifierProvider<CartNotifier, Cart?>((ref) {
  final box = Hive.box('user');
  final dbCart = box.get('cart');
  Cart? cart;
  if (dbCart != null) {
    cart = Cart.fromJson(json.decode(dbCart));
  }
  return CartNotifier(cart: cart);
});

final homeTabsProvider =
    StateNotifierProvider.autoDispose<HomeTabsNotifier, HomeTabsState>((ref) {
  return HomeTabsNotifier(ref);
});

final loginProvider =
    StateNotifierProvider.autoDispose<LoginNotifier, LoginState>((ref) {
  return LoginNotifier(ref);
});

final homeProvider =
    StateNotifierProvider.autoDispose<HomeNotifier, HomeState>((ref) {
  return HomeNotifier(ref);
});

final productListProvider =
    StateNotifierProvider.autoDispose<ProductListNotifier, ProductListState>(
        (ref) {
  return ProductListNotifier(ref);
});

final productDetailsProvider = StateNotifierProvider.autoDispose<
    ProductDetailsNotifier, ProductDetailsState>((ref) {
  return ProductDetailsNotifier(ref);
});

final categoryProvider =
    StateNotifierProvider.autoDispose<CategoryStateNotifier, CategoryState>(
        (ref) {
  return CategoryStateNotifier(ref);
});

final settingsProvider =
    StateNotifierProvider.autoDispose<SettingsStateNotifier, SettingsState>(
        (ref) {
  return SettingsStateNotifier(ref);
});

final drawerProvider =
    StateNotifierProvider.autoDispose<DrawerStateNotifier, DrawerState>((ref) {
  return DrawerStateNotifier(ref);
});

final accessSettingsProvider = StateNotifierProvider.autoDispose<
    AccessSettingsStateNotifier, AccessSettingsState>((ref) {
  return AccessSettingsStateNotifier(ref);
});

final changePasswordProvider = StateNotifierProvider.autoDispose<
    ChangePasswordStateNotifier, ChangePasswordState>((ref) {
  return ChangePasswordStateNotifier(ref);
});

final cartScreenProvider =
    StateNotifierProvider.autoDispose<CartScreenNotifier, CartScreenState>(
        (ref) {
  return CartScreenNotifier(ref);
});

final notifyWaiterProvider = StateNotifierProvider.autoDispose<
    NotifyWaiterStateNotifier, NotifyWaiterState>((ref) {
  return NotifyWaiterStateNotifier(ref);
});

final orderDetailsProvider = StateNotifierProvider.autoDispose<
    OrderDetailsStateNotifier, OrderDetailsState>((ref) {
  return OrderDetailsStateNotifier(ref);
});

final paymentScreenProvider = StateNotifierProvider.autoDispose<
    PaymentScreenStateNotifier, PaymentScreenState>((ref) {
  return PaymentScreenStateNotifier(ref);
});

final paymentInProcess = StateNotifierProvider.autoDispose<
    PaymentInProcessStateNotifier, PaymentInProcessState>((ref) {
  return PaymentInProcessStateNotifier(ref);
});

final orderInProcess = StateNotifierProvider.autoDispose<
    OrderInProcessStateNotifier, OrderInProcessState>((ref) {
  return OrderInProcessStateNotifier(ref);
});
