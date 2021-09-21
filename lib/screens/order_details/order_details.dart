import 'package:fenix_user/common/constant.dart';
import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/cart_product/cart_product.dart';
import 'package:fenix_user/models/api_response_models/order_details_response/order_details_response.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/cart_screen/cart_screen.dart';
import 'package:fenix_user/screens/order_in_processs/order_in_process.dart';
import 'package:fenix_user/screens/payment/payment_screen.dart';
import 'package:fenix_user/screens/payment_in_processs/payment_in_processs.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getwidget/getwidget.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderDetails extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final state = useProvider(orderDetailsProvider);
    final notifier = useProvider(orderDetailsProvider.notifier);
    final isMounted = useIsMounted();

    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () async {
          if (DB().getOrderId() != null) {
            final res = await notifier.fetchOrderDetails();
            if (res != null) {
              if (res.orderStatus == ORDER_STATUS.completed) {
                await notifier
                    .cleanCart(context.read(homeTabsProvider.notifier));
              } else if (res.orderStatus == ORDER_STATUS.pending) {
                context
                    .read(homeTabsProvider.notifier)
                    .showScreen(OrdersInProcess(
                      key: UniqueKey(),
                    ));
              } else if (res.orderStatus == ORDER_STATUS.cancelled) {
                Fluttertoast.showToast(msg: 'ORDER_IS_CANCELLED'.tr);
                await DB().removeOrderId();
                context
                    .read(homeTabsProvider.notifier)
                    .showScreen(CartScreen());
              } else if (res.paymentStatus == PAYMENT_STATUS.inProgress) {
                context
                    .read(homeTabsProvider.notifier)
                    .showScreen(PaymentInProcess(res));
              }
            }
          }
        });
      }
      return;
    }, const []);

    return Container(
      color: grey2,
      child: Stack(
        children: [
          if (!state.isLoading)
            ListView(
              children: [
                DB().getOrderId() == null
                    ? Center(child: Text('CART_IS_EMPTY'.tr))
                    : state.orderDetails == null || !DB().isLoggedIn()
                        ? Center(child: Text('CART_IS_EMPTY'.tr))
                        : Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              color: white,
                              margin: EdgeInsets.all(8),
                              padding: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          '${'ORDER_ID'.tr}: ${state.orderDetails!.orderID}',
                                          style:
                                              textDarkLight3SmallBR(context)),
                                      if (state.orderDetails?.orderStatus ==
                                          ORDER_STATUS.pending)
                                        Text('ORDER_PENDING'.tr,
                                            style:
                                                textDarkLight3SmallBR(context))
                                      else if (state
                                              .orderDetails?.orderStatus ==
                                          ORDER_STATUS.confirmed)
                                        Text('ORDER_CONFIRMED'.tr,
                                            style:
                                                textDarkLight3SmallBR(context))
                                      else if (state
                                              .orderDetails?.orderStatus ==
                                          ORDER_STATUS.completed)
                                        Text('ORDER_COMPLETED'.tr,
                                            style:
                                                textDarkLight3SmallBR(context))
                                      else if (state
                                              .orderDetails?.orderStatus ==
                                          ORDER_STATUS.cancelled)
                                        Text('ORDER_CANCELLED',
                                            style:
                                                textDarkLight3SmallBR(context)),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  cartItemBlock(
                                      context, state.orderDetails!.cart, state),
                                  if (state.isLoading)
                                    GFLoader(type: GFLoaderType.ios),
                                  Container(
                                    padding: EdgeInsets.all(12),
                                    color: light,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Text(
                                        //     '${'TOTAL'.tr}: ${cart.subTotal.toStringAsFixed(2)}${Constants.currency}',
                                        //     style: textPrimaryXXSmall(context)),
                                        Text('${'TOTAL_10%_VAT_INCLUDED'.tr} :',
                                            style: textPrimaryXXSmallDark(
                                                context)),
                                        Text(
                                            '${state.orderDetails!.grandTotal.toStringAsFixed(2)}${Constants.currency}',
                                            style: textPrimaryXXSmallDark(
                                                context)),
                                      ],
                                    ),
                                    //  Column(
                                    //   crossAxisAlignment:
                                    //       CrossAxisAlignment.start,
                                    //   children: [
                                    //     Padding(
                                    //       padding:
                                    //           const EdgeInsets.only(left: 0.0),
                                    //       child: Text(
                                    //           '${state.orderDetails!.subTotal.toStringAsFixed(2)}${Constants.currency} ${'VAT_INCLUDE_TOTAL'.tr}',
                                    //           style:
                                    //               textBlackLargeBM20G(context)),
                                    //     ),
                                    //     // SizedBox(height: 10),
                                    //     Row(
                                    //       mainAxisAlignment:
                                    //           MainAxisAlignment.spaceBetween,
                                    //       children: [
                                    //         Row(
                                    //           children: [
                                    // GFCheckbox(
                                    //   size: 20,
                                    //   activeBgColor: GFColors.DANGER,
                                    //   onChanged: (value) {
                                    //     context
                                    //         .read(orderDetailsProvider
                                    //             .notifier)
                                    //         .divideAccount(value);
                                    //   },
                                    //   value: state.divideAccount,
                                    // ),
                                    // SizedBox(width: 10),
                                    // Text('DIVIDE_THE_ACCOUNT'.tr,
                                    //     style: textBlackLargeBM20(
                                    //         context)),
                                    //           ],
                                    //         ),
                                    //       ],
                                    //     ),
                                    //     SizedBox(
                                    //       height: 10,
                                    //     ),
                                    //     Text(
                                    //         '${state.orderDetails!.grandTotal.toStringAsFixed(2)}${Constants.currency} ${'TOTAL_SELECTION'.tr}',
                                    //         style: textBlackLargeBM20G(context)),
                                    //   ],
                                    // ),
                                  ),
                                ],
                              ),
                            ),
                          ),
              ],
            ),
          if (state.orderDetails != ORDER_STATUS.cancelled ||
              state.orderDetails != ORDER_STATUS.completed ||
              state.orderDetails != ORDER_STATUS.pending)
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Center(
                    child:
                        custombuttonsm(context, 'OK,_PAYMENT_METHODS'.tr, () {
                  context
                      .read(homeTabsProvider.notifier)
                      .showScreen(Payment(state.orderDetails));
                }, false)),
              ),
            ),
          if (state.isLoading) GFLoader(type: GFLoaderType.ios)
        ],
      ),
    );
  }

  cartItemBlock(BuildContext context, List<CartProduct> cart, state) {
    return ListView.builder(
      physics: ScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: cart.length,
      itemBuilder: (BuildContext context, int i) {
        final cartProduct = cart.elementAt(i);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 26.0),
              child: Text(cartProduct.productName!,
                  style: textBlackLargeBM20(context)),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 26.0),
              child: Text(
                "${cartProduct.variant?.sizeName ?? ''} - ${cartProduct.variant?.price ?? ''}${Constants.currency}",
                style: textDarkLightSmallBR(context),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 26.0),
              child: ListView.builder(
                  padding: EdgeInsets.all(5.0),
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cartProduct.selectedAddOnItems.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                      child: Text(
                        "${cartProduct.selectedAddOnItems[i].addOnItemName ?? ''} x ${cartProduct.selectedAddOnItems[i].quantity} - ${(cartProduct.selectedAddOnItems[i].quantity) * (cartProduct.selectedAddOnItems[i].addOnItemPrice ?? 0)}${Constants.currency}",
                        style: textDarkLightSmallBR(context),
                      ),
                    );
                  }),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    state.divideAccount
                        ? GFCheckbox(
                            size: 20,
                            activeBgColor: GFColors.DANGER,
                            onChanged: (value) {},
                            value: false,
                          )
                        : Container(height: 20, width: 20),
                    SizedBox(width: 10),
                    Text(
                        '${cartProduct.totalProductPrice}${Constants.currency}',
                        style: textBlackLargeBM(context)),
                  ],
                ),
                Text('${cartProduct.variantQuantity}',
                    style: textBlackLargeBM(context)),
              ],
            ),
            Divider()
          ],
        );
      },
    );
  }
}
