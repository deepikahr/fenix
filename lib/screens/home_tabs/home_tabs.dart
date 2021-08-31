import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/cart_screen/cart_screen.dart';
import 'package:fenix_user/screens/category/category.dart';
import 'package:fenix_user/screens/drawer/drawer.dart';
import 'package:fenix_user/screens/home/home.dart';
import 'package:fenix_user/screens/notify_waiter/notify_waiter.dart';
import 'package:fenix_user/screens/order_details/order_details.dart';
import 'package:fenix_user/widgets/appbar.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeTabs extends HookWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final state = useProvider(homeTabsProvider);
    final notifier = useProvider(homeTabsProvider.notifier);
    final cart = useProvider(cartProvider);
    final orders = useProvider(orderDetailsProvider);
    final isMounted = useIsMounted();

    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () async {
          notifier.showScreen(Home());
          await notifier.fetchSettings();
          await notifier.fetchLanguage();
        });
      }
    }, const []);

    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerPage(),
      appBar: fenixAppbar(
        context,
        _scaffoldKey,
        (value) {
          notifier.onSelectLanguage(value);
        },
        state.languages,
        state.isLoading,
        state.settingsIsLoading,
        state.settings?.tabSetting?.callToWaiter ?? false,
        () {
          notifier.showScreen(Home());
        },
        () {
          notifier.showScreen(NotifyWaiter());
        },
      ),
      body: state.currentScreen,
      bottomNavigationBar: customBottomBar(
        state.bottomBarIndex,
        (int index) async {
          notifier.changeBottomBarNavIndex(index);
          if (index == 0) {
            notifier.showScreen(Home());
          } else if (index == 1) {
            notifier.showScreen(
                CategoryScreen(UniqueKey(), CATEGORY_TYPE.beverageCategory));
          } else if (index == 2) {
            notifier.showScreen(
                CategoryScreen(UniqueKey(), CATEGORY_TYPE.foodCategory));
          } else if (index == 3) {
            notifier.showScreen(OrderDetails());
          }
        },
          orders.orderDetails?.cart.length == null ? '0' : orders.orderDetails?.cart.length
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buildCenterIcon(context, cart, () async {
        notifier.showScreen(CartScreen());
      }),
    );
  }
}
