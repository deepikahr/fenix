import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/cart/cart.dart';
import 'package:fenix_user/models/api_response_models/product_details_response/product_details_response.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/home/drawer/drawer.dart';
import 'package:fenix_user/screens/product/product_details/productDetails.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/appbar.dart';
import 'package:fenix_user/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final db = DB();

class ProductList extends HookWidget {
  final String? categoryId;
  final String? categoryImage;
  ProductList({this.categoryId, this.categoryImage});

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    final state = useProvider(productListProvider);
    final homeState = useProvider(homeTabsProvider);
    final notifier = useProvider(productListProvider.notifier);
    final isMounted = useIsMounted();
    final cart = useProvider(cartProvider);

    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () async {
          await notifier.fetchProductData(categoryId);
        });
      }
      return;
    }, const []);

    return Scaffold(
      backgroundColor: grey2,
      key: _scaffoldKey,
      drawer: DrawerPage(),
      appBar: fenixAppbar(context, _scaffoldKey, items, homeState.selectedLanguage,
              (String? value) => context.read(homeTabsProvider.notifier).onSelectLanguage(value!)
      ),
      body: Stack(
        children: [
          state.productTotal == 0 ? Container(
            alignment: Alignment.topCenter,
            child: Text('NO_PRODUCT'.tr),
          ) :
          ListView(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            children: [
              if ((state.productData?.data!.length ?? 0) > 0)
              categoryList(context, state.categoryTitle!),
              SizedBox(height: 10),
              if ((state.products?.length ?? 0) > 0)
              db.getType() == 'list' ?
              productList(state.productData!.data!, notifier, state, cart) :
              productListGrid(context, state.productData!.data!, notifier, state, cart),
            ],
          ),
          if(state.isLoading)
            GFLoader(type: GFLoaderType.ios)
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

  Widget productList(List<ProductDetailsResponse>? product, notifier, state, Cart? cart) =>
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
              child: dishesInfoCard(context, product[index], notifier, state, categoryImage,
                    () async {
                if (product[index].isCustomizable) {
                  await Get.to(() => ProductDetails(
                    productId: product[index].id,
                  ));
                  notifier.updateQuantity();
                } else {
                  await notifier.findLastUpdateProduct(
                    product[index],
                    true,
                    product[index].franchiseName,
                  );
                }
              },
                    () async {
                  if (product[index].isCustomizable) {
                    await showDialog(
                        context: context,
                        builder: (context) =>
                            showPopUp(context, product[index], () async {
                              Get.back();
                              await notifier.findLastUpdateProduct(
                                  product[index], true, product[index].restaurantName);
                            }, cart));
                  } else {
                    await notifier.findLastUpdateProduct(
                        product[index], true, product[index].restaurantName);
                  }
                },
                    () {
                  if (product[index].isSameProductMultipleTime == true) {
                    showDialog(
                        context: context,
                        builder: (context) =>
                            showMulitipleTimeProductPopUp(context, cart));
                  } else {
                    notifier.updateProductsQuantity(product[index], false);
                  }
                },
              )),
      );

  Widget productListGrid(
      BuildContext context, List<ProductDetailsResponse>? product, notifier, state, Cart? cart) =>
      GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 12),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: product!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            childAspectRatio: MediaQuery.of(context).size.width / 510),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.to(() => ProductDetails( productId: product[index].id,));
            },
            child: gridDishCard(context, product[index], notifier, state, categoryImage,
                  () async {
                if (product[index].isCustomizable) {
                  await Get.to(() => ProductDetails(
                    productId: product[index].id,
                  ));
                  notifier.updateQuantity();
                } else {
                  await notifier.findLastUpdateProduct(
                    product[index],
                    true,
                    product[index].franchiseName,
                  );
                }
              },
                  () async {
                if (product[index].isCustomizable) {
                  await showDialog(
                      context: context,
                      builder: (context) =>
                          showPopUp(context, product[index], () async {
                            Get.back();
                            await notifier.findLastUpdateProduct(
                                product[index], true, product[index].restaurantName);
                          }, cart));
                } else {
                  await notifier.findLastUpdateProduct(
                      product[index], true, product[index].restaurantName);
                }
              },
                  () {
                if (product[index].isSameProductMultipleTime == true) {
                  showDialog(
                      context: context,
                      builder: (context) =>
                          showMulitipleTimeProductPopUp(context, cart));
                } else {
                  notifier.updateProductsQuantity(product[index], false);
                }
              },
            )
          );
        },
      );


  Widget showMulitipleTimeProductPopUp(BuildContext context, Cart? cart) {
    return Dialog(
      child: Container(
        height: 165,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${'MULTIPLE_SAME_PRODUCTS_IN_CART'.tr}',
              style: textBlackLargeBM(context),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                    child: GFButton(
                      blockButton: true,
                      size: GFSize.LARGE,
                      color: primary,
                      type: GFButtonType.outline,
                      onPressed: () => Get.back(),
                      child: Text(
                        'CANCEL'.tr.toUpperCase(),
                        style: textPrimarySmallBM(context),
                        textAlign: TextAlign.center,
                      ),
                    )),
                SizedBox(width: 10),
                Expanded(
                    child: GFButton(
                      blockButton: true,
                      size: GFSize.LARGE,
                      color: GFColors.DARK,
                      type: GFButtonType.outline,
                      onPressed: () async {
                        Get.back();
                        await Get.to(() => Cart());
                        context.read(productListProvider.notifier).updateQuantity();
                      },
                      child: Text(
                        'CART'.tr.toUpperCase(),
                        style: textBlackSmallBM(context),
                        textAlign: TextAlign.center,
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget showPopUp(
      BuildContext context, ProductDetailsResponse product, Function() onRepeat, Cart? cart) {
    return Dialog(
      child: Container(
        height: 165,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${'HOW_YOU_LIKE_TO_CUSTOMIZE_?'.tr}',
              style: textBlackLargeBM(context),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                    child: GFButton(
                      blockButton: true,
                      size: GFSize.LARGE,
                      color: primary,
                      type: GFButtonType.outline,
                      onPressed: onRepeat,
                      child: Text(
                        'REPEAT_LAST'.tr.toUpperCase(),
                        style: textPrimarySmallBM(context),
                        textAlign: TextAlign.center,
                      ),
                    )),
                SizedBox(width: 10),
                Expanded(
                    child: GFButton(
                      blockButton: true,
                      size: GFSize.LARGE,
                      color: GFColors.DARK,
                      type: GFButtonType.outline,
                      onPressed: () async {
                        Get.back();
                        await Get.to(() => ProductDetails(productId: product.id!));
                        context.read(productListProvider.notifier).updateQuantity();
                      },
                      child: Text(
                        'NEW'.tr.toUpperCase(),
                        style: textBlackSmallBM(context),
                        textAlign: TextAlign.center,
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }


}
