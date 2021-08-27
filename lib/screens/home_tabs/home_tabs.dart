import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/category/category.dart';
import 'package:fenix_user/screens/home/home.dart';
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
    final cart = useProvider(cartProvider);

    useEffect(() {
      Future.delayed(Duration.zero, () {
        context.read(homeTabsProvider.notifier).showScreen(Home());
      });
    }, const []);

    return Scaffold(
      appBar: fenixAppbar(context, _scaffoldKey, (value) {}, [], false, false,
          false, () {}, () {}),
      body: state.currentScreen,
      bottomNavigationBar: customBottomBar(
        state.bottomBarIndex,
        (int index) async {
          context
              .read(homeTabsProvider.notifier)
              .changeBottomBarNavIndex(index);
          if (index == 0) {
            context.read(homeTabsProvider.notifier).showScreen(Home());
          } else if (index == 1) {
            context.read(homeTabsProvider.notifier).showScreen(
                CategoryScreen(UniqueKey(), CATEGORY_TYPE.beverageCategory));
          } else if (index == 2) {
            context.read(homeTabsProvider.notifier).showScreen(
                CategoryScreen(UniqueKey(), CATEGORY_TYPE.foodCategory));
          } else if (index == 3) {
            context.read(homeTabsProvider.notifier).showScreen(Center(
                  child: Text('Cart is not yet ready'),
                ));
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buildCenterIcon(context, cart, () async {
        // context.read(homeTabsProvider.notifier).showScreen(CartScreen());
      }),
    );
  }
}
