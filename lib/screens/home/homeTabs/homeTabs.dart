import 'package:flutter/material.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/database/db.dart';
import 'package:restaurant_saas/screens/fenix_orders/orders.dart';
import 'package:restaurant_saas/screens/fenix_orders/total_amount.dart';
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
      bottomBarTabItem(context, 'Volver'.tr, "lib/assets/images/1.png", 0),
      bottomBarTabItem(context, 'Beida'.tr, "lib/assets/images/2.png", 0),
      bottomBarTabItem(
          context, 'Comida'.tr, "lib/assets/images/3.png", cartCount),
      bottomBarTabItem(context, 'Pagar'.tr, "lib/assets/images/4.png", 0),
    ];

    var _screens = <Widget>[
      Home(),
      Home(),
      Home(),
      TotalAmount(),
    ];

    return Scaffold(
      backgroundColor: light,
      body: state.isLoading
          ? Center(child: GFLoader())
          : _screens[state.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: white,
        elevation: 1,
        currentIndex: state.currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) async {
          context.read(homeTabsProvider.notifier).onPageChanged(index);
        },
        items: items,
        selectedLabelStyle: textWhiteXXSmall(context),
        unselectedLabelStyle: textWhiteXXSmall(context),
        selectedIconTheme: IconThemeData(color: dark),
        unselectedIconTheme: IconThemeData(color: darkLight),
        selectedItemColor: dark,
        unselectedItemColor: darkLight,
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'text',
        isExtended: true,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrdersList(),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Image.asset(
            'lib/assets/images/pedir.png',
            width: 60,
            height: 60,
            alignment: Alignment.center,
          ),
        ),
        backgroundColor: primary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
