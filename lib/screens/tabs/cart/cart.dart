import 'dart:async';

import 'package:fenix_user/common/utils.dart';
import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/cart/cart.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/home/drawer/drawer.dart';
import 'package:fenix_user/screens/home/home/home.dart';
import 'package:fenix_user/screens/home/home_tabs/homeTabs.dart';
import 'package:fenix_user/screens/others/notify_waiter/notifyWaiter.dart';
import 'package:fenix_user/screens/others/order_in_progress/orderInProgress.dart';
import 'package:fenix_user/screens/product/product_list/productList.dart';
import 'package:fenix_user/screens/tabs/category/category.dart';
import 'package:fenix_user/screens/tabs/order_details/orderDetails.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/appbar.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:fenix_user/widgets/normalText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
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
    final settingsState = useProvider(settingsProvider);

    useEffect(() {
      if (isMounted()) {
        context.read(cartScreenProvider.notifier);
        // context.read(settingsProvider.notifier).fetchSettings();
      }
      return;
    }, const []);

    var _screens = <Widget>[
      Home(),
      Category(),
      Category(),
      OrderDetails(),
    ];

    return Scaffold(
        backgroundColor: grey2,
        key: _scaffoldKey,
        drawer: DrawerPage(),
        appBar: fenixAppbar(context, _scaffoldKey,
                (value) => context.read(homeTabsProvider.notifier).onSelectLanguage(value!),
            homeState.languages, homeState.isLoading, settingsState.isLoading, settingsState,
                () {
              context.read(homeTabsProvider.notifier).onPageChanged(0);
              Get.to(() => HomeTabs(tabIndex: 0));
            }
        ),
        body: homeState.isLoading
            ? Center(child: GFLoader(type: GFLoaderType.ios))
            :
        // homeState.currentIndex == 0 ? Home() : homeState.currentIndex == 1 ? Category() : homeState.currentIndex == 2 ? Category() :
        // homeState.currentIndex == 3 ? OrderDetails() :
        homeState.currentIndex == 4 ?
        cart == null || !DB().isLoggedIn() || cart.products.length == 0
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      'Total: ${cart.subTotal.toStringAsFixed(2)}',
                                      style: textPrimaryXXSmall(context)
                                  ),
                                  Text(
                                      'Tax: ${cart.taxTotal.toStringAsFixed(2)}',
                                      style: textPrimaryXXSmall(context)
                                  ),
                                  Text(
                                      'Grand Total: ${cart.grandTotal.toStringAsFixed(2)}',
                                      style: textPrimaryXXSmallDark(context)
                                  ),
                                ],
                              ),
                            ),
                            // totalRow(context, 'Sub Total',
                            //     cart.subTotal.toStringAsFixed(2)),
                            // totalRow(context, 'Grand Total', cart.grandTotal.toStringAsFixed(2)),
                            Container(
                              color: grey2,
                              padding: const EdgeInsets.only(top: 28.0, left: 24, right: 24),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  custombuttonsm(
                                      context,
                                      'ADD_MORE_PRODUCTS'.tr,
                                          () async {
                                            context.read(homeTabsProvider.notifier).onPageChanged(5);
                                            Get.to(() => ProductList(categoryId: DB().getCategoryId(), categoryImage: DB().getCategoryImage()));
                                      },
                                      false
                                  ),
                                  state.isLoading || state.isUpdateLoading
                                          ? GFLoader(type: GFLoaderType.ios)
                                          :
                                      DB().getOrderId()  == null ?
                                      custombuttonsm(
                                          context,
                                          'PLACE_ORDER'.tr,
                                              () async {
                                            await context
                                                .read(cartScreenProvider
                                                .notifier)
                                                .createOrder();
                                            if (state.orderResponse != null) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                  content: Text('${state.orderResponse!.message}')));
                                            }
                                            Timer(Duration(seconds: 2),
                                                    () async {
                                                  await Get.to(
                                                          () => OrdersInProcess());
                                                });
                                          },
                                          state.isLoading)
                                          :
                                      cart.products.where((element) =>
                                      element.modified).isNotEmpty && DB().getOrderId() != null  ? custombuttonsm(
                                              context,
                                              'MODIFY_ORDER'.tr,
                                              () async {
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
                                                    },
                                           state.isUpdateLoading)
                                          // : DB().getOrderId()!= null ? custombuttonsm(
                                          // context,
                                          // 'ADD_MORE_PRODUCTS'.tr,
                                          //     () async {
                                          //       await Get.to(
                                          //               () => HomeTabs(tabIndex: 0,));
                                          // },
                                          // false)
                                          : Container()

                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
          ),
        ) : Container(),
      bottomNavigationBar: customBottomBar((index) async {
        context.read(homeTabsProvider.notifier).onPageChanged(index);
        context.read(homeTabsProvider.notifier).nonTab(true);
      },),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: cart == null || !DB().isLoggedIn()
          ? buildCenterIcon(context, cart, () {
        context.read(homeTabsProvider.notifier).onPageChanged(4);
        Get.to(() => CartScreen());
      }) : buildCenterIcon(context, cart, () {
        context.read(homeTabsProvider.notifier).onPageChanged(4);
        Get.to(() => CartScreen());
      }),
    );
  }

  cartItemBlock(BuildContext context, Cart cart, state) {
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
                Text(cart.products[i].productName!,
                    style: textBlackLargeBM20(context)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 14,
                      child: HtmlWidget(
                        cart.products[i].description!,
                        textStyle: textDarkLightSmallBR(context),
                      ),
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
                        Text(
                            '${cartProduct.totalProductPrice.toStringAsFixed(2)}€',
                            style: textBlackLargeBM(context)),
                        cartProduct.allergens!.isNotEmpty
                            ? Container(
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    color: primary(),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  'ALLERGENS'.tr,
                                  style: textWhiteRegularBM(),
                                ),
                              )
                            : Container(),
                        Text(
                            'Tax: ${cartProduct.taxInfo!.taxPercentage} %',
                            style: textPrimaryXXSmall(context)
                        ),
                  ],
                ),
                SizedBox(height: 12,),
                Divider(height: 12,),
              ],
            );
          }),
    );
  }
}
