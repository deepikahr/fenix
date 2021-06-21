import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/models/api_request_models/cart/cart.dart';
import 'package:restaurant_saas/network/api_service.dart';
import 'package:restaurant_saas/providers/cart_notifier.dart';
import 'package:restaurant_saas/screens/auth/addNumber/addNumberState.dart';
import 'package:restaurant_saas/screens/auth/addNumber/addNumberStateNotifier.dart';
import 'package:restaurant_saas/screens/auth/userInfo/userInfoState.dart';
import 'package:restaurant_saas/screens/auth/userInfo/userInfoStateNotifier.dart';
import 'package:restaurant_saas/screens/auth/verifyNumber/verifyNumberState.dart';
import 'package:restaurant_saas/screens/auth/verifyNumber/verifyNumberStateNotifier.dart';
import 'package:restaurant_saas/screens/checkout/applyCoupon/applyCouponState.dart';
import 'package:restaurant_saas/screens/checkout/applyCoupon/applyCouponStateNotifier.dart';
import 'package:restaurant_saas/screens/checkout/cart_screen/cartScreenState.dart';
import 'package:restaurant_saas/screens/checkout/cart_screen/cartStateNotifier.dart';
import 'package:restaurant_saas/screens/home/browseByBrand/browseByBrandState.dart';
import 'package:restaurant_saas/screens/home/browseByBrand/browseByBrandStateNotifier.dart';
import 'package:restaurant_saas/screens/home/browseByCuisine/browseByCuisineState.dart';
import 'package:restaurant_saas/screens/home/browseByCuisine/browseByCuisineStateNotifier.dart';
import 'package:restaurant_saas/screens/home/home/homeState.dart';
import 'package:restaurant_saas/screens/home/home/homeStateNotifier.dart';
import 'package:restaurant_saas/screens/home/homeTabs/homeTabsState.dart';
import 'package:restaurant_saas/screens/home/homeTabs/homeTabsStateNotifier.dart';
import 'package:restaurant_saas/screens/orders/liveTracking/liveTrackingState.dart';
import 'package:restaurant_saas/screens/orders/liveTracking/liveTrackingStateNotifier.dart';
import 'package:restaurant_saas/screens/orders/orderDetails/orderDetailsState.dart';
import 'package:restaurant_saas/screens/orders/orderDetails/orderDetailsStateNotifier.dart';
import 'package:restaurant_saas/screens/orders/orders/ordersState.dart';
import 'package:restaurant_saas/screens/orders/orders/ordersStateNotifier.dart';
import 'package:restaurant_saas/screens/orders/user_to_admin_chat/userToAdminChatState.dart';
import 'package:restaurant_saas/screens/orders/user_to_admin_chat/userToAdminChatStateNotifier.dart';
import 'package:restaurant_saas/screens/orders/user_to_delivery_boy_chat/userToDeliveryBoyChatState.dart';
import 'package:restaurant_saas/screens/orders/user_to_delivery_boy_chat/userToDeliveryBoyChatStateNotifier.dart';
import 'package:restaurant_saas/screens/others/cookie_screen/cookieScreenState.dart';
import 'package:restaurant_saas/screens/others/cookie_screen/cookieScreenStateNotifier.dart';
import 'package:restaurant_saas/screens/others/editProfile/editProfileState.dart';
import 'package:restaurant_saas/screens/others/editProfile/editProfileStateNotifier.dart';
import 'package:restaurant_saas/screens/others/favorites/favoritesState.dart';
import 'package:restaurant_saas/screens/others/favorites/favoritesStateNotifier.dart';
import 'package:restaurant_saas/screens/others/htmlPage/htmlPageScreenState.dart';
import 'package:restaurant_saas/screens/others/htmlPage/htmlPageScreenStateNotifier.dart';
import 'package:restaurant_saas/screens/others/manageAddress/manageAddressState.dart';
import 'package:restaurant_saas/screens/others/manageAddress/manageAddressStateNotifier.dart';
import 'package:restaurant_saas/screens/others/product_rating/product_ratingState.dart';
import 'package:restaurant_saas/screens/others/product_rating/product_ratingStateNotifier.dart';
import 'package:restaurant_saas/screens/others/profile/profileScreenState.dart';
import 'package:restaurant_saas/screens/others/profile/profileScreenStateNotifier.dart';
import 'package:restaurant_saas/screens/others/rating/ratingState.dart';
import 'package:restaurant_saas/screens/others/rating/ratingStateNotifier.dart';
import 'package:restaurant_saas/screens/others/cookie_dialog/cookieDialogState.dart';
import 'package:restaurant_saas/screens/others/cookie_dialog/cookieDialogStateNotifier.dart';
import 'package:restaurant_saas/screens/payment/addMoney/addMoneyState.dart';
import 'package:restaurant_saas/screens/payment/addMoney/addMoneyStateNotifier.dart';
import 'package:restaurant_saas/screens/payment/payment/paymentState.dart';
import 'package:restaurant_saas/screens/payment/payment/paymentStateNotifier.dart';
import 'package:restaurant_saas/screens/payment/recentTransactions/recentTransactionsState.dart';
import 'package:restaurant_saas/screens/payment/referAndEarn/referAndEarnState.dart';
import 'package:restaurant_saas/screens/payment/referAndEarn/referAndEarnStateNotifier.dart';
import 'package:restaurant_saas/screens/payment/wallet/walletState.dart';
import 'package:restaurant_saas/screens/pre_auth/enterLocation/enterLocationState.dart';
import 'package:restaurant_saas/screens/pre_auth/enterLocation/enterLocationStateNotifier.dart';
import 'package:restaurant_saas/screens/pre_auth/locationMap/locationMapState.dart';
import 'package:restaurant_saas/screens/pre_auth/locationMap/locationMapStateNotifier.dart';
import 'package:restaurant_saas/screens/pre_auth/pickLocation/pickLocationState.dart';
import 'package:restaurant_saas/screens/pre_auth/pickLocation/pickLocationStateNotifier.dart';
import 'package:restaurant_saas/screens/products/productSelection/productSelectionState.dart';
import 'package:restaurant_saas/screens/products/productSelection/productSelectionStateNotifier.dart';
import 'package:restaurant_saas/screens/restaurant/restaurantScreenState.dart';
import 'package:restaurant_saas/screens/restaurant/restaurantScreenStateNotifier.dart';
import 'package:restaurant_saas/screens/search/search/searchState.dart';
import 'package:restaurant_saas/screens/search/search/searchStateNotifier.dart';
import 'package:restaurant_saas/screens/view_all/view_all_state.dart';
import 'package:restaurant_saas/screens/view_all/view_all_state_notifier.dart';
import 'package:restaurant_saas/screens/others/wallet_dialog/walletDialogStateNotifier.dart';
import 'package:restaurant_saas/screens/others/wallet_dialog/walletDialogState.dart';
import '../database/db.dart';
import '../screens/payment/recentTransactions/recentTransactionsStateNotifier.dart';
import '../screens/payment/wallet/walletStateNotifier.dart';

