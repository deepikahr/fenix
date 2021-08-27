import 'dart:async';

import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/product_details_response/product_details_response.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/product/product_details/product_details.dart';
import 'package:fenix_user/screens/product/product_list/product_list_notifier.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductList extends HookWidget {
  final String categoryImage;
  final String categoryId;

  ProductList(this.categoryId, this.categoryImage, {Key? key})
      : super(key: key);

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

    return Container(
      key: _scaffoldKey,
      color: grey2,
      child: Stack(
        children: [
          Stack(
            children: [
              if (!state.isLoading && state.totalProducts == 0)
                Center(
                  child: Text('NO_PRODUCT'.tr),
                ),
              if (state.totalProducts != 0)
                ListView(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  children: [
                    if (state.products.length > 0)
                      categoryList(context, state.categoryTitle),
                    SizedBox(height: 10),
                    if (state.products.length > 0) ...[
                      if (DB().getType() == 'list')
                        productList(state.products, notifier),
                      if (DB().getType() != 'list')
                        productListGrid(context, state.products, notifier),
                    ]
                  ],
                ),
            ],
          ),
          if (state.isLoading) GFLoader(type: GFLoaderType.ios)
        ],
      ),
    );
  }

  Widget categoryList(context, String? category) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Text(
              category ?? '',
              style: textDarkRegularBS(context),
            ),
          )
        ],
      );

  Widget productList(List<ProductDetailsResponse> products,
          ProductListNotifier notifier) =>
      ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: products.length,
        itemBuilder: (context, index) => InkWell(
            onTap: () {
              context
                  .read(homeTabsProvider.notifier)
                  .showScreen(ProductDetails(products[index].id ?? ''));
            },
            child: dishesInfoCard(
              context,
              products[index],
              notifier,
              categoryImage,
              () async {
                if (products[index].isCustomizable) {
                  context
                      .read(homeTabsProvider.notifier)
                      .showScreen(ProductDetails(products[index].id ?? ''));
                } else {
                  await notifier.addOrRemoveProduct(
                    products[index],
                    true,
                  );
                }
              },
              () async {
                if (products[index].isCustomizable) {
                  await showDialog(
                      context: context,
                      builder: (context) =>
                          showPopUp(context, products[index], () async {
                            Get.back();
                            await notifier.addOrRemoveProduct(
                              products[index],
                              true,
                            );
                          }));
                } else {
                  await notifier.addOrRemoveProduct(
                    products[index],
                    true,
                  );
                }
              },
              () {
                if (products[index].isSameProductMultipleTime) {
                  showDialog(
                    context: context,
                    builder: (context) => showMultipleTimeProductPopUp(context),
                  );
                } else {
                  notifier.addOrRemoveProduct(products[index], false);
                }
              },
            )),
      );

  Widget productListGrid(
    BuildContext context,
    List<ProductDetailsResponse>? products,
    ProductListNotifier notifier,
  ) =>
      GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 12),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: products!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            childAspectRatio: MediaQuery.of(context).size.width / 620),
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                context
                    .read(homeTabsProvider.notifier)
                    .showScreen(ProductDetails(products[index].id ?? ''));
              },
              child: gridDishCard(
                context,
                products[index],
                notifier,
                categoryImage,
                () async {
                  if (products[index].isCustomizable) {
                    context
                        .read(homeTabsProvider.notifier)
                        .showScreen(ProductDetails(products[index].id ?? ''));
                  } else {
                    await notifier.addOrRemoveProduct(
                      products[index],
                      true,
                    );
                  }
                },
                () async {
                  if (products[index].isCustomizable) {
                    await showDialog(
                      context: context,
                      builder: (context) => showPopUp(
                        context,
                        products[index],
                        () async {
                          Get.back();
                          await notifier.addOrRemoveProduct(
                            products[index],
                            true,
                          );
                        },
                      ),
                    );
                  } else {
                    await notifier.addOrRemoveProduct(products[index], true);
                  }
                },
                () {
                  if (products[index].isSameProductMultipleTime == true) {
                    showDialog(
                        context: context,
                        builder: (context) =>
                            showMultipleTimeProductPopUp(context));
                  } else {
                    notifier.addOrRemoveProduct(products[index], false);
                  }
                },
              ));
        },
      );

  Widget showMultipleTimeProductPopUp(BuildContext context) {
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
                  color: primary(),
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
                    // context.read(homeTabsProvider.notifier).showScreen(CartScreen());
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
    BuildContext context,
    ProductDetailsResponse product,
    Function() onRepeat,
  ) {
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
                  color: primary(),
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
                    context
                        .read(homeTabsProvider.notifier)
                        .showScreen(ProductDetails(product.id ?? ''));
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
