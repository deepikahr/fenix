import 'dart:async';
import 'package:fenix_user/common/constant.dart';
import 'package:fenix_user/common/kios_mode_utils.dart';
import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/cart/cart.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/cart_screen/cart_screen_state.dart';
import 'package:fenix_user/screens/home/home.dart';
import 'package:fenix_user/screens/order_in_processs/order_in_process.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:fenix_user/widgets/counterBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'cart_screen_notifier.dart';

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
      for (var i = 0; i < (cart?.products.length ?? 0); i++) {
        print(cart?.products[i].productInstructions);
      }
      return;
    }, const []);

    return Container(
      height: MediaQuery.of(context).size.height,
      color: grey2,
      child: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            children: [
              cart == null || !DB().isLoggedIn()
                  ? Container(
                      alignment: AlignmentDirectional.topCenter,
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
                                    height: 65,
                                    color: white,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Text(
                                        //     '${'TOTAL'.tr}: ${cart.subTotal.toStringAsFixed(2)}${Constants.currency}',
                                        //     style: textPrimaryXXSmall(context)),
                                        Text('${'TOTAL_VAT_INCLUDED'.tr} :',
                                            style: textPrimaryXXSmallDark(
                                                context)),
                                        Text(
                                            '${cart.grandTotal.toStringAsFixed(2)}${Constants.currency}',
                                            style: textPrimaryXXSmallDark(
                                                context)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 120,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          ),
          if (state.isLoading) GFLoader(type: GFLoaderType.ios),
          cart == null || !DB().isLoggedIn()
              ? Container()
              : Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: grey2,
                    height: 100,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        custombuttonsmh50(context, 'ADD_MORE_PRODUCTS'.tr,
                            () async {
                          context
                              .read(homeTabsProvider.notifier)
                              .showScreen(Home());
                        }, false),
                        const SizedBox(
                          width: 10,
                        ),
                        state.isLoading || state.isUpdateLoading
                            ? GFLoader(type: GFLoaderType.ios)
                            : DB().getOrderId() == null
                                ? custombuttonsmh50(context, 'PLACE_ORDER'.tr,
                                    () async {
                                    final res = await context
                                        .read(cartScreenProvider.notifier)
                                        .createOrder();
                                    if (res != null) {
                                      //   Fluttertoast.showToast(
                                      //       msg:
                                      //           '${state.orderResponse!.message}');

                                      context
                                          .read(homeTabsProvider.notifier)
                                          .showScreen(OrdersInProcess(
                                            key: UniqueKey(),
                                            title:
                                                getOrderInProcessTitleInKioskMode,
                                            image:
                                                getOrderInProcessImageUrlInKioskMode,
                                          ));
                                    }
                                  }, state.isLoading)
                                : (cart.products.any(
                                            (element) => element.modified) &&
                                        DB().getOrderId() != null)
                                    ? custombuttonsmh50(
                                        context, 'MODIFY_ORDER'.tr, () async {
                                        final updateResponse = await context
                                            .read(cartScreenProvider.notifier)
                                            .updateOrder();
                                        if (updateResponse != null) {
                                          // Fluttertoast.showToast(
                                          //     msg: '${updateResponse}');

                                          context
                                              .read(homeTabsProvider.notifier)
                                              .showScreen(OrdersInProcess(
                                                key: UniqueKey(),
                                                title:
                                                    '${'YOUR_ORDER_IS'.tr} \n ${'IN_PROCESS'.tr}\n\n',
                                                image:
                                                    'lib/assets/images/timer.png',
                                              ));
                                        }
                                      }, state.isUpdateLoading)
                                    : Container()
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  cartItemBlock(BuildContext context, Cart cart, CartScreenState state) {
    final notifier = context.read(cartScreenProvider.notifier);
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
                      child: Text(
                        "${cart.products[i].variant?.sizeName ?? ''} - ${cart.products[i].variant?.price ?? ''}${Constants.currency}",
                        style: textDarkLightSmallBR(context),
                      ),
                    ),
                    Row(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (notifier
                                    .getCurrentQuanityOfProduct(cartProduct) >
                                notifier.getLastOrderedQuantityOfProduct(
                                    cartProduct))
                              counterIcon(
                                'remove',
                                () {
                                  context
                                      .read(cartScreenProvider.notifier)
                                      .updateQuantity(cartProduct, false);
                                },
                              ),
                            Text(
                                '${notifier.getCurrentQuanityOfProduct(cartProduct)}',
                                style: textBlackLargeBM(context).copyWith(
                                    color: cartProduct.modified
                                        ? Colors.amber
                                        : Colors.black)),
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
                        Visibility(
                          visible: notifier
                                  .getCurrentQuanityOfProduct(cartProduct) >
                              notifier
                                  .getLastOrderedQuantityOfProduct(cartProduct),
                          maintainSize: true,
                          maintainState: true,
                          maintainAnimation: true,
                          maintainInteractivity: false,
                          child: IconButton(
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
                        )
                      ],
                    ),
                  ],
                ),
                ListView.builder(
                    padding: EdgeInsets.all(5.0),
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: cartProduct.selectedAddOnItems.length,
                    itemBuilder: (BuildContext context, int i) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Text(
                          "${cartProduct.selectedAddOnItems[i].addOnItemName ?? ''} x ${cartProduct.selectedAddOnItems[i].quantity} - ${(cartProduct.selectedAddOnItems[i].quantity) * (cartProduct.selectedAddOnItems[i].addOnItemPrice ?? 0)}${Constants.currency}",
                          style: textDarkLightSmallBR(context),
                        ),
                      );
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        '${cartProduct.totalProductPrice.toStringAsFixed(2)}${Constants.currency}',
                        style: textBlackLargeBM(context)),
                    cartProduct.allergens.isNotEmpty
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
