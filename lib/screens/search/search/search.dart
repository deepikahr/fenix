import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:restaurant_saas/common/utils.dart';
import 'package:restaurant_saas/database/db.dart';
import 'package:restaurant_saas/screens/checkout/cart_screen/cart_screen.dart';
import 'package:restaurant_saas/screens/search/search/searchStateNotifier.dart';
import 'package:restaurant_saas/screens/search/search/search_shimmer.dart';
import 'dart:async';
import 'package:restaurant_saas/widgets/buttons.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/appbar.dart';
import 'package:restaurant_saas/widgets/card.dart';
import 'package:restaurant_saas/widgets/normalText.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/providers/providers.dart';
import 'package:restaurant_saas/models/api_response_models/product/product.dart';
import 'package:restaurant_saas/models/api_response_models/restaurant/restaurant.dart';
import 'package:get/get.dart';
import 'package:restaurant_saas/screens/restaurant/restaurant_screen.dart';
import 'package:restaurant_saas/screens/products/productSelection/productSelection.dart';

final db = DB();

// ignore: must_be_immutable
class Search extends HookWidget {
  Timer? timer;

  final GlobalKey<FormFieldState>? formKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    final searchTextFieldController = useTextEditingController();
    final state = useProvider(searchProvider);
    final notifier = useProvider(searchProvider.notifier);

    useEffect(() {
      return timer?.cancel;
    }, const []);