final apiProvider = Provider((ref) => API());
final dbProvider = Provider((ref) => DB());

final addNumberProvider =
    StateNotifierProvider.autoDispose<AddNumberStateNotifier, AddNumberState>(
        (ref) {
  final api = ref.watch(apiProvider);
  return AddNumberStateNotifier(api);
});

final editProfileProvider = StateNotifierProvider.autoDispose<
    EditProfileStateNotifier, EditProfileState>((ref) {
  final api = ref.watch(apiProvider);
  return EditProfileStateNotifier(api);
});
final cookieDialogProvider = StateNotifierProvider.autoDispose<
    CookieDialogStateNotifier, CookieDialogState>((ref) {
  final api = ref.watch(apiProvider);
  return CookieDialogStateNotifier(api);
});

final walletDialogProvider = StateNotifierProvider.autoDispose<
    WalletDialogStateNotifier, WalletDialogState>((ref) {
  final api = ref.watch(apiProvider);
  final db = ref.watch(dbProvider);

  return WalletDialogStateNotifier(api, db);
});
final cookieScreenProvider = StateNotifierProvider.autoDispose<
    CookieScreenStateNotifier, CookieScreenState>((ref) {
  final api = ref.watch(apiProvider);
  return CookieScreenStateNotifier(api);
});

