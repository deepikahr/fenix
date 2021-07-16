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

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // final state = useProvider(homeProvider);

    // useEffect(() {
    //   Future.delayed(Duration.zero, () async {
    //     if (isMounted()) {
    //       await context.read(homeProvider.notifier).fetchCategoryData(6, 1);
    //     }
    //   });
    //   return;
    // }, const []);

    return Scaffold(
      backgroundColor: light,
      key: _scaffoldKey,
      drawer: DrawerPage(),
      body: Container(
            color: light,
            child: ListView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: [
                // homeButtonRow(context, items, (String? string) =>
                //     useState(() => selectedItem = string!), selectedItem),
                // if ((state.homeData?.nearByRestaurants.length ?? 0) > 0)

                db.getType() == 'list' ?
                categoryBlock(context) :
                categoryListGrid(context),
              ],
            ),
      ),
    );
  }

  Widget categoryBlock(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 8, left: 12, right: 12, bottom: 8),
      // padding: EdgeInsets.symmetric(vertical: 1),
      child: ListView.separated(
          separatorBuilder: (_, __) => Divider(
            thickness: .3,
            color: Colors.black12,
            indent: 16,
            endIndent: 16,
            height: 30,
          ),
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (BuildContext context, int i) {
            return InkWell(
              // onTap: () {
              //   Get.to(() => ProductList(categoryId: category[i].id));
              // },
              child: restaurantInfoCard(context, 'title', null),
            );
          }),
    );
  }

  Widget categoryListGrid(
      BuildContext context) =>
      GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            childAspectRatio: MediaQuery.of(context).size.width / 245),
        itemBuilder: (context, i) {
          return InkWell(
              onTap: () {
                // Get.to(() => ProductList(categoryId: category[i].id));
              },
              child: restaurantInfoCardGrid(context, 'title', null));
        },
      );

}