    return Scaffold(
        appBar: searchAppbar(
          context,
          TextFormField(
            key: key,
            controller: searchTextFieldController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.search,
            onFieldSubmitted: (value) {
              if (timer?.isActive ?? false) timer!.cancel();
              timer = Timer(Duration(milliseconds: 500), () {
                if (value.isNotEmpty) {
                  context
                      .read(searchProvider.notifier)
                      .search(value, isScroll: true, pageNumber: 1);
                }
              });
              FocusScope.of(context).unfocus();
            },
            style: textWhiteRegularBM(),
            decoration: InputDecoration(
              hintText: 'SEARCH_FOR_FOOD_OR_RESTAURANT'.tr,
              hintStyle: textWhiteLight3SmallBR(context),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              border: InputBorder.none,
              suffixIcon: Image.asset(
                'lib/assets/icons/search.png',
                scale: 4,
                color: whiteLight,
              ),
            ),
          ),
        ),
        backgroundColor: light,
        body: Stack(
          fit: StackFit.expand,
          children: [
            ListView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: [
                Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(bottom: 8),
                    height: 65,
                    color: Colors.white,
                    child: Row(
                      children: [
                        categoryTabButton(context, 'RESTAURANTS'.tr, () {
                          context
                              .read(searchProvider.notifier)
                              .onRestaurantSelect(
                                  searchWord: searchTextFieldController.text);
                        }, state.showRestaurants),
                        SizedBox(
                          width: 6,
                        ),
                        categoryTabButton(context, 'DISHES'.tr, () {
                          context.read(searchProvider.notifier).onDishesSelect(
                              searchWord: searchTextFieldController.text);
                        }, state.showDishes),
                      ],
                    )),
                if (state.showRestaurants)
                  restaurantList(state.restaurants, state.pageNumber,
                      searchTextFieldController.text),
                if (state.showDishes)
                  dishesList(state.products, state.pageNumber,
                      searchTextFieldController.text, notifier, state),
              ],
            ),
            if (state.showRestaurants && state.restaurants.isEmpty)
              Center(
                child: Text('NO_RESTAURANTS_AVAILABLE'.tr),
              ),
            if (state.showDishes && state.products.isEmpty)
              Center(
                child: Text('NO_DISHES_AVAILABLE'.tr),
              ),
            if (state.isLoading)
              Container(color: Colors.white, child: shimmerSearch())
          ],
        ));
  }

  Widget restaurantList(List<Restaurant>? restaurants, pageNumber, searchWord) {
    return (restaurants?.isNotEmpty ?? false)
        ? Container(
            color: Colors.white,
            child: ListView.separated(
              separatorBuilder: (_, __) => Divider(
                thickness: .3,
                color: Colors.black12,
                height: 30,
              ),
              padding: EdgeInsets.symmetric(vertical: 16),
              physics: ScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: restaurants?.length ?? 0,
              itemBuilder: (BuildContext context, int i) {
                handleScrollWithIndex(
                    i,
                    pageNumber,
                    () => context
                        .read(searchProvider.notifier)
                        .search(searchWord));
                return InkWell(
                  onTap: () => Get.to(
                    () => RestaurantScreen(
                      restaurants![i].id!,
                      restaurants[i].vendor!,
                    ),
                  ),
                  child: restaurantInfoCard(
                    context,
                    restaurants![i].restaurantName!,
                    restaurants[i].logo?.imageUrl,
                    restaurants[i]
                        .cuisines
                        .map((e) => e.cuisineName)
                        .join(', '),
                    restaurants[i].franchiseName,
                    restaurants[i].calcDistance!,
                    restaurants[i].averageRating,
                    restaurants[i].preparationTime,
                    restaurants[i].workingHours?.timings[0].slot ?? '',
                    restaurants[i].isFavorite,
                    restaurants[i].storeOpen,
                  ),
                );
              },
            ),
          )
        : Container();
  }

  Widget dishesList(List<Product>? products, pageNumber, searchWord,
          SearchStateNotifier notifier, state) =>
      ListView.builder(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: products?.length ?? 0,
        itemBuilder: (BuildContext context, int i) {
          handleScrollWithIndex(i, pageNumber,
              () => context.read(searchProvider.notifier).search(searchWord));
          return dishesInfoCard(
            context,
            products![i].productName!,
            products[i].productImage!.imageUrl,
            products[i].restaurantName,
            products[i].franchiseName,
            products[i].preparationTime,
            products[i].discount,
            products[i].averageRating,
            products[i].originalPrice,
            products[i].sellingPrice,
            products[i].description,
            products[i].isVeg,
            products[i].totalQuantity,
            state.currencySymbol,
            () async {
              if (products[i].isCustomization) {
                await Get.to(() => ProductSizeSelection(
                      products[i].id!,
                    ));
                notifier.updateQuantity();
              } else {
                await notifier.findLastUpdateProduct(
                  products[i],
                  true,
                );
              }
            },
            () async {
              if (products[i].isCustomization) {
                await showDialog(
                    context: context,
                    builder: (context) =>
                        showPopUp(context, products[i], () async {
                          Get.back();
                          await notifier.findLastUpdateProduct(
                              products[i], true);
                        }));
              } else {
                await notifier.findLastUpdateProduct(products[i], true);
              }
            },
            () {
              if (products[i].isSameProductMultipleTime == true) {
                showDialog(
                    context: context,
                    builder: (context) =>
                        showMulitipleTimeProductPopUp(context));
              } else {
                notifier.updateProductsQuantity(products[i], false);
              }
            },
          );
        },
      );

  Widget showMulitipleTimeProductPopUp(context) {
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
                  onPressed: () {
                    Get.back();
                    Get.to(() => CartScreen(backButton: true));
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

  Widget showPopUp(context, Product product, Function() onRepeat) {
    return Dialog(
      child: Container(
        height: 155,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${'REPEAT_LAST_USED_CUSTOMIZATION'.tr}',
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
                  onPressed: () {
                    Get.back();
                    Get.to(() => ProductSizeSelection(product.id!));
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

  Widget defaultSearchOption(context) => ListView(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleTextDarkRegularBR(context, 'Recently Used'),
                SizedBox(
                  height: 6,
                ),
                ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return locationTile(context,
                          '22nd main road, Opposite 8th street, HSR Layout');
                    }),
              ],
            ),
          ),
          popularBrandsBlock(context),
          cuisinesBlock(context),
        ],
      );

  Widget popularBrandsBlock(context) {
    return Container(
      color: Colors.white,
      height: 140,
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.symmetric(vertical: 14),
      child: Column(
        children: [
          titleViewAllRow(context, 'Popular Brands', () {}),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(top: 12, left: 16),
                physics: ScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (BuildContext context, int i) {
                  return popularRestaurantCard(
                      context, 'lib/assets/images/banner1.png', 'TEST');
                }),
          )
        ],
      ),
    );
  }

  Widget cuisinesBlock(context) {
    return Container(
      color: Colors.white,
      height: 150,
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          titleViewAllRow(context, 'Browse by Cuisines', () {}),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(top: 12, left: 16),
                physics: ScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (BuildContext context, int i) {
                  return cuisineCard(
                    context,
                    'lib/assets/images/banner1.png',
                    'Seafood',
                  );
                }),
          )
        ],
      ),
    );
  }
}