final verifyNumberProvider = StateNotifierProvider.autoDispose<
    VerifyNumberStateNotifier, VerifyNumberState>((ref) {
  final api = ref.watch(apiProvider);
  final db = ref.watch(dbProvider);
  return VerifyNumberStateNotifier(api, db);
});

final userInfoProvider =
    StateNotifierProvider.autoDispose<UserInfoStateNotifier, UserInfoState>(
        (ref) {
  final api = ref.watch(apiProvider);
  return UserInfoStateNotifier(api);
});

final enterLocationProvider = StateNotifierProvider.autoDispose<
    EnterLocationStateNotifier, EnterLocationState>((ref) {
  final api = ref.watch(apiProvider);
  return EnterLocationStateNotifier(api);
});
final pickLocationProvider = StateNotifierProvider.autoDispose<
    PickLocationStateNotifier, PickLocationState>((ref) {
  final api = ref.watch(apiProvider);
  return PickLocationStateNotifier(api);
});
final homeProvider =
    StateNotifierProvider.autoDispose<HomeStateNotifier, HomeState>((ref) {
  final api = ref.watch(apiProvider);
  final db = ref.watch(dbProvider);
  return HomeStateNotifier(api, db);
});

final locationMapProvider = StateNotifierProvider.autoDispose<
    LocationMapStateNotifier, LocationMapState>((ref) {
  final api = ref.watch(apiProvider);
  return LocationMapStateNotifier(api);
});

final homeTabsProvider =
    StateNotifierProvider.autoDispose<HomeTabsStateNotifier, HomeTabsState>(
        (ref) {
  final api = ref.watch(apiProvider);
  return HomeTabsStateNotifier(api);
});
final favoritesProvider =
    StateNotifierProvider.autoDispose<FavoritesStateNotifier, FavoritesState>(
        (ref) {
  final api = ref.watch(apiProvider);
  return FavoritesStateNotifier(api);
});

final ordersProvider =
    StateNotifierProvider.autoDispose<OrdersStateNotifier, OrdersState>((ref) {
  final api = ref.watch(apiProvider);
  final db = ref.watch(dbProvider);
  final cartState = ref.watch(cartProvider.notifier);

  return OrdersStateNotifier(api, db, cartState);
});

final ratingProvider =
    StateNotifierProvider.autoDispose<RatingStateNotifier, RatingState>((ref) {
  final api = ref.watch(apiProvider);
  return RatingStateNotifier(api);
});

final restaurantProvider = StateNotifierProvider.autoDispose<
    RestaurantScreenStateNotifier, RestaurantScreenState>((ref) {
  final api = ref.watch(apiProvider);
  final db = ref.watch(dbProvider);
  final cartState = ref.watch(cartProvider.notifier);
  return RestaurantScreenStateNotifier(api, db, cartState);
});

final browseByCuisineProvider = StateNotifierProvider.autoDispose<
    BrowseByCuisineStateNotifier, BrowseByCuisineState>((ref) {
  final api = ref.watch(apiProvider);
  return BrowseByCuisineStateNotifier(api);
});
final browseByBrandProvider = StateNotifierProvider.autoDispose<
    BrowseByBrandStateNotifier, BrowseByBrandState>((ref) {
  final api = ref.watch(apiProvider);
  return BrowseByBrandStateNotifier(api);
});
final viewAllProvider =
    StateNotifierProvider.autoDispose<ViewAllStateNotifier, ViewAllState>(
        (ref) {
  final api = ref.watch(apiProvider);
  return ViewAllStateNotifier(api);
});
final cartScreenProvider =
    StateNotifierProvider.autoDispose<CartStateNotifier, CartScreenState>(
        (ref) {
  final api = ref.watch(apiProvider);
  final db = ref.watch(dbProvider);
  final cartState = ref.watch(cartProvider.notifier);
  return CartStateNotifier(api, db, cartState);
});
final manageAddressProvider = StateNotifierProvider.autoDispose<
    ManageAddressStateNotifier, ManageAddressState>((ref) {
  final api = ref.watch(apiProvider);
  return ManageAddressStateNotifier(api);
});

