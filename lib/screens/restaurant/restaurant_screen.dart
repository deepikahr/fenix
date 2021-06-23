import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
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
import 'package:restaurant_saas/screens/home/drawer/drawer.dart';
import 'package:restaurant_saas/screens/home/notify_waiter/notify_waiter.dart';
import 'package:restaurant_saas/screens/products/product-details/productDetails.dart';
import 'package:restaurant_saas/screens/products/productSelection/productSelection.dart';
import 'package:restaurant_saas/screens/restaurant/restaurantScreenStateNotifier.dart';
import 'package:restaurant_saas/screens/restaurant/shimmerRestaurantScreen.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/card.dart';
import 'package:restaurant_saas/widgets/normalText.dart';

final db = DB();

class RestaurantScreen extends HookWidget {
  final String restaurantId;
  final String vendorId;
  final String? categoryId;

  RestaurantScreen(this.restaurantId, this.vendorId, {this.categoryId});
  final List<String> items = <String>[
    "red",
    "blue",
    "black",
    "Idiomos",
  ];
  String? selectedItem = 'Idiomos';
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
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
      key: _scaffoldKey,
      // appBar: titleAppbarWithCart(
      //     context, state.restaurant?.restaurantName ?? '', cart?.cartCount,
      //     () async {
      //   await Get.to(() => CartScreen(backButton: true));
      //   notifier.updateQuantity();
      // }),
      drawer: DrawerPage(),
      appBar: PreferredSize(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              // padding: EdgeInsets.symmetric(vertical: 15),
              decoration: new BoxDecoration(
                color: secondary1,
                //  boxShadow: [
                //   BoxShadow(color: Colors.black45, blurRadius: 20)
                // ]
              ),
            ),
            Positioned(
              top: 45,
              left: 20,
              child: InkWell(
                onTap: () => _scaffoldKey.currentState!.openDrawer(),
                child: Image.asset(
                  'lib/assets/images/drawer.png',
                  scale: 1.8,
                ),
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
                    Column(
                      children: [
                        Container(
                          height: 35,
                          color: secondary1,
                        ),
                        Container(
                          height: 13,
                          decoration: BoxDecoration(
                            color: white,
                            //    boxShadow: [
                            //    BoxShadow(color:Colors.black45,blurRadius:5)
                            //  ]
                          ),
                        ),
                        Container(
                          height: 12,
                          color: white,
                        ),
                      ],
                    ),
                    Positioned(
                        bottom: 0,
                        left: 20,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Color(0xFFFD2959),
                              border: Border.all(color: white, width: 2),
                              boxShadow: [
                                BoxShadow(color: Colors.black45, blurRadius: 2)
                              ],
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'lib/assets/images/i.png',
                                width: 30,
                                height: 40,
                              ),
                              Text(
                                'INICIO',
                                style: TextStyle(color: white, fontSize: 10),
                              )
                            ],
                          ),
                        )),
                    Positioned(
                        bottom: 0,
                        left: 100,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NotifyWaiter(),
                              ),
                            );
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Color(0xFFFD2959),
                                border: Border.all(color: white, width: 2),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black45, blurRadius: 2)
                                ],
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'lib/assets/images/c.png',
                                  width: 40,
                                  height: 40,
                                ),
                                Text(
                                  'LLAMAR',
                                  style: TextStyle(color: white, fontSize: 10),
                                )
                              ],
                            ),
                          ),
                        )),
                    Positioned(
                      right: 20,
                      bottom: 0,
                      child: DropdownButton<String>(
                        underline: Container(color: Colors.transparent),
                        iconSize: 0,
                        value: selectedItem,
                        onChanged: (String? string) =>
                            useState(() => selectedItem = string),
                        selectedItemBuilder: (BuildContext context) {
                          return items.map<Widget>((String item) {
                            return Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'lib/assets/images/food1.png',
                                    width: 50,
                                    height: 36,
                                    fit: BoxFit.fill,
                                  ),
                                  Text(
                                    item,
                                    style: textDarkRegularBGS(context),
                                  ),
                                ],
                              ),
                            );
                          }).toList();
                        },
                        items: items.map((String item) {
                          return DropdownMenuItem<String>(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 14, 16, 4),
                              child: Text(
                                '$item',
                                style: textDarkRegularBG(context),
                              ),
                            ),
                            value: item,
                          );
                        }).toList(),
                      ),
                    )
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
                SizedBox(height: 13),
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
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetails(),
                      ),
                    );
                  },
                  child: categoryList(
                      state.restaurant!.categories, notifier, cart, state),
                ),
                // InkWell(
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => ProductDetails(),
                //       ),
                //     );
                //   },
                //   child: categoryListGrid(context, state.restaurant!.categories,
                //       notifier, cart, state),
                // ),
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

  Widget dishesListGrid(BuildContext context, List<Product> products,
          RestaurantScreenStateNotifier notifier, Cart? cart, state) =>
      GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: MediaQuery.of(context).size.width / 383),
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
  Widget categoryListGrid(
          BuildContext context,
          List<CategoryResponse> categories,
          RestaurantScreenStateNotifier notifier,
          Cart? cart,
          state) =>
      GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            childAspectRatio: MediaQuery.of(context).size.width / 563),
        itemBuilder: (context, index) {
          return Container(
            // padding: EdgeInsets.only(left: 16, right: 16),
            margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 2)]),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // height: 145,
                      margin: EdgeInsets.only(top: 3, left: 3, right: 3),
                      child:
                          // Stack(
                          //   alignment: AlignmentDirectional.center,
                          //   children: [
                          Stack(
                        children: [
                          // networkImage(img, 105, 109, 4),
                          Container(
                              child: Image.asset(
                            'lib/assets/images/refer.png',
                            width: MediaQuery.of(context).size.width,
                            height: 139,
                            fit: BoxFit.cover,
                          )),
                          Positioned(
                              child: Container(
                            color: primary,
                            padding: EdgeInsets.all(4),
                            child: Text(
                              'OFFER',
                              style: textDarkRegularBSW(context),
                              textAlign: TextAlign.center,
                            ),
                          )),
                          Positioned(
                              bottom: 0,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                color: darkLight,
                                padding: EdgeInsets.all(4),
                                child: Text(
                                  'Ternera con verduras salteadas',
                                  style: textDarkRegularBSW(context),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  // textAlign: TextAlign.center,
                                ),
                              )),
                          // Positioned(
                          //   bottom: 0,
                          //   left: 0,
                          //   child: Center(
                          //     child: Text(
                          //       '\$234',
                          //       style: textDarkRegularBSW(context),
                          //     ),
                          //   ),
                          // )
                        ],
                      ),

                      // Positioned(
                      //   bottom: 0,
                      //   child: Container(
                      //     width: 97,
                      //     height: 38,
                      //     child: totalQautity > 0
                      //         ? Container(
                      //             decoration: BoxDecoration(
                      //                 color: white,
                      //                 border: Border.all(
                      //                     color: grey.shade300, width: 1),
                      //                 borderRadius: BorderRadius.circular(5)),
                      //             child: Row(
                      //               mainAxisAlignment:
                      //                   MainAxisAlignment.spaceBetween,
                      //               children: [
                      //                 InkWell(
                      //                     onTap: onRemove,
                      //                     child: Padding(
                      //                       padding: const EdgeInsets.all(8.0),
                      //                       child: Icon(
                      //                         Icons.remove,
                      //                         color: dark.withOpacity(0.8),
                      //                       ),
                      //                     )),
                      //                 Text('$totalQautity',
                      //                     style: textPrimaryLargeBM(context)),
                      //                 InkWell(
                      //                   onTap: onUpdate,
                      //                   child: Padding(
                      //                     padding: const EdgeInsets.all(8.0),
                      //                     child: Icon(
                      //                       Icons.add,
                      //                       color: dark.withOpacity(0.8),
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ))
                      //         : GFButton(
                      //             borderShape: RoundedRectangleBorder(
                      //                 borderRadius: BorderRadius.circular(4),
                      //                 side: BorderSide(color: buttonBorder)),
                      //             onPressed: onAdd,
                      //             color: Colors.white,
                      //             text: 'ADD'.tr,
                      //             textStyle: textPrimaryLargeBM(context),
                      //           ),
                      //   ),
                      // ),
                      //   ],
                      // ),
                    ),
                    // SizedBox(
                    //   width: 16,
                    // ),
                    // Expanded(
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(
                          //   height: 1,
                          // ),
                          Row(
                            children: [
                              // (isVeg == null
                              //     ? Container(
                              //         height: 14,
                              //         width: 14,
                              //       )
                              //     : isVeg == true
                              //         ? Container(
                              //             height: 14,
                              //             width: 14,
                              //             decoration: BoxDecoration(
                              //                 border: Border.all(color: green)),
                              //             child: Padding(
                              //               padding: const EdgeInsets.all(2.0),
                              //               child: GFAvatar(
                              //                   backgroundColor: green,
                              //                   shape: GFAvatarShape.circle),
                              //             ),
                              //           )
                              //         : Container(
                              //             height: 14,
                              //             width: 14,
                              //             decoration: BoxDecoration(
                              //                 border: Border.all(color: red)),
                              //             child: Padding(
                              //               padding: const EdgeInsets.all(2.0),
                              //               child: GFAvatar(
                              //                   backgroundColor: red,
                              //                   shape: GFAvatarShape.circle),
                              //             ),
                              //           )),
                              // SizedBox(
                              //   width: 5,
                              // ),
                              // Expanded(child: titleTextDarkRegularBR(context, 'name')),
                            ],
                          ),
                          // SizedBox(
                          //   height: 6,
                          // ),
                          titleTextDarkLightSmallBR(context,
                              'Mezcla de verduras al vapor con ternera de primera'),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              'Allergens',
                              style: textWhiteRegularBM(),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Container(
                              //   padding: EdgeInsets.all(8),
                              //   decoration: BoxDecoration(
                              //       color: primary,
                              //       borderRadius: BorderRadius.circular(5)),
                              //   child: Text(
                              //     'Allergens',
                              //     style: textWhiteRegularBM(),
                              //   ),
                              // ),
                              // Icon(
                              //   Icons.camera_alt,
                              //   color: primary,
                              // ),
                              Text(
                                '\$123',
                                style: textDarkRegularBS(context),
                              ),
                              // sellingPrice == originalPrice
                              //     ? Container()
                              //     : SizedBox(width: 12),
                              // sellingPrice == originalPrice
                              //     ? Container()
                              //     : Text(
                              //         '$currencySymbol${originalPrice.toStringAsFixed(2)}',
                              //         style: textDarkLight2XSmallLineThroughBR(context),
                              //       ),
                              Container(
                                  // width: 97,
                                  // height: 38,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: white,
                                          // border: Border.all(
                                          //     color: grey.shade300, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                              // onTap: onRemove,
                                              child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: 25,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                  color: white,
                                                  border: Border.all(
                                                      color: dark, width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              child: Icon(
                                                Icons.remove,
                                                color: dark,
                                              ),
                                            ),
                                          )),
                                          Text('12',
                                              style: textBlackLargeBM(context)),
                                          InkWell(
                                            // onTap: onUpdate,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 25,
                                                height: 25,
                                                decoration: BoxDecoration(
                                                    color: white,
                                                    border: Border.all(
                                                        color: dark, width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                child: Icon(
                                                  Icons.add,
                                                  color: dark,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ))
                                  // : GFButton(
                                  //     borderShape: RoundedRectangleBorder(
                                  //         borderRadius: BorderRadius.circular(4),
                                  //         side: BorderSide(color: buttonBorder)),
                                  //     onPressed: onAdd,
                                  //     color: Colors.white,
                                  //     text: 'ADD'.tr,
                                  //     textStyle: textPrimaryLargeBM(context),
                                  //   ),
                                  ),
                            ],
                          ),
                          // Container(
                          //   padding: EdgeInsets.all(8),
                          //   decoration: BoxDecoration(color: primary,
                          //   borderRadius: BorderRadius.circular(5)
                          //   ),
                          //   child: Text('Allergens',style: textWhiteRegularBM(),),
                          // )
                          // IconButton(
                          //   onPressed: () {},
                          //   icon: Icon(
                          //     Icons.favorite,
                          //     color: Colors.red,
                          //     size: 25,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    // ),
                  ],
                ),
                // dottedLine(context, darkLight3.withOpacity(0.2), 12),
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         restaurantLocationRow(context, restaurantName, franchiseName),
                //         discount > 0
                //             ? Row(
                //                 mainAxisAlignment: MainAxisAlignment.end,
                //                 children: [
                //                   Image.asset(
                //                     'lib/assets/icons/discount.png',
                //                     scale: 3,
                //                   ),
                //                   SizedBox(
                //                     width: 6,
                //                   ),
                //                   Text(
                //                     '$discount % ${'OFF'.tr}',
                //                     style: textGreenSmallBM(context: context),
                //                   )
                //                 ],
                //               )
                //             : Container()
                //       ],
                //     ),
                //     SizedBox(
                //       height: 4,
                //     ),
                //     ratingDistanceRow(context, averageRating, '$time ${'MINS'.tr}'),
                //   ],
                // )
              ],
            ),
          );
        },
      );
  // ListView.builder(
  //     shrinkWrap: true,
  //     physics: NeverScrollableScrollPhysics(),
  //     itemCount: categories.length,
  //     itemBuilder: (context, index) =>
  //         dishesList(categories[index].products, notifier, cart, state)
  //     // Theme(
  //     //   data: ThemeData().copyWith(
  //     //       accentColor: Colors.grey, dividerColor: Colors.transparent),
  //     //   child: ExpansionTile(
  //     //     initiallyExpanded: true,
  //     //     title: Column(
  //     //       crossAxisAlignment: CrossAxisAlignment.start,
  //     //       children: [
  //     //         Text(
  //     //           categories[index].title!,
  //     //           style: textDarkRegularLargeBS(context),
  //     //         ),
  //     //         SizedBox(
  //     //           height: 4,
  //     //         ),
  //     //         Text(
  //     //           (categories[index].products.isEmpty
  //     //               ? 'NO_PRODUCTS'.tr
  //     //               : '${categories[index].products.length} ${categories[index].products.length > 1 ? 'ITEMS'.tr : 'ITEM'.tr}'),
  //     //           style: textDarkLightSmallBR(context),
  //     //         ),
  //     //       ],
  //     //     ),
  //     //     children: [
  //     //       dishesList(categories[index].products, notifier, cart, state)
  //     //     ],
  //     //   ),
  //     // ),
  //     );
}
