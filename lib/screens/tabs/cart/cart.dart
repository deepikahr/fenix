import 'dart:async';

import 'package:fenix_user/common/utils.dart';
import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/cart/cart.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/home/drawer/drawer.dart';
import 'package:fenix_user/screens/others/notify_waiter/notifyWaiter.dart';
import 'package:fenix_user/screens/others/order_in_progress/orderInProgress.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/appbar.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:fenix_user/widgets/normalText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:get/get.dart';

class CartScreen extends HookWidget {
  bool isChecked = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final cart = useProvider(cartProvider);
    final state = useProvider(cartScreenProvider);
    final homeState = useProvider(homeTabsProvider);
    final cartNotifier = useProvider(cartScreenProvider.notifier);
    final isMounted = useIsMounted();

    useEffect(() {
      if (isMounted()) {
        context.read(cartScreenProvider.notifier);
      }
      return;
    }, const []);

    return Scaffold(
        backgroundColor: grey2,
        key: _scaffoldKey,
        drawer: DrawerPage(),
        appBar: fenixAppbar(
            context,
            _scaffoldKey,
            items,
            homeState.selectedLanguage ?? items.first,
            (String? value) => context
                .read(homeTabsProvider.notifier)
                .onSelectLanguage(value!)),
        body:
        cart == null || !DB().isLoggedIn()
            ? Center(
                child: Text('CART_IS_EMPTY'.tr),
              )
            :
        SingleChildScrollView(
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
                        margin: EdgeInsets.only(top: 16,),
                        child: Text('SELECTED PRODUCTS'.tr,
                            style: textBlackLargeBM(context)),
                      ),
                      Container(
                        color: white,
                        // margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            cartItemBlock(context, cart, state),
                            // totalRow(context, 'Sub Total',
                            //     cart.subTotal.toStringAsFixed(2)),
                            // totalRow(context, 'Grand Total', cart.grandTotal.toStringAsFixed(2)),
                            Padding(
                              padding: const EdgeInsets.only(top: 28.0),
                              child: Center(
                                  child: state.isLoading
                                      ? GFLoader(type: GFLoaderType.ios)
                                      : custombuttonsm(
                                          context,
                                          DB().getOrderId() == null
                                              ? 'PLACE_ORDER'.tr
                                              : 'MODIFY_ORDER'.tr,
                                          DB().getOrderId() == null
                                              ? () async {
                                                  final response = await context
                                                      .read(cartScreenProvider
                                                          .notifier)
                                                      .createOrder();
                                                  if (response != null) {
                                                    ScaffoldMessenger.of(context)
                                                        .showSnackBar(SnackBar(
                                                            content: Text(
                                                                'order placed successfully')));
                                                    Timer(Duration(seconds: 2),
                                                        () async {
                                                      await Get.to(
                                                          () => OrdersInProcess());
                                                    });
                                                  }
                                                }
                                              : () async {
                                                  final updateResponse = await context
                                                      .read(cartScreenProvider
                                                          .notifier)
                                                      .updateOrder();
                                                  if (updateResponse != null) {
                                                    ScaffoldMessenger.of(context)
                                                        .showSnackBar(SnackBar(
                                                            content: Text(
                                                                '${updateResponse}')));
                                                    Timer(Duration(seconds: 2),
                                                        () async {
                                                      await Get.to(
                                                          () => OrdersInProcess());
                                                    });
                                                  }
                                                }, DB().getOrderId() == null
                                      ? state.isLoading : state.isUpdateLoading)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
          ),
        ));
  }

  cartItemBlock(BuildContext context, Cart cart, state) {
    // context.read(cartScreenProvider.notifier).updateGrandTotal();
    return ListView.builder(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: cart.products.length,
        itemBuilder: (BuildContext context, int i) {
          final cartProduct = cart.products.elementAt(i);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(cart.products[i].productName!,
                  style: textBlackLargeBM20(context)),
              // SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                          '${cartProduct.totalProductPrice.toStringAsFixed(2)}€',
                          style: textBlackLargeBM(context)),
                      SizedBox(width: 4),
                      cartProduct.allergens!.isNotEmpty
                          ? Container(
                              margin: EdgeInsets.only(left: 12),
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                'ALLERGENS'.tr,
                                style: textWhiteRegularBM(),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                context
                                    .read(cartScreenProvider.notifier)
                                    .updateQuantity(cartProduct, false);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      color: white,
                                      border: Border.all(color: dark, width: 1),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Icon(
                                    Icons.remove,
                                    color: dark,
                                  ),
                                ),
                              )),
                          Text('${cartProduct.totalQuantity}',
                              style: textBlackLargeBM(context)),
                          InkWell(
                            onTap: () {
                              context
                                  .read(cartScreenProvider.notifier)
                                  .updateQuantity(cartProduct, true);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                    color: white,
                                    border: Border.all(color: dark, width: 1),
                                    borderRadius: BorderRadius.circular(50)),
                                child: Icon(
                                  Icons.add,
                                  color: dark,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      IconButton(
                        onPressed: () {
                          context
                              .read(cartScreenProvider.notifier)
                              .removeProduct(cartProduct);
                        },
                        icon: Icon(
                          Icons.delete_outline_outlined,
                          color: dark,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Divider(height: 1,),
            ],
          );
        });
  }
}
