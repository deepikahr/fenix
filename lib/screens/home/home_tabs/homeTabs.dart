import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/cart/cart.dart';
import 'package:fenix_user/models/api_response_models/language_response/language_response.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/home/drawer/drawer.dart';
import 'package:fenix_user/screens/tabs/cart/cart.dart';
import 'package:fenix_user/screens/product/product_details/productDetails.dart';
import 'package:fenix_user/screens/product/product_list/productList.dart';
import 'package:fenix_user/screens/tabs/category/category.dart';
import 'package:fenix_user/screens/tabs/order_details/orderDetails.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/appbar.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:fenix_user/widgets/fab_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../home/home.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

final db = DB();

class HomeTabs extends HookWidget {
  final int tabIndex;

  HomeTabs({this.tabIndex = 0});

  @override
  Widget build(BuildContext context) {

    final state = useProvider(homeTabsProvider);
    final settingsState = useProvider(settingsProvider);
    final cart = useProvider(cartProvider);
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    final isMounted = useIsMounted();

    useEffect(() {
      Future.delayed(Duration.zero, () async {
        context.read(homeTabsProvider.notifier).onPageChanged(tabIndex);
        if (isMounted()) {
          await context.read(settingsProvider.notifier).fetchSettings();
          await context.read(homeTabsProvider.notifier).fetchLanguage();
        }
      });
      return;
    }, const []);

    var _screens = <Widget>[
      Home(),
      Category(),
      Category(),
      OrderDetails(),
    ];

    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerPage(),
      appBar: fenixAppbar(context, _scaffoldKey,
              (value) => context.read(homeTabsProvider.notifier).onSelectLanguage(value!),
            state.languages, state.isLoading, settingsState.settings!.tabSetting!.callToWaiter
        ),
      backgroundColor: grey2,
      body: state.isLoading
          ? Center(child: GFLoader(type: GFLoaderType.ios))
          : _screens[state.currentIndex],
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: 'ASK_FOR'.tr,
        color: Colors.grey,
        selectedColor: primary(),
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: (index) async {
          context.read(homeTabsProvider.notifier).onPageChanged(index);
        },
        items: [
          FABBottomAppBarItem(iconData: "lib/assets/icons/return.svg", text: 'RETURN'.tr),
          FABBottomAppBarItem(iconData: "lib/assets/icons/drinks.svg", text: 'DRINKS'.tr),
          FABBottomAppBarItem(iconData: "lib/assets/icons/foods.svg", text: 'FOOD'.tr),
          FABBottomAppBarItem(iconData: "lib/assets/icons/pay.svg", text: 'TO_PAY'.tr),
        ],
        backgroundColor: grey2,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: cart == null || !DB().isLoggedIn()
          ? _buildFab(context, cart)
          : _buildFab(context, cart),
    );
  }

  Widget _buildFab(BuildContext context, Cart? cart) {
    return SizedBox(
      width: 54,
      height: 54,
      child: Stack(
        children: [
          FloatingActionButton(
            onPressed: () {
              Get.to(() => CartScreen());
            },
            backgroundColor: primary(),
            elevation: 2.0,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Image.asset(
                'lib/assets/images/pedir.png',
                width: 60,
                height: 60,
                alignment: Alignment.center,
              ),
            ),
          ),
          cart == null || !DB().isLoggedIn() || cart.products.length == 0 ? Container() : PositionedDirectional(
            end: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.white, width: 1)
              ),
              child: GFBadge(
                shape: GFBadgeShape.circle,
                color: Colors.black,
                textColor: GFColors.WHITE,
                size: GFSize.SMALL,
                text: '${cart.products.length}',
              ),
            ),
          )
        ],
      ),
    );
  }

}
