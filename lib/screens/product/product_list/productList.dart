import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/screens/home/drawer/drawer.dart';
import 'package:fenix_user/screens/others/notify_waiter/notifyWaiter.dart';
import 'package:fenix_user/screens/product/product_details/productDetails.dart';
import 'package:fenix_user/screens/product/product_list/shimmerProductList.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/appbar.dart';
import 'package:fenix_user/widgets/card.dart';
import 'package:fenix_user/widgets/normalText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final db = DB();

class ProductList extends HookWidget {
  // final String restaurantId;
  // final String vendorId;
  // final String? categoryId;
  //
  // ProductList(this.restaurantId, this.vendorId, {this.categoryId});

  final List<String> items = <String>[
    "red",
    "blue",
    "black",
    "Idiomos",
  ];

  String selectedItem = 'Idiomos';
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    // useEffect(() {
    //   if (isMounted()) {
    //     // Future.delayed(Duration.zero, () async {
    //     // await notifier.fetchMenu(restaurantId, vendorId, categoryId);
    //     //   notifier.updateQuantity();
    //     // });
    //   }
    //   return;
    // }, const []);

    return Scaffold(
      backgroundColor: light,
      key: _scaffoldKey,
      appBar: fenixAppbar(context, _scaffoldKey, items, selectedItem,  (String? string) =>
          useState(() => selectedItem = string!)),
      body: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  'Carnes',
                  style: textDarkRegularBS(context),
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          categoryList(),
          categoryListGrid(context, ),
        ],
      ),
    );
  }

  Widget categoryList() =>
      ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context, index) => InkWell(
              onTap: () {
                Get.to(() => ProductDetails(
                ));
              },
              child: dishesInfoCard(context)),
      );

  Widget categoryListGrid(
      BuildContext context) =>
      GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 5,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            childAspectRatio: MediaQuery.of(context).size.width / 563),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.to(() => ProductDetails());
            },
            child: gridDishCard(context)
          );
        },
      );
}
