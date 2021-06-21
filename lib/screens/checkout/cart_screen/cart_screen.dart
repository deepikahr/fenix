import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/models/api_request_models/cart/cart.dart';
import 'package:restaurant_saas/providers/providers.dart';
import 'package:restaurant_saas/screens/auth/addNumber/addNumber.dart';
import 'package:restaurant_saas/screens/checkout/applyCoupon/applyCoupon.dart';
import 'package:restaurant_saas/screens/others/manageAddress/manageAddress.dart';
import 'package:restaurant_saas/screens/payment/payment/payment_screen.dart';
import 'package:restaurant_saas/screens/pre_auth/pickLocation/pickLocation.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/appbar.dart';
import 'package:restaurant_saas/widgets/buttons.dart';
import 'package:restaurant_saas/widgets/checkBox.dart';
import 'package:restaurant_saas/widgets/counterBox.dart';
import 'package:restaurant_saas/widgets/normalText.dart';
import 'package:restaurant_saas/widgets/tipsBlock.dart';
import './cart_shimmer.dart';
import 'package:restaurant_saas/database/db.dart';

final db = DB();

class CartScreen extends HookWidget {
  final bool backButton;

  CartScreen({
    this.backButton = false,
  }) : super();

  @override
  Widget build(BuildContext context) {
    final tipTextEditingController = useTextEditingController();
    final state = useProvider(cartScreenProvider);
    final cart = useProvider(cartProvider);
    final isMounted = useIsMounted();

    useEffect(() {
      Future.delayed(Duration.zero, () async {
        if (isMounted()) {
          await context.read(cartScreenProvider.notifier).init();
          if (cart != null && db.isLoggedIn()) {
            await context
                .read(cartScreenProvider.notifier)
                .fetchTaxDetails(cart.vendorId);
            if (db.getFutureTipValue()) {
              if (db.getFutureTipAmount() > 3) {
                tipTextEditingController.text =
                    db.getFutureTipAmount().toString();
              }
            } else {
              tipTextEditingController.text = '';
            }
          }
        }
      });
      return;
    }, const []);

    return Scaffold(
      backgroundColor: light,
      appBar: backButton
          ? titleAppbar(context, 'CART'.tr)
          : commonAppbar(context, 'CART'.tr) as PreferredSizeWidget?,
      body: Stack(
        children: [
          cart == null || state.showLogin
              ? Center(
                  child: Text('CART_IS_EMPTY'.tr),
                )
              : ListView(children: [
                  productInfoBlock(context, cart, state),
                  couponsBlock(context, cart, () {
                    context.read(cartScreenProvider.notifier).removeCoupon();
                  }),
                  tipsBlock(
                      context, cart.tipAmount, tipTextEditingController, state),
                  billingDetails(context, cart, state),
                ]),
          if (state.isLoading)
            Container(color: Colors.white, child: shimmerCart())
        ],
      ),
      bottomNavigationBar: state.isLoading
          ? Container(height: 0)
          : cart == null || state.showLogin
              ? Container(height: 1)
              : !db.isLoggedIn()
                  ? primaryBlockDoubleTextButton(context, '➡', 'LOGIN'.tr,
                      () async {
                      await Get.to(() => AddNumber());
                    })
                  : cart.address != null &&
                          cart.address?.houseInfo != null &&
                          cart.address?.address != null
                      ? bottomNavigationBlock(
                          context,
                          'DELIVERY_TO_HOME'.tr,
                          '${cart.address?.houseInfo} , ${cart.address?.address}',
                          '${cart.preparationTime} ${'MIN'.tr}',
                          'CHANGE'.tr,
                          cart.grandTotal,
                          cart,
                          state,
                        )
                      : Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 10.0,
                                spreadRadius: 5.0,
                                offset: Offset(
                                  15.0,
                                  15.0,
                                ),
                              )
                            ],
                          ),
                          child: primaryBlockButton(
                            context,
                            'ADD_NEW_ADDRESS'.tr,
                            () async {
                              await Get.to(() => PickLocation(
                                    backButton: true,
                                  ));
                              await context
                                  .read(cartScreenProvider.notifier)
                                  .init();
                            },
                          ),
                        ),
    );
  }

  Widget productInfoBlock(BuildContext context, Cart cart, state) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          restaurantLocationRow(
            context,
            cart.restaurantName,
            cart.franchiseName,
          ),
          dottedLine(context, darkLight3.withOpacity(0.2), 12),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: cart.products.length,
              itemBuilder: (context, i) {
                final cartProduct = cart.products.elementAt(i);
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  (cartProduct.isVeg == null
                                      ? Container(
                                          height: 14,
                                          width: 14,
                                        )
                                      : cartProduct.isVeg == true
                                          ? Container(
                                              height: 14,
                                              width: 14,
                                              decoration: BoxDecoration(
                                                  border:
                                                      Border.all(color: green)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: GFAvatar(
                                                    backgroundColor: green,
                                                    shape:
                                                        GFAvatarShape.circle),
                                              ),
                                            )
                                          : Container(
                                              height: 14,
                                              width: 14,
                                              decoration: BoxDecoration(
                                                  border:
                                                      Border.all(color: red)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: GFAvatar(
                                                    backgroundColor: red,
                                                    shape:
                                                        GFAvatarShape.circle),
                                              ),
                                            )),
                                  SizedBox(width: 3),
                                  titleTextDarkSmallBR(
                                      context, cartProduct.productName),
                                ],
                              ),
                              SizedBox(height: 5),
                              titleTextDarkLightXSmallBR(
                                  context, '${cartProduct.sizeName}'),
                              SizedBox(height: 5),
                              cartProduct.addOnItems.isNotEmpty
                                  ? titleTextDarkLightXSmallBRTR(context,
                                      '${'EXTRA'.tr} : ${cartProduct.addOnItems.map((e) => e.addOnItemName).join(' ,')}')
                                  : Container(),
                              SizedBox(height: 15),
                              Text(
                                '${state.currencySymbol} ${cartProduct.totalProductPrice}',
                                style: textDarkRegularBB(context),
                              ),
                            ],
                          ),
                        ),
                        counterBlock('${cartProduct.quantity}', (increased) {
                          context
                              .read(cartScreenProvider.notifier)
                              .updateQuantity(cartProduct, increased);
                        }),
                      ],
                    ),
                    Divider()
                  ],
                );
              })
        ],
      ),
    );
  }

  Widget couponsBlock(BuildContext context, Cart cart, onPrssed) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        color: Colors.white,
        child: GFListTile(
          onTap: () async {
            await Get.to(() => ApplyCoupon());
            await context.read(cartScreenProvider.notifier).init();
          },
          margin: EdgeInsets.all(0),
          avatar: Image.asset('lib/assets/icons/blackDiscount.png', scale: 3),
          title: titleTextDarkRegularBS(
              context, cart.couponCode ?? 'APPLY_COUPON'.tr),
          icon: cart.couponCode != null
              ? InkWell(onTap: onPrssed, child: Icon(Icons.delete))
              : Image.asset('lib/assets/icons/rightArrow.png', scale: 3),
        ));
  }

  Widget tipsBlock(
      BuildContext context, double selectedTip, controller, state) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
      margin: EdgeInsets.only(top: 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleTextDark17RegularBR(context, 'TIP_OUR_DELIVERY_PARTNER'.tr),
          SizedBox(height: 5),
          titleTextDarkLightXSmallBR(
            context,
            'THANKS_FOR_SUPPORTING_HUNGER_SAVIOURS'.tr,
          ),
          tipsRow(
            context,
            [1, 2, 3],
            selectedTip,
            controller,
            (selectedTip) {
              if (selectedTip != -1) {
                context
                    .read(cartScreenProvider.notifier)
                    .selectTip(selectedTip);
                controller!.text = '';
              } else {
                selectedTip = double.tryParse(controller!.text) ?? .0;
                context
                    .read(cartScreenProvider.notifier)
                    .selectTip(selectedTip);
              }
              context
                  .read(cartScreenProvider.notifier)
                  .checkBoxSaveTip(state.tipCheckBox);
            },
          ),
          checkblock(context, 'CHOOSE_THIS_OPTION_FOR_FEATURE_ORDER'.tr, state),
        ],
      ),
    );
  }

  Widget checkblock(BuildContext context, text, state) {
    return normalCheckBox(context, text, (value) {
      context.read(cartScreenProvider.notifier).checkBoxSaveTip(value);
    }, state.tipCheckBox);
  }

  Widget billingDetails(context, Cart cart, state) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
      margin: EdgeInsets.only(top: 10),
      color: Colors.white,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        titleTextDark17RegularBR(context, 'BILLING_DETAILS'.tr),
        SizedBox(height: 15),
        totalRow(context, 'ITEM_TOTAL'.tr,
            '${state.currencySymbol}${cart.subTotal.toStringAsFixed(2)}'),
        cart.tax > 0 ? SizedBox(height: 10) : Container(),
        cart.tax > 0
            ? totalRow(context, 'TAXES'.tr,
                '${state.currencySymbol}${cart.tax.toStringAsFixed(2)}')
            : Container(),
        cart.tipAmount > 0 ? SizedBox(height: 10) : Container(),
        cart.tipAmount > 0
            ? totalRow(context, 'TIP'.tr,
                '${state.currencySymbol}${cart.tipAmount.toStringAsFixed(2)}')
            : Container(),
        cart.deliveryCharges > 0 ? SizedBox(height: 10) : Container(),
        cart.deliveryCharges > 0
            ? totalRow(context, 'DELIVERY_CHARGE'.tr,
                '${state.currencySymbol}${cart.deliveryCharges.toStringAsFixed(2)}')
            : Container(),
        cart.couponAmount > 0 ? SizedBox(height: 10) : Container(),
        cart.couponAmount > 0
            ? totalRow(context, 'COUPON_AMOUNT'.tr,
                '-${state.currencySymbol}${cart.couponAmount.toStringAsFixed(2)}')
            : Container(),
        dottedLine(context, darkLight3.withOpacity(0.2), 12),
        totalRow(context, 'TO_PAY'.tr,
            '${state.currencySymbol}${cart.grandTotal.toStringAsFixed(2)}'),
      ]),
    );
  }

  Widget bottomNavigationBlock(
    BuildContext context,
    address,
    fulladdress,
    deliveryTime,
    changebutton,
    double grandTotal,
    Cart? cart,
    state,
  ) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10.0,
            spreadRadius: 5.0,
            offset: Offset(
              15.0,
              15.0,
            ),
          )
        ],
      ),
      child: Column(
        children: [
          if (fulladdress != null)
            GFListTile(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(0),
                avatar: Image.asset('lib/assets/icons/pin.png', scale: 3),
                title: titleTextDarkRegularBS(context, address),
                subTitle: Text(
                  fulladdress,
                  overflow: TextOverflow.ellipsis,
                  style: textDarkLightXSmallBR(context),
                ),
                description: titleTextDarkLightXSmallBR(context, deliveryTime),
                icon: InkWell(
                    onTap: () {
                      Get.to(() => ManageAddress(
                            fromCartScreen: true,
                          ));
                    },
                    child: titletextPrimarySmallUnderlineBM(
                        context, changebutton))),
          primaryBlockDoubleTextButton(
              context,
              '${state.currencySymbol}${grandTotal.toStringAsFixed(2)}',
              'PROCEED'.tr, () async {
            if (db.isLoggedIn()) {
              final res =
                  await context.read(cartScreenProvider.notifier).verifyCart();
              if (res != null) {
                await Get.to(() => PaymentScreen(cart!));
              }
            } else {
              await Get.to(() => AddNumber());
            }
          }),
        ],
      ),
    );
  }
}