final liveTrackingProvider = StateNotifierProvider.autoDispose<
    LiveTrackingStateNotifier, LiveTrackingState>((ref) {
  final api = ref.watch(apiProvider);
  return LiveTrackingStateNotifier(api);
});

final profileScreenProvider = StateNotifierProvider.autoDispose<
    ProfileScreenStateNotifier, ProfileScreenState>((ref) {
  final api = ref.watch(apiProvider);
  final db = ref.watch(dbProvider);
  return ProfileScreenStateNotifier(api, db);
});
final orderDetailsProvider = StateNotifierProvider.autoDispose<
    OrderDetailsStateNotifier, OrderDetailsState>((ref) {
  final api = ref.watch(apiProvider);
  final db = ref.watch(dbProvider);
  final cartState = ref.watch(cartProvider.notifier);

  return OrderDetailsStateNotifier(api, db, cartState);
});

final productRatingProvider = StateNotifierProvider.autoDispose<
    ProductRatingStateNotifier, ProductRatingState>((ref) {
  final api = ref.watch(apiProvider);
  return ProductRatingStateNotifier(api);
});

final searchProvider =
    StateNotifierProvider.autoDispose<SearchStateNotifier, SearchState>((ref) {
  final api = ref.watch(apiProvider);
  final db = ref.watch(dbProvider);
  final cartState = ref.watch(cartProvider.notifier);
  return SearchStateNotifier(api, db, cartState);
});

final userToAdminChatProvider = StateNotifierProvider.autoDispose<
    UserToAdminChatStateNotifier, UserToAdminChatState>((ref) {
  final api = ref.watch(apiProvider);
  return UserToAdminChatStateNotifier(api);
});

final userToDeliveryBoyChatProvider = StateNotifierProvider.autoDispose<
    UserToDeliveryBoyChatStateNotifier, UserToDeliveryBoyChatState>((ref) {
  final api = ref.watch(apiProvider);
  return UserToDeliveryBoyChatStateNotifier(api);
});

final couponListProvider = StateNotifierProvider.autoDispose<
    ApplyCouponStateNotifier, ApplyCouponState>((ref) {
  final api = ref.watch(apiProvider);
  final cartState = ref.watch(cartProvider.notifier);
  return ApplyCouponStateNotifier(api, cartState);
});

final addMoneyProvider =
    StateNotifierProvider.autoDispose<AddMoneyStateNotifier, AddMoneyState>(
        (ref) {
  final api = ref.watch(apiProvider);
  final db = ref.watch(dbProvider);

  return AddMoneyStateNotifier(api, db);
});

final recentTransactionsProvider = StateNotifierProvider.autoDispose<
    RecentTransactionsStateNotifier, RecentTransactionsState>((ref) {
  final api = ref.watch(apiProvider);
  final db = ref.watch(dbProvider);

  return RecentTransactionsStateNotifier(api, db);
});

final walletProvider =
    StateNotifierProvider.autoDispose<WalletStateNotifier, WalletState>((ref) {
  final api = ref.watch(apiProvider);
  final db = ref.watch(dbProvider);

  return WalletStateNotifier(api, db);
});

final productSizeProvider = StateNotifierProvider.autoDispose<
    ProductSelectionStateNotifier, ProductSelectionState>((ref) {
  final api = ref.watch(apiProvider);
  final db = ref.watch(dbProvider);
  final cartState = ref.watch(cartProvider.notifier);

  return ProductSelectionStateNotifier(api, db, cartState);
});

final paymentScreenProvider =
    StateNotifierProvider.autoDispose<PaymentStateNotifier, PaymentState>(
        (ref) {
  final api = ref.watch(apiProvider);
  final cartState = ref.watch(cartProvider.notifier);
  return PaymentStateNotifier(api, cartState);
});

final htmlPageScreenProvider = StateNotifierProvider.autoDispose<
    HtmlPageScreenStateNotifier, HtmlPageScreenState>((ref) {
  final api = ref.watch(apiProvider);
  return HtmlPageScreenStateNotifier(api);
});

final referPageProvider = StateNotifierProvider.autoDispose<
    ReferAndEarnStateNotifier, ReferAndEarnState>((ref) {
  final api = ref.watch(apiProvider);
  final db = ref.watch(dbProvider);

  return ReferAndEarnStateNotifier(api, db);
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
