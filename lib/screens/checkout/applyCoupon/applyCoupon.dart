import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/common/utils.dart';
import 'package:restaurant_saas/models/api_request_models/cart/cart.dart';
import 'package:restaurant_saas/models/api_response_models/coupon_response/coupon_response.dart';
import 'package:restaurant_saas/providers/providers.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/appbar.dart';
import 'package:restaurant_saas/widgets/normalText.dart';
import 'package:restaurant_saas/screens/checkout/applyCoupon/applyCouponShimmer.dart';
import 'package:get/get.dart';

class ApplyCoupon extends HookWidget {
  final focusNode = FocusNode();
  final GlobalKey<FormFieldState> formKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    final _scrollController = useScrollController();
    final sendMessageTextController = useTextEditingController();
    final state = useProvider(couponListProvider);
    final isMounted = useIsMounted();
    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () {
          context.read(couponListProvider.notifier).checkCouponsList();
        });
      }
      return;
    }, const []);
    return Scaffold(
      appBar: titleAppbar(context, 'COUPONS'.tr),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListView.builder(
                    physics: ScrollPhysics(),
                    controller: _scrollController,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: state.couponsList.length,
                    itemBuilder: (BuildContext context, int i) {
                      handleScrollWithIndex(
                          i,
                          state.pageNumber,
                          () => context
                              .read(couponListProvider.notifier)
                              .checkCouponsList());
                      return couponCodeBlock(
                          context, state.couponsList[i], state,
                          cart: state.cart);
                    }),
              ),
              Container(
                decoration: BoxDecoration(color: white),
                child: IconTheme(
                  data: IconThemeData(color: Theme.of(context).accentColor),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      child: commentTextField(
                          context, state, sendMessageTextController, focusNode,
                          (value) async {
                        if (value.isNotEmpty) {
                          await applyCoupon(context, value, state.cart, state);
                        }
                      }),
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (state.isLoading)
            Container(color: Colors.white, child: shimmerCoupon())
        ],
      ),
    );
  }

  Widget commentTextField(BuildContext context, state, controller,
      FocusNode focusNode, ValueChanged<String> onSubmitted) {
    return Container(
      decoration: BoxDecoration(
          color: dark.withOpacity(0.04),
          border: Border.all(color: dark.withOpacity(0.16)),
          borderRadius: BorderRadius.circular(6)),
      child: TextFormField(
        focusNode: focusNode,
        controller: controller,
        key: key,
        keyboardType: TextInputType.text,
        onFieldSubmitted: onSubmitted,
        decoration: InputDecoration(
          suffix: InkWell(
            onTap: () async {
              if (controller != null && controller.text.length > 0) {
                focusNode.unfocus();
                await applyCoupon(context, controller.text, state.cart, state);
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                'APPLY'.tr,
                style: textPrimaryLargeBM(context),
              ),
            ),
          ),
          labelText: 'COUPON_CODE'.tr,
          labelStyle: textDarkLightSmallBR(context),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget couponCodeBlock(BuildContext context, CouponResponse couponData, state,
          {cart}) =>
      InkWell(
        onTap: () => applyCoupon(context, couponData.couponCode, cart, state),
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            titletextBrownSmallBM(context, "${couponData.couponCode ?? ""}"),
            SizedBox(height: 10),
            titleTextDarkRegularBS(
                context,
                couponData.couponType == COUPON_TYPS.percentage
                    ? '${'GET'.tr} ${couponData.offerValue} % ${'OFF'.tr}'
                    : '${'FLAT'.tr} ${state.currencySymbol}${couponData.offerValue} ${'OFF'.tr}'),
            dottedLine(context, darkLight3.withOpacity(0.2), 8),
            titleTextDarkLightXSmallBR(
                context, "${couponData.description ?? ""}")
          ]),
        ),
      );

  Future<void> applyCoupon(
      BuildContext context, couponCode, Cart? cart, state) async {
    final response = await context
        .read(couponListProvider.notifier)
        .checkCouponValidate(couponCode, cart);
    if (response != null) {
      await context
          .read(couponListProvider.notifier)
          .calculateCouponAmount(response, state.currencySymbol);
    }
  }
}
