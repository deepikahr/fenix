import 'package:fenix_user/models/api_response_models/category_response/category_response.dart';
import 'package:fenix_user/providers/providers.dart';
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

    final homeState = useProvider(homeTabsProvider);
    final state = useProvider(categoryProvider);
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    final isMounted = useIsMounted();

    useEffect(() {
      Future.delayed(Duration.zero, () async {
        if (isMounted()) {
          await context.read(categoryProvider.notifier).
          fetchCategory(homeState.currentIndex == 1 ? 'BEVERAGE_CATEGORY' : 'FOOD_CATEGORY', 1, 10);
        }
      });
      return;
    }, const []);

    return Scaffold(
      backgroundColor: light,
      key: _scaffoldKey,
      drawer: DrawerPage(),
      body: Container(
            color: light,
            child: Stack(
              children: [
                ListView(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  children: [
                    if ((state.category?.length ?? 0) > 0)
                    db.getType() == 'list' ?
                    categoryBlock(context, state.category) :
                    categoryListGrid(context, state.category),
                  ],
                ),
                if (state.isLoading) GFLoader(type: GFLoaderType.ios)
              ],
            ),
      ),
    );
  }

  Widget categoryBlock(BuildContext context, List<CategoryResponse>? category) {
    return Container(
      // color: Colors.white,
      margin: EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
      // padding: EdgeInsets.symmetric(vertical: 1),
      child: ListView.builder(
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: category!.length,
          itemBuilder: (BuildContext context, int i) {
            return InkWell(
              onTap: () {
                context.read(homeTabsProvider.notifier).onPageChanged(5);
                Get.to(() => ProductList(categoryId: category[i].id, categoryImage: category[i].imageUrl));
              },
              child: restaurantInfoCard(context, category[i].title, category[i].imageUrl),
            );
          }),
    );
  }

  Widget categoryListGrid(
      BuildContext context, List<CategoryResponse>? category) =>
      GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: category!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            childAspectRatio: MediaQuery.of(context).size.width / 500),
        itemBuilder: (context, i) {
          return InkWell(
              onTap: () {
                context.read(homeTabsProvider.notifier).onPageChanged(5);
                Get.to(() => ProductList(categoryId: category[i].id, categoryImage: category[i].imageUrl));
              },
              child: restaurantInfoCardGrid(context, category[i].title, category[i].imageUrl));
        },
      );

}
