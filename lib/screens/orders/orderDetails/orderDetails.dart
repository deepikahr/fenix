import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_saas/database/db.dart';
import 'package:restaurant_saas/models/api_response_models/order/order.dart';
import 'package:restaurant_saas/models/api_response_models/order_details_resposne/order_details_reposne.dart';
import 'package:restaurant_saas/providers/providers.dart';
import 'package:restaurant_saas/screens/orders/liveTracking/liveTracking.dart';
import 'package:restaurant_saas/screens/orders/orderDetails/order_detail_shimmer.dart';
import 'package:restaurant_saas/screens/orders/user_to_admin_chat/userToAdminChat.dart';
import 'package:restaurant_saas/screens/orders/user_to_delivery_boy_chat/userToDeliveryBoyChat.dart';
import 'package:restaurant_saas/screens/others/product_rating/product_rating.dart';
import 'package:restaurant_saas/screens/others/rating/rating_screen.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/appbar.dart';
import 'package:restaurant_saas/widgets/buttons.dart';
import 'package:restaurant_saas/widgets/network_image.dart';
import 'package:restaurant_saas/widgets/normalText.dart';

final db = DB();

class OrderDetails extends HookWidget {
  final String? orderId;

  OrderDetails({this.orderId});

  @override
  Widget build(BuildContext context) {
    final state = useProvider(orderDetailsProvider);
    final notifier = useProvider(orderDetailsProvider.notifier);
    final isMounted = useIsMounted();
    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () {
          context.read(orderDetailsProvider.notifier).fetchOrderDetail(orderId);
        });
      }
      return;
    }, const []);

    return Scaffold(
        backgroundColor: light,
        appBar: titleAppbar(context, 'ORDER_DETAILS'.tr),
        body: Stack(
          fit: StackFit.expand,
          children: [
            if (!state.isLoading)
              ListView(
                children: [
                  orderCardWithOutGrandTotal(context, state.orderDetailsData),
                  SizedBox(height: 10),
                  cartDataBuild(context, state.orderDetailsData, state),
                  Container(
                    height: 16,
                    color: Colors.white,
                    margin: EdgeInsets.only(bottom: 8),
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        titleTextDark17RegularBR(context, 'BILLING_DETAILS'.tr),
                        SizedBox(height: 15),
                        totalRow(
                            context,
                            '${'PAYMENT_TYPE'.tr} :',
                            '${(state.orderDetailsData?.paymentType == PAYMENT_TYPES.stripe ? 'STRIPE' : state.orderDetailsData?.paymentType == PAYMENT_TYPES.cod ? 'COD' : '').tr}'),
                        SizedBox(height: 10),
                        totalRow(context, '${'ITEM_TOTAL'.tr} :',
                            '${state.currencySymbol}${state.orderDetailsData?.subTotal?.toStringAsFixed(2)}'),
                        SizedBox(height: 10),
                        state.orderDetailsData!.tax! > 0
                            ? totalRow(context, '${'TAXES'.tr} :',
                                '${state.currencySymbol}${state.orderDetailsData?.tax?.toStringAsFixed(2)}')
                            : Container(),
                        state.orderDetailsData!.tax! > 0
                            ? SizedBox(height: 10)
                            : Container(),
                        state.orderDetailsData!.deliveryCharges! > 0
                            ? totalRow(context, '${'DELIVERY_CHARGE'.tr} :',
                                '${state.currencySymbol}${state.orderDetailsData?.deliveryCharges?.toStringAsFixed(2)}')
                            : Container(),
                        state.orderDetailsData!.deliveryCharges! > 0
                            ? SizedBox(height: 10)
                            : Container(),
                        state.orderDetailsData!.tipAmount! > 0
                            ? totalRow(context, '${'TIP_AMOUNT'.tr} :',
                                '${state.currencySymbol}${state.orderDetailsData?.tipAmount?.toStringAsFixed(2)}')
                            : Container(),
                        state.orderDetailsData!.tipAmount! > 0
                            ? SizedBox(height: 10)
                            : Container(),
                        state.orderDetailsData?.couponCode == null ||
                                state.orderDetailsData?.couponCode == ''
                            ? Container()
                            : totalRow(context, '${'COUPON_CODE'.tr} :',
                                '${state.orderDetailsData?.couponCode}'),
                        state.orderDetailsData?.couponCode == null ||
                                state.orderDetailsData?.couponCode == ''
                            ? Container()
                            : SizedBox(height: 10),
                        state.orderDetailsData!.couponAmount! > 0
                            ? totalRow(context, '${'DISCOUNT'.tr} :',
                                '${state.currencySymbol}${state.orderDetailsData?.couponAmount?.toStringAsFixed(2)}')
                            : Container(),
                        dottedLine(context, darkLight3.withOpacity(0.2), 12),
                        totalRow(context, '${'TOTAL'.tr} :',
                            '${state.currencySymbol}${state.orderDetailsData?.grandTotal?.toStringAsFixed(2)}'),
                        Divider(
                          height: 45,
                          thickness: 2,
                          color: darkLight3,
                        ),
                        GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: 3,
                          shrinkWrap: true,
                          crossAxisCount: 3,
                          children: [
                            if (state.orderDetailsData!.orderStatus !=
                                    ORDER_STATUS.delivered &&
                                state.orderDetailsData!.orderStatus !=
                                    ORDER_STATUS.cancelled)
                              smallOutlineButton(
                                context,
                                'CANCEL'.tr,
                                () {
                                  showDialog(
                                      context: context,
                                      builder: (context) =>
                                          showCancelPopUp(context, () async {
                                            Get.back();
                                            await context
                                                .read(orderDetailsProvider
                                                    .notifier)
                                                .cancelOrder(orderId!);
                                          }));
                                },
                              ),
                            if (state.orderDetailsData!
                                    .isAcceptedByDeliveryBoy! &&
                                state.orderDetailsData!.orderStatus !=
                                    ORDER_STATUS.delivered &&
                                state.orderDetailsData!.orderStatus !=
                                    ORDER_STATUS.cancelled)
                              smallOutlineButton(
                                context,
                                'TRACK_ORDER'.tr,
                                () {
                                  Get.to(() => LiveTracking(
                                        orderId: state.orderDetailsData!.id,
                                        orderID:
                                            state.orderDetailsData!.orderID,
                                      ));
                                },
                              ),
                            if (state.orderDetailsData!.orderStatus ==
                                    ORDER_STATUS.delivered ||
                                state.orderDetailsData!.orderStatus ==
                                    ORDER_STATUS.cancelled)
                              smallOutlineButton(context, 'RE_ORDER'.tr,
                                  () async {
                                final res = await context
                                    .read(orderDetailsProvider.notifier)
                                    .reOrder(state.orderDetailsData!.id!);
                                if (res != null) {
                                  await notifier.saveCart(res);
                                }
                              }),
                            if (state.orderDetailsData!.orderStatus ==
                                ORDER_STATUS.delivered)
                              smallOutlineButton(context, 'RATE'.tr, () {
                                Get.to(() => RatingScreen(
                                      orderId: state.orderDetailsData?.id,
                                      franchiseId:
                                          state.orderDetailsData?.franchiseId,
                                      deliveryBoyId:
                                          state.orderDetailsData?.assignedToId,
                                    ));
                              }),
                            if (state.orderDetailsData!.orderStatus ==
                                ORDER_STATUS.delivered)
                              smallOutlineButton(
                                context,
                                'HELP'.tr,
                                () async {
                                  await Get.to(() => UserToAdminChat(
                                        orderId: state.orderDetailsData?.id,
                                        orderID:
                                            state.orderDetailsData?.orderID,
                                      ));
                                },
                              ),
                            if (state.orderDetailsData!
                                        .isAcceptedByDeliveryBoy ==
                                    true &&
                                state.orderDetailsData!.assignedToId != null)
                              smallOutlineButton(
                                context,
                                'DELIVERY_BOY'.tr,
                                () async {
                                  await Get.to(
                                      () => UserToDeliveryBoyChatScreen(
                                            orderId: state.orderDetailsData?.id,
                                            orderID:
                                                state.orderDetailsData?.orderID,
                                          ));
                                },
                              ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            if (state.isLoading)
              Container(color: Colors.white, child: shimmerOrderDetails())
          ],
        ));
  }

  Widget showCancelPopUp(context, Function() onCancel) {
    return Dialog(
      child: Container(
        height: 165,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${'ARE_YOU_SURE_CANCEL_ORDER'.tr}',
              style: textBlackLargeBM(context),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                    child: GFButton(
                  blockButton: true,
                  size: GFSize.LARGE,
                  color: primary,
                  type: GFButtonType.outline,
                  onPressed: onCancel,
                  child: Text(
                    'YES'.tr.toUpperCase(),
                    style: textPrimarySmallBM(context),
                    textAlign: TextAlign.center,
                  ),
                )),
                SizedBox(width: 10),
                Expanded(
                    child: GFButton(
                  blockButton: true,
                  size: GFSize.LARGE,
                  color: GFColors.DARK,
                  type: GFButtonType.outline,
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'NO'.tr.toUpperCase(),
                    style: textBlackSmallBM(context),
                    textAlign: TextAlign.center,
                  ),
                )),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget orderCardWithOutGrandTotal(
      BuildContext context, OrderDetailsDataResponse? order) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleTextDarkSmallBM(context, order!.restaurantName ?? ''),
                  SizedBox(
                    height: 5,
                  ),
                  titleTextDarkLightXSmallBR(context, '${order.franchiseName}')
                ],
              ),
              titleTextDarkLightXSmallBR(
                context,
                DateFormat('dd MMM').format(
                    DateTime.parse(order.createdAt.toString()).toLocal()),
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'lib/assets/icons/accepted.png',
                scale: 3,
              ),
              SizedBox(
                width: 5,
              ),
              if (order.orderStatus == ORDER_STATUS.pending)
                titleTextDarkLightXSmallBR(context, 'ORDER_PENDING'.tr)
              else if (order.orderStatus == ORDER_STATUS.cancelled)
                titleTextDarkLightXSmallBR(context, 'ORDER_CANCELED'.tr)
              else if (order.orderStatus == ORDER_STATUS.confirmed)
                titleTextDarkLightXSmallBR(context, 'ORDER_CONFIRMED'.tr)
              else if (order.orderStatus == ORDER_STATUS.outForDelivery)
                titleTextDarkLightXSmallBR(context, 'ORDER_IS_ON_THE_WAY'.tr)
              else if (order.orderStatus == ORDER_STATUS.delivered)
                titleTextDarkLightXSmallBR(context, 'ORDER_DELIVERED'.tr)
            ],
          ),
          SizedBox(height: 10)
        ],
      ),
    );
  }

  Widget cartDataBuild(
      BuildContext context, OrderDetailsDataResponse? order, state) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
      color: Colors.white,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: order?.cart.length ?? 0,
        itemBuilder: (context, i) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            (order!.cart[i].isVeg == null
                                ? Container(
                                    height: 14,
                                    width: 14,
                                  )
                                : order.cart[i].isVeg == true
                                    ? Container(
                                        height: 14,
                                        width: 14,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: green)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: GFAvatar(
                                              backgroundColor: green,
                                              shape: GFAvatarShape.circle),
                                        ),
                                      )
                                    : Container(
                                        height: 14,
                                        width: 14,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: red)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: GFAvatar(
                                              backgroundColor: red,
                                              shape: GFAvatarShape.circle),
                                        ),
                                      )),
                            SizedBox(width: 3),
                            titleTextDarkSmallBM(
                                context, '${order.cart[i].productName}'),
                          ],
                        ),
                        titleTextDarkLightXSmallBR(context,
                            "${order.cart[i].addOnItems.map((e) => e.addOnItemName).join(' ,')}"),
                        if (order.orderStatus == ORDER_STATUS.delivered)
                          smallOutlineButton(
                              context,
                              (order.cart[i].rate != 0
                                  ? '${order.cart[i].rate.toStringAsFixed(1)} ${'STAR'.tr}'
                                  : 'RATE'.tr), () {
                            var result = Get.to(() => ProductRating(
                                productData: order.cart[i],
                                orderId: order.id))!;
                            result.then((value) {
                              Future.delayed(Duration.zero, () {
                                context
                                    .read(orderDetailsProvider.notifier)
                                    .fetchOrderDetail(orderId);
                              });
                              return;
                            });
                          })
                      ],
                    ),
                  ),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: order.cart[i].sellingPrice ==
                                          order.cart[i].originalPrice
                                      ? ''
                                      : '${state.currencySymbol}${order.cart[i].sellingPrice} ',
                                  style: textDarkLight2XSmallLineThroughBR(
                                      context)),
                            ],
                            text:
                                '${state.currencySymbol}${order.cart[i].originalPrice} ',
                            style: textDarkSmallBM(context),
                          ),
                        ),
                        networkImage(
                            order.cart[i].productImage?.imageUrl, 64, 47, 6)
                      ],
                    ),
                  )
                ],
              ),
              Divider()
            ],
          );
        },
      ),
    );
  }
}
