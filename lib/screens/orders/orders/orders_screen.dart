import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/common/utils.dart';
import 'package:restaurant_saas/database/db.dart';
import 'package:restaurant_saas/models/api_response_models/order/order.dart';
import 'package:restaurant_saas/providers/providers.dart';
import 'package:restaurant_saas/screens/orders/liveTracking/liveTracking.dart';
import 'package:restaurant_saas/screens/orders/orderDetails/orderDetails.dart';
import 'package:restaurant_saas/screens/orders/orders/orders_shimmer.dart';
import 'package:restaurant_saas/screens/orders/user_to_admin_chat/userToAdminChat.dart';
import 'package:restaurant_saas/screens/others/rating/rating_screen.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/appbar.dart';
import 'package:restaurant_saas/widgets/buttons.dart';
import 'package:restaurant_saas/widgets/card.dart';
import 'package:restaurant_saas/widgets/normalText.dart';

final db = DB();

class OrdersScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final state = useProvider(ordersProvider);
    final notifier = useProvider(ordersProvider.notifier);
    final isMounted = useIsMounted();

    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () {
          notifier.fetchUpComingOrders();
        });
      }
      return;
    }, const []);

    return Scaffold(
      backgroundColor: light,
      appBar: titleAppbar(context, 'ORDERS'.tr),
      body: GestureDetector(
        onHorizontalDragEnd: (d) {
          if (d.primaryVelocity! < 0 && !state.showDelivered) {
            notifier.onDeliveredSelect();
          } else if (d.primaryVelocity! > 0 && !state.showUpcoming) {
            notifier.onUpcomingSelect();
          }
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            ListView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.only(bottom: 8),
                  height: 65,
                  color: Colors.white,
                  child: Row(
                    children: [
                      categoryTabButton(context, 'UPCOMING'.tr, () {
                        context
                            .read(ordersProvider.notifier)
                            .onUpcomingSelect();
                      }, state.showUpcoming),
                      SizedBox(
                        width: 6,
                      ),
                      categoryTabButton(context, 'COMPLETED'.tr, () {
                        context
                            .read(ordersProvider.notifier)
                            .onDeliveredSelect();
                      }, state.showDelivered),
                    ],
                  ),
                ),
                ListView.builder(
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: state.orders.length,
                  itemBuilder: (BuildContext context, int i) {
                    final order = state.orders[i];
                    if (state.showDelivered) {
                      handleScrollWithIndex(
                          i,
                          state.pageNumber,
                          () => context
                              .read(ordersProvider.notifier)
                              .fetchCompletedOrders());
                    } else {
                      handleScrollWithIndex(
                          i,
                          state.pageNumber,
                          () => context
                              .read(ordersProvider.notifier)
                              .fetchUpComingOrders());
                    }
                    return InkWell(
                      onTap: () async {
                        await Get.to(() => OrderDetails(orderId: order.id));
                        await context
                            .read(ordersProvider.notifier)
                            .onUpcomingSelect();
                      },
                      child: Column(
                        children: [
                          orderCard(
                              context, order, false, state.currencySymbol),
                          Container(
                            color: Colors.white,
                            margin: EdgeInsets.only(bottom: 8),
                            padding: EdgeInsets.only(
                                bottom: 16, left: 16, right: 16),
                            child: Column(
                              children: [
                                dottedLine(
                                    context, darkLight3.withOpacity(0.2), 12),
                                GridView.count(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  mainAxisSpacing: 16,
                                  crossAxisSpacing: 16,
                                  childAspectRatio: 3,
                                  crossAxisCount: 3,
                                  children: [
                                    if (order.orderStatus !=
                                            ORDER_STATUS.delivered &&
                                        order.orderStatus !=
                                            ORDER_STATUS.cancelled)
                                      smallOutlineButton(
                                        context,
                                        'HELP'.tr,
                                        () async {
                                          await Get.to(
                                            () => UserToAdminChat(
                                              orderId: order.id,
                                              orderID: order.orderID,
                                            ),
                                          );
                                        },
                                      ),
                                    if (order.orderStatus !=
                                            ORDER_STATUS.delivered &&
                                        order.orderStatus !=
                                            ORDER_STATUS.cancelled)
                                      smallOutlineButton(
                                        context,
                                        'CANCEL'.tr,
                                        () {
                                          showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  showCancelPopUp(context,
                                                      () async {
                                                    Get.back();
                                                    await context
                                                        .read(ordersProvider
                                                            .notifier)
                                                        .cancelOrder(
                                                            order.id!, i);
                                                  }));
                                        },
                                      ),
                                    if (order.isAcceptedByDeliveryBoy! &&
                                        order.orderStatus !=
                                            ORDER_STATUS.delivered &&
                                        order.orderStatus !=
                                            ORDER_STATUS.cancelled)
                                      smallOutlineButton(
                                        context,
                                        'TRACK_ORDER'.tr,
                                        () {
                                          Get.to(() => LiveTracking(
                                                orderId: order.id,
                                                orderID: order.orderID,
                                              ));
                                        },
                                      ),
                                    if (order.orderStatus ==
                                            ORDER_STATUS.delivered ||
                                        order.orderStatus ==
                                            ORDER_STATUS.cancelled)
                                      smallOutlineButton(
                                        context,
                                        'RE_ORDER'.tr,
                                        () async {
                                          final res = await context
                                              .read(ordersProvider.notifier)
                                              .reOrder(order.id!);

                                          if (res != null) {
                                            await notifier.saveCart(res);
                                          }
                                        },
                                      ),
                                    if (order.orderStatus ==
                                        ORDER_STATUS.delivered)
                                      smallOutlineButton(context, 'RATE'.tr,
                                          () {
                                        Get.to(() => RatingScreen(
                                              orderId: order.id,
                                              franchiseId: order.franchiseId,
                                              deliveryBoyId: order.assignedToId,
                                            ));
                                      }),
                                    if (order.orderStatus ==
                                        ORDER_STATUS.delivered)
                                      smallOutlineButton(
                                          context, 'VIEW_DETAILS'.tr, () async {
                                        await Get.to(() => OrderDetails(
                                              orderId: order.id,
                                            ));
                                        await context
                                            .read(ordersProvider.notifier)
                                            .onUpcomingSelect();
                                      }),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            if (state.isLoading)
              Container(color: Colors.white, child: shimmerOrder())
          ],
        ),
      ),
    );
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
}
