import 'dart:async';

import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/cart/cart.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/home/home.dart';
import 'package:fenix_user/screens/order_in_processs/order_in_process.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:fenix_user/widgets/counterBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final cart = useProvider(cartProvider);
    final state = useProvider(cartScreenProvider);
    final isMounted = useIsMounted();

    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () async {
          await context.read(cartScreenProvider.notifier).updateGrandTotal();
        });
      }
      return;
    }, const []);

    return Container(
      color: grey2,
      child: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            children: [
              cart == null || !DB().isLoggedIn()
                  ? Center(
                      child: Text('CART_IS_EMPTY'.tr),
                    )
                  : SingleChildScrollView(
                      child: Container(
                        color: white,
                        margin: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              decoration: BoxDecoration(
                                color: grey2,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                              ),
                              padding: EdgeInsets.all(14),
                              margin: EdgeInsets.only(
                                top: 16,
                              ),
                              child: Text('SELECTED PRODUCTS'.tr,
                                  style: textBlackLargeBM(context)),
                            ),
                            Container(
                              color: grey2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  cartItemBlock(context, cart, state),
                                  Container(
                                    margin: EdgeInsets.only(top: 16),
                                    padding: EdgeInsets.all(14),
                                    color: white,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            'Total: ${cart.subTotal.toStringAsFixed(2)}',
                                            style: textPrimaryXXSmall(context)),
                                        Text(
                                            'Grand Total: ${cart.grandTotal.toStringAsFixed(2)}',
                                            style: textPrimaryXXSmallDark(
                                                context)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: grey2,
                                    padding: const EdgeInsets.only(
                                      top: 28.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        custombuttonsm(
                                            context, 'ADD_MORE_PRODUCTS'.tr,
                                            () async {
                                          // TODO(krishna):
                                          context
                                              .read(homeTabsProvider.notifier)
                                              .showScreen(Home());
                                        }, false),
                                        state.isLoading || state.isUpdateLoading
                                            ? GFLoader(type: GFLoaderType.ios)
                                            : DB().getOrderId() == null
                                                ? custombuttonsm(
                                                    context, 'PLACE_ORDER'.tr,
                                                    () async {
                                                    await context
                                                        .read(cartScreenProvider
                                                            .notifier)
                                                        .createOrder();
                                                    if (state.orderResponse !=
                                                        null) {
                                                      Fluttertoast.showToast(
                                                          msg:
                                                              '${state.orderResponse!.message}');
                                                    }
                                                    Timer(Duration(seconds: 2),
                                                        () async {
                                                      context
                                                          .read(homeTabsProvider
                                                              .notifier)
                                                          .showScreen(
                                                              OrdersInProcess());
                                                    });
                                                  }, state.isLoading)
                                                : (cart.products.any(
                                                            (element) => element
                                                                .modified) &&
                                                        DB().getOrderId() !=
                                                            null)
                                                    ? custombuttonsm(context,
                                                        'MODIFY_ORDER'.tr,
                                                        () async {
                                                        final updateResponse =
                                                            await context
                                                                .read(cartScreenProvider
                                                                    .notifier)
                                                                .updateOrder();
                                                        if (updateResponse !=
                                                            null) {
                                                          Fluttertoast.showToast(
                                                              msg:
                                                                  '${updateResponse}');
                                                          Timer(
                                                              Duration(
                                                                  seconds: 2),
                                                              () async {
                                                            context
                                                                .read(homeTabsProvider
                                                                    .notifier)
                                                                .showScreen(
                                                                    OrdersInProcess());
                                                          });
                                                        }
                                                      }, state.isUpdateLoading)
                                                    : Container()
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          ),
          if (state.isLoading) GFLoader(type: GFLoaderType.ios)
        ],
      ),
    );
  }

  cartItemBlock(BuildContext context, Cart cart, state) {
    // printWrapped('1111111111111111111111111111111 $cart');
    return Container(
      color: white,
      child: ListView.builder(
          padding: EdgeInsets.only(top: 12, bottom: 12, left: 12),
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: cart.products.length,
          itemBuilder: (BuildContext context, int i) {
            final cartProduct = cart.products.elementAt(i);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cart.products[i].productName ?? '',
                    style: textBlackLargeBM20(context)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 14,
                      child: HtmlWidget(
                        cart.products[i].productDescription ?? '',
                        textStyle: textDarkLightSmallBR(context),
                      ),
                    ),
                    Row(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            counterIcon(
                              'remove',
                              () {
                                context
                                    .read(cartScreenProvider.notifier)
                                    .updateQuantity(cartProduct, false);
                              },
                            ),
                            Text('${cartProduct.variantQuantity}',
                                style: textBlackLargeBM(context)),
                            counterIcon(
                              'add',
                              () {
                                context
                                    .read(cartScreenProvider.notifier)
                                    .updateQuantity(cartProduct, true);
                              },
                            ),
                          ],
                        ),
                        // SizedBox(width: 6),
                        IconButton(
                          onPressed: () {
                            context
                                .read(cartScreenProvider.notifier)
                                .removeProduct(cartProduct);
                          },
                          icon: Icon(
                            Icons.delete_outline_outlined,
                            color: dark,
                            size: 26,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('${cartProduct.totalProductPrice.toStringAsFixed(2)}€',
                        style: textBlackLargeBM(context)),
                    cartProduct.allergens!.isNotEmpty
                        ? Container(
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: primary(),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              'ALLERGENS'.tr,
                              style: textWhiteRegularBM(),
                            ),
                          )
                        : Container(),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Divider(
                  height: 12,
                ),
              ],
            );
          }),
    );
  }
}
