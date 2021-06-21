import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/main.dart';
import 'package:restaurant_saas/models/api_request_models/cart/cart.dart';
import 'package:restaurant_saas/models/api_response_models/coupon_response/coupon_response.dart';
import 'package:restaurant_saas/network/api_service.dart';
import 'package:restaurant_saas/providers/cart_notifier.dart';
import 'package:restaurant_saas/widgets/alertBox.dart';

import 'applyCouponState.dart';

class ApplyCouponStateNotifier extends StateNotifier<ApplyCouponState> {
  final API api;
  final CartNotifier cartState;

  Cart? get cart {
    return cartState.state;
  }

  ApplyCouponStateNotifier(this.api, this.cartState)
      : super(ApplyCouponState());

  void checkCouponsList() async {
    if (state.pageNumber == 1) {
      state = state.copyWith(isLoading: true);
    }

    final couponLists =
        await api.getCouponsList(state.pageNumber, cart!.franchiseId!);
    if (couponLists != null) {
      state = state.copyWith(
        couponsList: [...state.couponsList, ...couponLists.coupons],
        pageNumber: state.pageNumber + 1,
        total: couponLists.total,
        cart: cart,
        currencySymbol: db.getCurrencySymbol(),
      );
    }
    state = state.copyWith(isLoading: false);
  }

  Future<CouponResponse?> checkCouponValidate(
      String couponCode, Cart? cart) async {
    final response = await api.checkCouponCodeValidate(couponCode, cart);
    return response;
  }

  Future<void> calculateCouponAmount(
      CouponResponse response, String? currencySymbol) async {
    if (state.cart != null) {
      if (response.couponFor == COUPON_FOR.order) {
        if (state.cart!.subTotal >= response.minimumOrderAmount) {
          await saveAmount(response, state.cart!.subTotal);
        } else {
          await customDialog(
            status: DIALOG_STATUS.SUCCESS,
            title:
                'Amount should be more than $currencySymbol${response.minimumOrderAmount}',
          );
        }
      } else if (response.couponFor == COUPON_FOR.product) {
        final total = state.cart!.products
            .map((e) => (e.id == response.id) ? e.totalProductPrice : 0.0)
            .reduce((_, __) => _ + __);
        if (total > 0) {
          await saveAmount(response, total);
        } else {
          await customDialog(
              status: DIALOG_STATUS.FAIL,
              title: 'Sorry!!!, No coupon product added in your cart');
        }
      } else if (response.couponFor == COUPON_FOR.category) {
        final total = state.cart!.products
            .map((e) => (e.categoryId == response.categoryId)
                ? e.totalProductPrice
                : 0.0)
            .reduce((_, __) => _ + __);
        if (total > 0) {
          await saveAmount(response, total);
        } else {
          await customDialog(
              status: DIALOG_STATUS.FAIL,
              title: 'Sorry!!!, No coupon products added in your cart');
        }
      }
    } else {
      await customDialog(
          status: DIALOG_STATUS.FAIL, title: 'Cart is empty!!..');
    }
  }

  Future<void> saveAmount(CouponResponse response, amount) async {
    state = state.copyWith(
      cart: state.cart!.copyWith(
          couponCode: response.couponCode,
          couponAmount: (response.couponType == COUPON_TYPS.percentage
              ? (amount * (response.offerValue / 100))
              : response.offerValue)),
    );
    await cartState.updateCart(state.cart);
    Get.back();
  }
}
