import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/database/db.dart';
import 'package:restaurant_saas/models/api_request_models/cart/cart.dart';
import 'package:restaurant_saas/models/api_response_models/category_response/category_response.dart';
import 'package:restaurant_saas/models/api_response_models/cuisine/cuisine.dart';
import 'package:restaurant_saas/models/api_response_models/discount/discount.dart';
import 'package:restaurant_saas/models/api_response_models/offer/offer.dart';
import 'package:restaurant_saas/models/api_response_models/product/product.dart';
import 'package:restaurant_saas/providers/providers.dart';
import 'package:restaurant_saas/screens/checkout/cart_screen/cart_screen.dart';
import 'package:restaurant_saas/screens/products/productSelection/productSelection.dart';
import 'package:restaurant_saas/screens/restaurant/restaurantScreenStateNotifier.dart';
import 'package:restaurant_saas/screens/restaurant/shimmerRestaurantScreen.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/appbar.dart';
import 'package:restaurant_saas/widgets/card.dart';
import 'package:restaurant_saas/widgets/normalText.dart';

final db = DB();

class RestaurantScreen extends HookWidget {
  final String restaurantId;
  final String vendorId;
  final String? categoryId;

  RestaurantScreen(this.restaurantId, this.vendorId, {this.categoryId});

  @override
  Widget build(BuildContext context) {
    final state = useProvider(restaurantProvider);
    final notifier = useProvider(restaurantProvider.notifier);
    final isMounted = useIsMounted();
    final cart = useProvider(cartProvider);

    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () async {
          await notifier.fetchMenu(restaurantId, vendorId, categoryId);
          notifier.updateQuantity();
        });
      }
      return;
    }, const []);

    return Scaffold(
      backgroundColor: light,
      // appBar: titleAppbarWithCart(
      //     context, state.restaurant?.restaurantName ?? '', cart?.cartCount,
      //     () async {
      //   await Get.to(() => CartScreen(backButton: true));
      //   notifier.updateQuantity();
      // }),
            appBar: PreferredSize(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              // padding: EdgeInsets.symmetric(vertical: 15),
              decoration: new BoxDecoration(color: secondary1, boxShadow: [
                BoxShadow(color: Colors.black45, blurRadius: 20)
              ]),
            ),

            Positioned(
              top: 45,
              left: 20,
              child: Icon(
                Icons.list,
                color: primary,
                size: 40,
              ),
            ),
            Positioned(
              top: 45,
              left: 50,
              right: 50,
              child: Column(
                children: [
                  titleTextDarkRegularBW(context, "GASTROBAR"),
                  titleTextDarkRegularBW17(context, "CALLE LARIOS 12"),
                ],
              ),
            ),
            Positioned(
              top: 45,
              right: 20,
              child: Row(
                children: [
                  RotatedBox(
                    quarterTurns: -1,
                    child: RichText(
                      text: TextSpan(
                        text: 'Mesa',
                        style: textDarkRegularBW17(context),
                        children: [],
                      ),
                    ),
                  ),
                  Text('5', style: textDarkRegularBW40(context)),
                ],
              ),
            ),
          ],
        ),
        preferredSize: new Size(MediaQuery.of(context).size.width, 80.0),
      ),
      body: Stack(
        children: [
          if (state.restaurant != null)
            ListView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: [
                  Stack(
                    children: [
                      Column(children: [
                       Container(
                         height: 25,
                         color: secondary1,
                       ),
                        Container(
                         height: 13,
                         decoration: BoxDecoration(
                         color: white,
                           boxShadow: [
                           BoxShadow(color:Colors.black45,blurRadius:5)
                         ]),
                       ),
                        Container(
                         height: 12,
                         color: white,
                       ),
                      ],),
             Positioned(
             bottom: 0,
             left: 20,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFFFD2959),
                  border:Border.all(color:white,width:2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 2
                    )
                  ],
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  children: [
                    Icon(Icons.home,size: 30,color: white,),
                    Text('INCIO',style: TextStyle(color: white),)
                  ],
                ),
              )
            ),
            Positioned(
             bottom: 0,
             left: 80,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFFFD2959),
                  border:Border.all(color:white,width:2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 2
                    )
                  ],
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  children: [
                    Icon(Icons.home,size: 30,color: white,),
                    Text('INCIO',style: TextStyle(color: white),)
                  ],
                ),
              )
            ),
                    ],
                  ),
                // infoBlock(
                //   context,
                //   state.restaurant!.restaurantName!,
                //   state.restaurant!.franchiseName!,
                //   state.restaurant!.cuisines,
                //   state.restaurant!.averageRating,
                //   state.restaurant!.preparationTime,
                //   state.restaurant!.calcDistance!,
                //   state.restaurant!.discount,
                //   state.restaurant!.coupons,
                //   state,
                // ),
                // Container(
                //   margin: EdgeInsets.only(bottom: 8),
                //   padding: EdgeInsets.symmetric(horizontal: 16),
                //   color: Colors.white,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Expanded(
                //         child: Row(
                //           children: [
                //             titleTextDarkLightRegularBR(
                //                 context, '${'VEG_ONLY'.tr} :  '),
                //             Switch.adaptive(
                //               activeColor: green,
                //               value: state.isVegOnly,
                //               onChanged: (bool value) {
                //                 context
                //                     .read(restaurantProvider.notifier)
                //                     .onSelectVegOnly(value);
                //                 context
                //                     .read(restaurantProvider.notifier)
                //                     .fetchMenu(
                //                       state.restaurant!.id!,
                //                       state.restaurant!.vendor!,
                //                       categoryId,
                //                     );
                //               },
                //             ),
                //           ],
                //         ),
                //       ),
                //       if (notifier.isLoggedIn())
                //         Expanded(
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.end,
                //             children: [
                //               titleTextDarkLightSmallBR(
                //                   context, '${'FAVORITE'.tr} :   '),
                //               InkWell(
                //                 onTap: () {
                //                   state.restaurant!.isFavorite
                //                       ? context
                //                           .read(restaurantProvider.notifier)
                //                           .removeFromFavourite(
                //                               state.restaurant!.id!)
                //                       : context
                //                           .read(restaurantProvider.notifier)
                //                           .addToFavourite(state.restaurant!.id);
                //                 },
                //                 child: state.isFavouriteLoading
                //                     ? GFLoader()
                //                     : Image.asset(
                //                         state.restaurant!.isFavorite
                //                             ? 'lib/assets/icons/heart.png'
                //                             : 'lib/assets/icons/profile/fav.png',
                //                         height: 32,
                //                         width: 32,
                //                       ),
                //               )
                //             ],
                //           ),
                //         ),
                //     ],
                //   ),
                // ),
                       SizedBox(height:13),
                categoryList(
                    state.restaurant!.categories, notifier, cart, state),
              ],
            ),
          if (state.isLoading)
            Container(color: Colors.white, child: shimmerRestaurantBody())
        ],
      ),
    );
  }

  Widget infoBlock(
    context,
    String restaurantName,
    String franchiseName,
    List<Cuisine> cuisines,
    double averageRating,
    int? preparationTime,
    double distance,
    Discount? discount,
    List<Offer> offers,
    state,
  ) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 8),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            restaurantName,
            style: textDarkXXDarkBS(context),
          ),
          SizedBox(
            height: 5,
          ),
          if (cuisines.isNotEmpty)
            titleTextDarkLightXSmallBR(
              context,
              cuisines.map((e) => e.cuisineName).join(','),
            ),
          SizedBox(
            height: 5,
          ),
          titleTextDarkLightXSmallBR(context, franchiseName),
          SizedBox(
            height: 5,
          ),
          dottedLine(context, darkLight3.withOpacity(0.2), 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              averageRating > 0
                  ? Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 14,
                          color: darkLight,
                        ),
                        Text(averageRating.toStringAsFixed(1),
                            style: textDarkLight2XSmallBR(context)),
                        SizedBox(
                          width: 4,
                        ),
                      ],
                    )
                  : Container(),
              titleTextDarkXSmallBR(context, '$preparationTime ${'MINS'.tr}'),
              titleTextDarkXSmallBR(context,
                  '${(distance / 1000.0).toStringAsFixed(2)} ${'KM'.tr}'),
            ],
          ),
          if (discount?.isDiscountAvailable ?? false)
            SizedBox(
              height: 16,
            ),
          if (discount?.isDiscountAvailable ?? false)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                  color: dark, borderRadius: BorderRadius.circular(10)),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${'GET'.tr} ${discount?.discountPercentage ?? 0}${'DISCOUNT_OF_FIRST_ORDER'.tr} ',
                    style: textWhiteSmallBR(context),
                  ),
                  Image.asset(
                    'lib/assets/icons/discount.png',
                    color: Colors.white,
                    scale: 2,
                  ),
                ],
              ),
            ),
          if (offers.isNotEmpty)
            SizedBox(
              height: 16,
            ),
          if (offers.isNotEmpty)
            Container(
              height: 48,
              child: ListView.separated(
                  separatorBuilder: (_, __) => SizedBox(
                        width: 12,
                      ),
                  // padding: EdgeInsets.symmetric(horizontal: 16),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: offers.length,
                  itemBuilder: (context, index) => offerCard(
                      context,
                      offers[index].couponType == COUPON_TYPES.percentage
                          ? '${'GET'.tr} ${offers[index].offerValue} % ${'OFF'.tr}'
                          : '${'FLAT'.tr} ${state.currencySymbol}${offers[index].offerValue} ${'OFF'.tr}',
                      '${'USE_CODE'.tr} ${offers[index].couponCode}')),
            ),
        ],
      ),
    );
  }

  Widget dishesList(List<Product> products,
          RestaurantScreenStateNotifier notifier, Cart? cart, state) =>
      ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (BuildContext context, int i) => dishesInfoCard(
          context,
          products[i].productName!,
          products[i].productImage?.imageUrl,
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
                products[i].restaurantName,
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
                            products[i], true, products[i].restaurantName);
                      }, cart));
            } else {
              await notifier.findLastUpdateProduct(
                  products[i], true, products[i].restaurantName);
            }
          },
          () {
            if (products[i].isSameProductMultipleTime == true) {
              showDialog(
                  context: context,
                  builder: (context) =>
                      showMulitipleTimeProductPopUp(context, cart));
            } else {
              notifier.updateProductsQuantity(products[i], false);
            }
          },
        ),
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
                    await Get.to(() => CartScreen(backButton: true));
                    context.read(restaurantProvider.notifier).updateQuantity();
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
      BuildContext context, Product product, Function() onRepeat, Cart? cart) {
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
                    await Get.to(() => ProductSizeSelection(product.id!));
                    context.read(restaurantProvider.notifier).updateQuantity();
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

  Widget categoryList(List<CategoryResponse> categories,
          RestaurantScreenStateNotifier notifier, Cart? cart, state) =>
      ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) => 
        dishesList(categories[index].products, notifier, cart, state)
        // Theme(
        //   data: ThemeData().copyWith(
        //       accentColor: Colors.grey, dividerColor: Colors.transparent),
        //   child: ExpansionTile(
        //     initiallyExpanded: true,
        //     title: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Text(
        //           categories[index].title!,
        //           style: textDarkRegularLargeBS(context),
        //         ),
        //         SizedBox(
        //           height: 4,
        //         ),
        //         Text(
        //           (categories[index].products.isEmpty
        //               ? 'NO_PRODUCTS'.tr
        //               : '${categories[index].products.length} ${categories[index].products.length > 1 ? 'ITEMS'.tr : 'ITEM'.tr}'),
        //           style: textDarkLightSmallBR(context),
        //         ),
        //       ],
        //     ),
        //     children: [
        //       dishesList(categories[index].products, notifier, cart, state)
        //     ],
        //   ),
        // ),
      );
}
