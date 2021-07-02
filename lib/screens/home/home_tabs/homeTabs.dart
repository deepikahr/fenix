import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/home/drawer/drawer.dart';
import 'package:fenix_user/screens/others/cart/cart.dart';
import 'package:fenix_user/screens/others/total_amount/totalAmount.dart';
import 'package:fenix_user/screens/product/product_details/productDetails.dart';
import 'package:fenix_user/screens/product/product_list/productList.dart';
import 'package:fenix_user/screens/tabs/category/category.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/appbar.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:fenix_user/widgets/fab_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
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

    final items = <String>[
      'red',
      'blue',
      'black',
      'Idiomos',
    ];
    String selectedItem = 'Idiomos';

    final state = useProvider(homeTabsProvider);
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    useEffect(() {
      Future.delayed(Duration.zero, () {
        context.read(homeTabsProvider.notifier).onPageChanged(tabIndex);
      });
      return;
    }, const []);

    var _screens = <Widget>[
      Home(),
      Category(),
      Category(),
      TotalAmount(),
    ];

    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerPage(),
      appBar: fenixAppbar(context, _scaffoldKey, items, selectedItem,  (String? string) =>
        useState(() => selectedItem = string!)),
      backgroundColor: light,
      body: state.isLoading
          ? Center(child: GFLoader())
          : _screens[state.currentIndex],
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: white,
      //   elevation: 1,
      //   currentIndex: state.currentIndex,
      //   type: BottomNavigationBarType.fixed,
      //   onTap: (index) async {
      //     context.read(homeTabsProvider.notifier).onPageChanged(index);
      //   },
      //   items: [
      //     bottomBarTabItem(context, 'Volver'.tr, "lib/assets/images/1.png", 0),
      //     bottomBarTabItem(context, 'Beida'.tr, "lib/assets/images/2.png", 0),
      //     bottomBarTabItem(context, 'Comida'.tr, "lib/assets/images/3.png", 0),
      //     bottomBarTabItem(context, 'Pagar'.tr, "lib/assets/images/4.png", 0),
      //   ],
      //   selectedItemColor: primary,
      //   unselectedItemColor: darkLight,
      // ),
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: 'PEDIR',
        color: Colors.grey,
        selectedColor: primary,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: (index) async {
          context.read(homeTabsProvider.notifier).onPageChanged(index);
        },
        items: [
          FABBottomAppBarItem(iconData: "lib/assets/images/1.png", text: 'Volver'.tr),
          FABBottomAppBarItem(iconData: "lib/assets/images/2.png", text: 'Beida'.tr),
          FABBottomAppBarItem(iconData: "lib/assets/images/3.png", text: 'Comida'.tr),
          FABBottomAppBarItem(iconData: "lib/assets/images/4.png", text: 'Pagar'.tr),

        ], backgroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFab(context),
    );
  }

  Widget _buildFab(BuildContext context) {
    return SizedBox(
      width: 44,
      height: 44,
      child: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartScreen(),
            ),
          );
        },
        backgroundColor: primary,
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Image.asset(
            'lib/assets/images/pedir.png',
            width: 40,
            height: 40,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }

}
