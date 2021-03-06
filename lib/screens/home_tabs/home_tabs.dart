import 'package:fenix_user/common/kios_mode_utils.dart';
import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/network/socket.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/cart_screen/cart_screen.dart';
import 'package:fenix_user/screens/category/category.dart';
import 'package:fenix_user/screens/drawer/drawer.dart';
import 'package:fenix_user/screens/home/home.dart';
import 'package:fenix_user/screens/notify_waiter/notify_waiter.dart';
import 'package:fenix_user/screens/order_details/order_details.dart';
import 'package:fenix_user/screens/order_in_processs/order_in_process.dart';
import 'package:fenix_user/widgets/appbar.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:get/get.dart';

class HomeTabs extends HookWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final state = useProvider(homeTabsProvider);
    final notifier = useProvider(homeTabsProvider.notifier);
    final cart = useProvider(cartProvider);
    final isMounted = useIsMounted();
    SocketService socketService = SocketService();
    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () async {
          await socketService.socketInitialize();
          if (DB().getIsOrderPending()) {
            notifier.showScreen(OrdersInProcess(
              key: UniqueKey(),
              title: getOrderInProcessTitleInKioskMode,
              image: getOrderInProcessImageUrlInKioskMode,
            ));
          } else {
            if (shouldBeAbleToChangeTabs) {
              notifier.showScreen(Home());
            } else {
              notifier.showScreen(OrderDetails());
            }
          }
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
        state.settings?.tabSetting.callToWaiter ?? false,
        () {
          if (shouldBeAbleToChangeTabs) {
            notifier.showScreen(Home());
          } else {
            displayToastForLockedMode();
          }
        },
        () {
          if (shouldBeAbleToChangeTabs) {
            notifier.showScreen(NotifyWaiter());
          } else {
            displayToastForLockedMode();
          }
        },
      ),
      body: state.currentScreen,
      bottomNavigationBar:
          customBottomBar(state.bottomBarIndex, (int index) async {
        if (shouldBeAbleToChangeTabs) {
          notifier.changeBottomBarNavIndex(index);
          if (index == 0) {
            notifier.popScreen();
          } else if (index == 1) {
            notifier.showScreen(
                CategoryScreen(UniqueKey(), CATEGORY_TYPE.beverageCategory));
          } else if (index == 2) {
            notifier.showScreen(
                CategoryScreen(UniqueKey(), CATEGORY_TYPE.foodCategory));
          } else if (index == 3) {
            notifier.showScreen(OrderDetails());
          }
        } else {
          displayToastForLockedMode();
        }
      }, DB().getOrderId() != null ? cart : null),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buildCenterIcon(context, cart, () {
        if (shouldBeAbleToChangeTabs) {
          notifier.showScreen(CartScreen());
        } else {
          displayToastForLockedMode();
        }
      }),
    );
  }

  void displayToastForLockedMode() {
    if (isStuckOnPaymentForKioskMode) {
      Fluttertoast.showToast(msg: 'USER_CANT_CHANGE_PAYMENT'.tr);
    } else {
      Fluttertoast.showToast(msg: 'USER_CANT_CHANGE_ORDER'.tr);
    }
  }
}
