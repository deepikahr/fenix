import 'dart:io';

import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/cart/cart.dart';
import 'package:fenix_user/models/api_response_models/language_response/language_response.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/home/drawer/drawer.dart';
import 'package:fenix_user/screens/others/notify_waiter/notifyWaiter.dart';
import 'package:fenix_user/screens/others/order_in_progress/orderInProgress.dart';
import 'package:fenix_user/screens/others/thank_you/thankYou.dart';
import 'package:fenix_user/screens/tabs/cart/cart.dart';
import 'package:fenix_user/screens/product/product_details/productDetails.dart';
import 'package:fenix_user/screens/product/product_list/productList.dart';
import 'package:fenix_user/screens/tabs/category/category.dart';
import 'package:fenix_user/screens/tabs/order_details/orderDetails.dart';
import 'package:fenix_user/screens/tabs/payment/payment.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/appbar.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:fenix_user/widgets/fab_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../home/home.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

final db = DB();

class HomeTabs extends HookWidget {
  final int tabIndex;

  HomeTabs({this.tabIndex = 0});

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    final state = useProvider(homeTabsProvider);
    final notifier = useProvider(homeTabsProvider.notifier);
    final cart = useProvider(cartProvider);
    final isMounted = useIsMounted();

    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () async {
          // context.read(homeTabsProvider.notifier).onPageChanged(tabIndex);
          await notifier.fetchSettings();
          await notifier.fetchLanguage();
        });
      }
      return;
    }, const []);

    return Scaffold(
      key: _scaffoldKey,
        drawer: DrawerPage(),
        appBar: fenixAppbar(
          context,
          _scaffoldKey,
          (value) {
            context.read(homeTabsProvider.notifier).onSelectLanguage(value);
          },
          state.languages,
          state.isLoading,
          state.settingsIsLoading,
          state.settings?.tabSetting?.callToWaiter ?? false,
          () {
            context.read(homeTabsProvider.notifier).onPageChanged(0);
          },
          () {
            context.read(homeTabsProvider.notifier).onPageChanged(10);
          },
        ),
        backgroundColor: grey2,
        body:
        IndexedStack(
          index: state.currentIndex,
          children: <Widget>[
            // Container(),
            Home(),
            Category(),
            Category(),
            OrderDetails(),
            CartScreen(),
            ProductList(),
            ProductDetails(),
            OrdersInProcess(),
            Payment(),
            Thankyou(),
            NotifyWaiter()
          ],
        ),
        bottomNavigationBar: customBottomBar(
          (index) async {
            DB().saveTabIndex(state.currentIndex);
            context.read(homeTabsProvider.notifier).onPageChanged(index);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: buildCenterIcon(context, cart, () async {
          context.read(homeTabsProvider.notifier).onPageChanged(4);
          // Get.to(() => CartScreen());
        })
    );
  }
}
