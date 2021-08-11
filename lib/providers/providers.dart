import 'dart:convert';

import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/cart/cart.dart';
import 'package:fenix_user/screens/auth/access_settings/accessSettingsState.dart';
import 'package:fenix_user/screens/auth/access_settings/accessSettingsStateNotifier.dart';
import 'package:fenix_user/screens/auth/change_password/changePasswordState.dart';
import 'package:fenix_user/screens/auth/change_password/changePasswordStateNotifier.dart';
import 'package:fenix_user/screens/auth/login/loginState.dart';
import 'package:fenix_user/screens/auth/login/loginStateNotifier.dart';
import 'package:fenix_user/screens/home/drawer/drawerState.dart';
import 'package:fenix_user/screens/home/drawer/drawerStateNotifier.dart';
import 'package:fenix_user/screens/home/home/homeState.dart';
import 'package:fenix_user/screens/home/home/homeStateNotifier.dart';
import 'package:fenix_user/screens/home/home_tabs/homeTabsState.dart';
import 'package:fenix_user/screens/home/home_tabs/homeTabsStateNotifier.dart';
import 'package:fenix_user/screens/tabs/cart/cartState.dart';
import 'package:fenix_user/screens/others/notify_waiter/notifyWaiterState.dart';
import 'package:fenix_user/screens/others/notify_waiter/notifyWaiterStateNotifier.dart';
import 'package:fenix_user/screens/others/settings/settingsState.dart';
import 'package:fenix_user/screens/others/settings/settingsStateNotifier.dart';
import 'package:fenix_user/screens/product/product_details/productDetailsState.dart';
import 'package:fenix_user/screens/product/product_details/productDetailsStateNotifier.dart';
import 'package:fenix_user/screens/tabs/cart/cartStateNotifier.dart';
import 'package:fenix_user/screens/product/product_list/productListState.dart';
import 'package:fenix_user/screens/product/product_list/productListStateNotifier.dart';
import 'package:fenix_user/screens/tabs/category/categoryState.dart';
import 'package:fenix_user/screens/tabs/category/categoryStateNotifier.dart';
import 'package:fenix_user/screens/tabs/order_details/orderDetailsState.dart';
import 'package:fenix_user/screens/tabs/order_details/orderDetailsStateNotifier.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:fenix_user/network/api_service.dart';

import 'cart_notifier.dart';

final apiProvider = Provider((ref) => API());
final dbProvider = Provider((ref) => DB());

final homeTabsProvider =
    StateNotifierProvider.autoDispose<HomeTabsStateNotifier, HomeTabsState>(
        (ref) {
  return HomeTabsStateNotifier();
});

final homeProvider =
StateNotifierProvider.autoDispose<HomeStateNotifier, HomeState>((ref) {
  final api = ref.watch(apiProvider);
  final db = ref.watch(dbProvider);
  return HomeStateNotifier(api, db);
});

final categoryProvider =
StateNotifierProvider.autoDispose<CategoryStateNotifier, CategoryState>((ref) {
  final api = ref.watch(apiProvider);
  final db = ref.watch(dbProvider);
  return CategoryStateNotifier(api, db);
});

final loginProvider =
    StateNotifierProvider.autoDispose<LoginStateNotifier, LoginState>((ref) {
  final api = ref.watch(apiProvider);
  final db = ref.watch(dbProvider);
  return LoginStateNotifier(api, db);
});

final changePasswordProvider =
StateNotifierProvider.autoDispose<ChangePasswordStateNotifier, ChangePasswordState>((ref) {
  final api = ref.watch(apiProvider);
  final db = ref.watch(dbProvider);
  return ChangePasswordStateNotifier(api, db);
});

final accessSettingsProvider =
StateNotifierProvider.autoDispose<AccessSettingsStateNotifier, AccessSettingsState>((ref) {
  final api = ref.watch(apiProvider);
  final db = ref.watch(dbProvider);
  return AccessSettingsStateNotifier(api, db);
});

final settingsProvider =
StateNotifierProvider.autoDispose<SettingsStateNotifier, SettingsState>((ref) {
  final api = ref.watch(apiProvider);
  final db = ref.watch(dbProvider);
  return SettingsStateNotifier(api, db);
});

final productListProvider =
StateNotifierProvider.autoDispose<ProductListStateNotifier, ProductListState>((ref) {
  final api = ref.watch(apiProvider);
  final db = ref.watch(dbProvider);
  final cartState = ref.watch(cartProvider.notifier);
  return ProductListStateNotifier(api, db, cartState);
});

final productDetailsProvider =
StateNotifierProvider.autoDispose<ProductDetailsStateNotifier, ProductDetailsState>((ref) {
  final api = ref.watch(apiProvider);
  final db = ref.watch(dbProvider);
  final cartState = ref.watch(cartProvider.notifier);
  return ProductDetailsStateNotifier(api, db, cartState);
});

final cartScreenProvider =
StateNotifierProvider.autoDispose<CartScreenStateNotifier, CartScreenState>(
        (ref) {
      final api = ref.watch(apiProvider);
      final db = ref.watch(dbProvider);
      final cartState = ref.watch(cartProvider.notifier);
      return CartScreenStateNotifier(api, db, cartState);
    });

final cartProvider = StateNotifierProvider<CartNotifier, Cart?>(
      (ref) {
    final box = Hive.box('user');
    final dbCart = box.get('cart');
    Cart? cart;
    if (dbCart != null) {
      cart = Cart.fromJson(json.decode(dbCart));
    }
    return CartNotifier(cart: cart);
  },
);

final orderDetailsProvider =
StateNotifierProvider.autoDispose<OrderDetailsStateNotifier, OrderDetailsState>((ref) {
  final api = ref.watch(apiProvider);
  final db = ref.watch(dbProvider);
  return OrderDetailsStateNotifier(api, db,);
});

final notifyWaiterProvider =
StateNotifierProvider.autoDispose<NotifyWaiterStateNotifier, NotifyWaiterState>((ref) {
  final api = ref.watch(apiProvider);
  final db = ref.watch(dbProvider);
  return NotifyWaiterStateNotifier(api, db,);
});

final drawerProvider =
StateNotifierProvider.autoDispose<DrawerStateNotifier, DrawerState>((ref) {
  final api = ref.watch(apiProvider);
  final db = ref.watch(dbProvider);
  return DrawerStateNotifier(api, db,);
});