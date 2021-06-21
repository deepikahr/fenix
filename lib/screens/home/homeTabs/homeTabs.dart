import 'package:flutter/material.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/database/db.dart';
import 'package:restaurant_saas/screens/checkout/cart_screen/cart_screen.dart';
import 'package:restaurant_saas/screens/others/profile/profile_screen.dart';
import 'package:restaurant_saas/screens/search/search/search.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/buttons.dart';
import '../home/home.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:restaurant_saas/providers/providers.dart';
import 'package:get/get.dart';

final db = DB();

class HomeTabs extends HookWidget {
  final int tabIndex;

  HomeTabs({this.tabIndex = 0});

  @override
  Widget build(BuildContext context) {
    final cartCount = useProvider(cartProvider)?.cartCount;
    final state = useProvider(homeTabsProvider);
    useEffect(() {
      Future.delayed(Duration.zero, () {
        context.read(homeTabsProvider.notifier).onPageChanged(tabIndex);
      });
      return;
    }, const []);

    var items = <BottomNavigationBarItem>[
      bottomBarTabItem(
          context,
          'HOME'.tr,
          const IconData(
            0xe903,
            fontFamily: 'icomoon',
          ),
          0),
      bottomBarTabItem(
          context,
          'SEARCH'.tr,
          const IconData(
            0xe902,
            fontFamily: 'icomoon',
          ),
          0),
      bottomBarTabItem(
          context,
          'CART'.tr,
          const IconData(
            0xe901,
            fontFamily: 'icomoon',
          ),
          cartCount),
      bottomBarTabItem(
          context,
          'PROFILE'.tr,
          const IconData(
            0xe900,
            fontFamily: 'icomoon',
          ),
          0),
    ];

    var _screens = <Widget>[
      Home(),
      Search(),
      CartScreen(backButton: false),
      ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: light,
      body: state.isLoading
          ? Center(child: GFLoader())
          : _screens[state.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: primary,
        elevation: 1,
        currentIndex: state.currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) async {
          context.read(homeTabsProvider.notifier).onPageChanged(index);
        },
        items: items,
        selectedLabelStyle: textWhiteXXSmallBM(context),
        unselectedLabelStyle: textWhiteXXSmallBM(context),
        selectedIconTheme: IconThemeData(color: light),
        unselectedIconTheme: IconThemeData(color: whiteLight),
        selectedItemColor: light,
        unselectedItemColor: whiteLight,
      ),
    );
  }
}
