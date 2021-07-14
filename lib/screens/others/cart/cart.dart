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
  final List<String> items = <String>[
    "red",
    "blue",
    "black",
    "Idiomos",
  ];
  String selectedItem = 'Idiomos';
  bool isChecked = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final cart = useProvider(cartProvider);
    final state = useProvider(cartScreenProvider);
    final cartNotifier = useProvider(cartScreenProvider.notifier);
    final isMounted = useIsMounted();

    useEffect(() {
      if (isMounted()) {
        context.read(cartScreenProvider.notifier);
      }
      return;
    }, const []);

    return Scaffold(
        backgroundColor: light,
        key: _scaffoldKey,
        drawer: DrawerPage(),
        appBar: fenixAppbar(context, _scaffoldKey, items, selectedItem,
            (String? string) => useState(() => selectedItem = string!)),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(left: 12, right: 8, top: 8, bottom: 8),
              child: Text('PRODUCTOS SELECCIONADOS',
                  style: textBlackLargeBM(context)),
            ),
            Container(
              color: white,
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  cart == null || !DB().isLoggedIn()
                      ? Center(
                          child: Text('CART_IS_EMPTY'),
                        )
                      : cartItemBlock(context, cart, state),
                  // totalRow(context, 'Sub Total', cart!.subTotal.toString()),
                  // totalRow(context, 'Grand Total', cart.grandTotal.toString()),
                  if (state.isLoading) GFLoader(),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Center(
                        child: custombuttonsm(context, 'OK, ENVIAR PEDIDO', () {
                      context.read(cartScreenProvider.notifier).createOrder();
                       if(state.orderResponse != null){
                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                             content: Text('Order created successfully')));
                         Timer(Duration(seconds: 2), () async {
                           await Get.offAll(() => OrdersInProcess());
                         });
                       }

                    })),
                  ),
                ],
              ),
            )
          ],
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
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('${cartProduct.totalProductPrice}€',
                          style: textBlackLargeBM(context)),
                      SizedBox(width: 4),
                      cartProduct.allergens!.isNotEmpty
                          ? Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                'Alérgenos',
                                style: textWhiteRegularBM(),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: white,
                              // border: Border.all(
                              //     color: grey.shade300, width: 1),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
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
                                          border:
                                              Border.all(color: dark, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(50)),
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
                                        border:
                                            Border.all(color: dark, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Icon(
                                      Icons.add,
                                      color: dark,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(width: 10),
                      IconButton(
                        onPressed: () {
                          context
                              .read(cartScreenProvider.notifier)
                              .removeProduct(cartProduct);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: dark,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Divider(),
            ],
          );
        });
  }
}
