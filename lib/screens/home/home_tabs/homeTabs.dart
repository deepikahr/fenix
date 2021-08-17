import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/home/drawer/drawer.dart';
import 'package:fenix_user/screens/tabs/cart/cart.dart';
import 'package:fenix_user/screens/tabs/category/category.dart';
import 'package:fenix_user/screens/tabs/order_details/orderDetails.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/appbar.dart';
import 'package:fenix_user/widgets/buttons.dart';
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
      if (isMounted()) {
        Future.delayed(Duration.zero, () async {
          context.read(homeTabsProvider.notifier).onPageChanged(tabIndex);
          await context.read(settingsProvider.notifier).fetchSettings();
          await context.read(homeTabsProvider.notifier).fetchLanguage();
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
            settingsState.isLoading,
            settingsState,
            () {
              context.read(homeTabsProvider.notifier).onPageChanged(0);
              Get.to(() => HomeTabs(tabIndex: 0));
            }),
        backgroundColor: grey2,
        body: state.isLoading
            ? Center(child: GFLoader(type: GFLoaderType.ios))
            : state.currentIndex == 0
                ? Home()
                : state.currentIndex == 1
                    ? Category()
                    : state.currentIndex == 2
                        ? Category()
                        : state.currentIndex == 3
                            ? OrderDetails()
                            : Home(),
        // _screens[state.currentIndex],
        bottomNavigationBar: customBottomBar(
          (index) async {
            DB().saveTabIndex(state.currentIndex);
            context.read(homeTabsProvider.notifier).onPageChanged(index);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: buildCenterIcon(context, cart, () async {
          context.read(homeTabsProvider.notifier).onPageChanged(4);
          Get.to(() => CartScreen());
        }));
  }
}
