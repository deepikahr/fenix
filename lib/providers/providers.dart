import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/cart/cart.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/providers/cart_notifier.dart';
import 'package:fenix_user/screens/auth/login/login_notifier.dart';
import 'package:fenix_user/screens/auth/login/login_state.dart';
import 'package:fenix_user/screens/home/home_notifier.dart';
import 'package:fenix_user/screens/home/home_state.dart';
import 'package:fenix_user/screens/home_tabs/home_tabs_notifier.dart';
import 'package:fenix_user/screens/home_tabs/home_tabs_state.dart';
import 'package:fenix_user/screens/product/product_details/product_details_notifier.dart';
import 'package:fenix_user/screens/product/product_details/product_details_state.dart';
import 'package:fenix_user/screens/product/product_list/product_list_notifier.dart';
import 'package:fenix_user/screens/product/product_list/product_list_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final apiProvider = Provider((ref) => API());
final dbProvider = Provider((ref) => DB());

final cartProvider = StateNotifierProvider<CartNotifier, Cart?>((ref) {
  return CartNotifier();
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
