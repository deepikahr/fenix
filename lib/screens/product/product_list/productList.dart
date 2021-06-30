import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/category_response/category_response.dart';
import 'package:fenix_user/models/api_response_models/product_response/product_response.dart';
import 'package:fenix_user/providers/providers.dart';
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
  final String? categoryId;

  ProductList({this.categoryId});

  String selectedItem = 'Idiomos';
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    final state = useProvider(productListProvider);
    final notifier = useProvider(productListProvider.notifier);
    final isMounted = useIsMounted();

    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () async {
          await notifier.fetchProductData(categoryId);
        });
      }
      return;
    }, const []);

    return Scaffold(
      backgroundColor: light,
      key: _scaffoldKey,
      drawer: DrawerPage(),
      appBar: fenixAppbar(context, _scaffoldKey, items, selectedItem,  (String? string) =>
          useState(() => selectedItem = string!)),
      body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            children: [
              if ((state.productData?.data!.length ?? 0) > 0)
              categoryList(context, state.categoryTitle!),
              SizedBox(height: 10),
              if ((state.products?.length ?? 0) > 0)
              db.getType() == 'list' ?
              productList(state.products!) :
              productListGrid(context, state.products!),
            ],
          ),
          if(state.isLoading)
            GFLoader()
        ],
      ),
    );
  }

  Widget categoryList(context, String category) => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: Text(
          category,
          style: textDarkRegularBS(context),
        ),
      )
    ],
  );

  Widget productList(List<ProductResponse>? product) =>
      ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: product!.length,
          itemBuilder: (context, index) => InkWell(
              onTap: () {
                Get.to(() => ProductDetails(
                  productId: product[index].id,
                ));
              },
              child: dishesInfoCard(context, product[index])),
      );

  Widget productListGrid(
      BuildContext context, List<ProductResponse>? product) =>
      GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: product!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            childAspectRatio: MediaQuery.of(context).size.width / 503),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.to(() => ProductDetails( productId: product[index].id,));
            },
            child: gridDishCard(context, product[index])
          );
        },
      );
}
