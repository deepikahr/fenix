import 'package:fenix_user/screens/home/drawer/drawer.dart';
import 'package:fenix_user/screens/others/notify_waiter/notifyWaiter.dart';
import 'package:fenix_user/screens/product/product_list/productList.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/appbar.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:fenix_user/widgets/card.dart';
import 'package:fenix_user/widgets/normalText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../database/db.dart';

final db = DB();

class Category extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // final state = useProvider(homeProvider);
    final isMounted = useIsMounted();
    final items = <String>[
      'red',
      'blue',
      'black',
      'Idiomos',
    ];
    String selectedItem = 'Idiomos';
    final _scaffoldKey =
    GlobalKey<ScaffoldState>();

    // useEffect(() {
    //   Future.delayed(Duration.zero, () async {
    //     if (isMounted()) {
    //       await context.read(homeProvider.notifier).fetchCategoryData(6, 1);
    //     }
    //   });
    //   return;
    // }, const []);

    return Scaffold(
      body: Container(
            color: light,
            child: ListView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: [
                // homeButtonRow(context, items, (String? string) =>
                //     useState(() => selectedItem = string!), selectedItem),
                // if ((state.homeData?.nearByRestaurants.length ?? 0) > 0)
                nearByYouBlock(context),
              ],
            ),
      ),
    );
  }

  Widget nearByYouBlock(
      BuildContext context,) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 8, left: 12, right: 12, bottom: 8),
      // padding: EdgeInsets.symmetric(vertical: 1),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // titleViewAllRow(context, 'NEAR_BY_YOU'.tr, () {
          //   Get.to(() => ViewAllScreen(
          //       'NEAR_BY_RESTAURANTS'.tr, ViewAllType.nearByRestaurant));
          // }),
          Flexible(
            fit: FlexFit.loose,
            child: ListView.separated(
                separatorBuilder: (_, __) => Divider(
                  thickness: .3,
                  color: Colors.black12,
                  indent: 16,
                  endIndent: 16,
                  height: 30,
                ),
                padding: EdgeInsets.only(
                  top: 16,
                ),
                physics: ScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int i) {
                  return InkWell(
                    onTap: () {
                      Get.to(() => ProductList(
                        // restaurants![i].id!, restaurants[i].vendor!
                      ));
                    },
                    child: restaurantInfoCard(
                      context,
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }


}
