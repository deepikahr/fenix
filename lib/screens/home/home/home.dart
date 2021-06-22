import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/models/api_response_models/banner/banner_model.dart';
import 'package:restaurant_saas/models/api_response_models/brand/brand.dart';
import 'package:restaurant_saas/models/api_response_models/cuisine/cuisine.dart';
import 'package:restaurant_saas/models/api_response_models/restaurant/restaurant.dart';
import 'package:restaurant_saas/providers/providers.dart';
import 'package:restaurant_saas/screens/home/browseByBrand/browseByBrand.dart';
import 'package:restaurant_saas/screens/home/browseByCuisine/browseByCuisine.dart';
import 'package:restaurant_saas/screens/home/drawer/drawer.dart';
import 'package:restaurant_saas/screens/home/notify_waiter/notify_waiter.dart';
import 'package:restaurant_saas/screens/pre_auth/pickLocation/pickLocation.dart';
import 'package:restaurant_saas/screens/products/productSelection/productSelection.dart';
import 'package:restaurant_saas/screens/restaurant/restaurant_screen.dart';
import 'package:restaurant_saas/screens/view_all/view_all.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/appbar.dart';
import 'package:restaurant_saas/widgets/card.dart';
import 'package:restaurant_saas/widgets/normalText.dart';
import '../../../database/db.dart';
import './home_shimmer.dart';

final db = DB();

class Home extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final state = useProvider(homeProvider);
    final isMounted = useIsMounted();
    final List<String> items = <String>[
      "red",
      "blue",
      "black",
      "Idiomos",
    ];
    String? selectedItem = 'Idiomos';
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    useEffect(() {
      Future.delayed(Duration.zero, () async {
        if (isMounted()) {
          await context.read(homeProvider.notifier).fetchHomeData(6, 1);
        }
      });
      return;
    }, const []);

    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerPage(),
      appBar: PreferredSize(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              // padding: EdgeInsets.symmetric(vertical: 15),
              decoration: new BoxDecoration(
                color: secondary1,
                // boxShadow: [
                //   BoxShadow(color: Colors.black45, blurRadius: 20)
                // ]
              ),
            ),
            Positioned(
              top: 45,
              left: 20,
              child: InkWell(
                onTap: () => _scaffoldKey.currentState!.openDrawer(),
                child: Icon(
                  Icons.list,
                  color: primary,
                  size: 40,
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
      body: Container(
          color: light,
          child: Stack(
            children: [
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
                                  BoxShadow(
                                      color: Colors.black45, blurRadius: 2)
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
                                    style:
                                        TextStyle(color: white, fontSize: 10),
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
                                padding:
                                    const EdgeInsets.fromLTRB(16, 14, 16, 4),
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
                  if ((state.homeData?.banners.length ?? 0) > 0)
                    bannerBlock(context, state.homeData?.banners),
                  if ((state.homeData?.nearByRestaurants.length ?? 0) > 0)
                    nearByYouBlock(
                        context, state.homeData?.nearByRestaurants, state),
                  // if ((state.homeData?.nearByRestaurants.length ?? 0) > 0)
                  //   nearByYouBlockGrid(
                  //       context, state.homeData?.nearByRestaurants, state),
                  // topPickBlock(context, state?.homeData?.products),
                  // if ((state.homeData?.brands.length ?? 0) > 0)
                  //   popularBrandsBlock(context, state.homeData?.brands, state),
                  // if ((state.homeData?.topRatedRestaurants.length ?? 0) > 0)
                  //   topRatedBlock(
                  //       context, state.homeData?.topRatedRestaurants, state),
                  // if ((state.homeData?.cuisines.length ?? 0) > 0)
                  //   cuisinesBlock(context, state.homeData?.cuisines, state),
                  // if ((state.homeData?.featureRestaurants.length ?? 0) > 0)
                  //   featuredRestaurantsBlock(
                  //       context, state.homeData?.featureRestaurants, state),
                  // offersBlock(context, state?.homeData?.offerForYou),
                ],
              ),
              if (state.isLoading)
                Container(color: Colors.white, child: shimmerHome())
            ],
          )),
    );
  }

  void onAppBarTap() {
    Get.to(() => PickLocation(backButton: true, isHomePage: true));
  }

  Widget bannerBlock(BuildContext context, List<BannerModel>? banners) {
    var list = banners?.map(
      (banner) {
        return InkWell(
          onTap: () {
            if (banner.bannerType == 'PRODUCT') {
              Get.to(() => ProductSizeSelection(banner.productId!));
            } else if (banner.bannerType == 'CATEGORY') {
              Get.to(() => RestaurantScreen(
                    banner.franchiseId!,
                    banner.vendorId!,
                    categoryId: banner.categoryId,
                  ));
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: carouselCard(
              context,
              banner.image!.imageUrl,
              banner.title,
              banner.description,
              'ORDER_NOW'.tr,
            ),
          ),
        );
      },
    ).toList();
    return Container(
      color: Colors.white,
      child: GFCarousel(
        autoPlay: false,
        pagination: true,
        viewportFraction: 1.0,
        activeIndicator: primary,
        passiveIndicator: darkLight2,
        height: 180,
        aspectRatio: 2,
        onPageChanged: (_) {},
        items: list ?? [],
      ),
    );
  }

  Widget popularBrandsBlock(BuildContext context, List<Brand>? brands, state) {
    return Container(
      color: Colors.white,
      height: 165,
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.symmetric(vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleViewAllRow(context, 'POPULAR_BRANDS'.tr, () {
            Get.to(() => ViewAllScreen('POPULAR_BRANDS'.tr, ViewAllType.brand));
          }),
          Expanded(
            child: ListView.separated(
                separatorBuilder: (context, i) {
                  return SizedBox(width: 5);
                },
                padding: EdgeInsets.only(top: 12, left: 10, right: 10),
                physics: ScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: brands?.length ?? 0,
                itemBuilder: (BuildContext context, int i) => InkWell(
                      onTap: () => Get.to(
                        () => BrowseByBrand(brand: brands![i]),
                      ),
                      child: popularRestaurantCard(
                        context,
                        brands![i].logo!.imageUrl,
                        brands[i].restaurantName,
                      ),
                    )),
          )
        ],
      ),
    );
  }

  Widget topRatedBlock(
      BuildContext context, List<Restaurant>? restaurants, state) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          titleViewAllRow(context, 'TOP_RATED_RESTAURANTS'.tr, () {
            Get.to(() => ViewAllScreen(
                'TOP_RATED_RESTAURANTS'.tr, ViewAllType.topRatedRestaurant));
          }),
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
                padding: EdgeInsets.only(top: 16),
                physics: ScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: restaurants?.length ?? 0,
                itemBuilder: (BuildContext context, int i) {
                  return InkWell(
                    onTap: () {
                      Get.to(() => RestaurantScreen(
                          restaurants![i].id!, restaurants[i].vendor!));
                    },
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
                }),
          )
        ],
      ),
    );
  }

  Widget nearByYouBlock(
      BuildContext context, List<Restaurant>? restaurants, state) {
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
                itemCount: restaurants?.length ?? 0,
                itemBuilder: (BuildContext context, int i) {
                  return InkWell(
                    onTap: () {
                      Get.to(() => RestaurantScreen(
                          restaurants![i].id!, restaurants[i].vendor!));
                    },
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
                }),
          )
        ],
      ),
    );
  }

  Widget nearByYouBlockGrid(
      BuildContext context, List<Restaurant>? restaurants, state) {
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
          GridView.builder(
            physics: ScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: restaurants?.length ?? 0,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: MediaQuery.of(context).size.width / 383),
            itemBuilder: (BuildContext context, int i) {
              return InkWell(
                onTap: () {
                  Get.to(() => RestaurantScreen(
                      restaurants![i].id!, restaurants[i].vendor!));
                },
                child: restaurantInfoCardGrid(
                  context,
                  restaurants![i].restaurantName!,
                  restaurants[i].logo?.imageUrl,
                  restaurants[i].cuisines.map((e) => e.cuisineName).join(', '),
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
          // Flexible(
          //   fit: FlexFit.loose,
          //   child: ListView.separated(
          //       separatorBuilder: (_, __) => Divider(
          //             thickness: .3,
          //             color: Colors.black12,
          //             indent: 16,
          //             endIndent: 16,
          //             height: 30,
          //           ),
          //       padding: EdgeInsets.only(
          //         top: 16,
          //       ),
          //       physics: ScrollPhysics(),
          //       scrollDirection: Axis.vertical,
          //       shrinkWrap: true,
          //       itemCount: restaurants?.length ?? 0,
          //       itemBuilder: (BuildContext context, int i) {
          //         return InkWell(
          //           onTap: () {
          //             Get.to(() => RestaurantScreen(
          //                 restaurants![i].id!, restaurants[i].vendor!));
          //           },
          //           child: restaurantInfoCard(
          //             context,
          //             restaurants![i].restaurantName!,
          //             restaurants[i].logo?.imageUrl,
          //             restaurants[i]
          //                 .cuisines
          //                 .map((e) => e.cuisineName)
          //                 .join(', '),
          //             restaurants[i].franchiseName,
          //             restaurants[i].calcDistance!,
          //             restaurants[i].averageRating,
          //             restaurants[i].preparationTime,
          //             restaurants[i].workingHours?.timings[0].slot ?? '',
          //             restaurants[i].isFavorite,
          //             restaurants[i].storeOpen,
          //           ),
          //         );
          //       }),
          // )
        ],
      ),
    );
  }

  //   Widget nearByYouBlock(
  //     BuildContext context, List<Restaurant>? restaurants, state) {
  //   return Container(
  //     color: Colors.white,
  //     margin: EdgeInsets.only(top: 8),
  //     padding: EdgeInsets.symmetric(vertical: 16),
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         // titleViewAllRow(context, 'NEAR_BY_YOU'.tr, () {
  //         //   Get.to(() => ViewAllScreen(
  //         //       'NEAR_BY_RESTAURANTS'.tr, ViewAllType.nearByRestaurant));
  //         // }),
  //         Flexible(
  //           fit: FlexFit.loose,
  //           child: ListView.separated(
  //               separatorBuilder: (_, __) => Divider(
  //                     thickness: .3,
  //                     color: Colors.black12,
  //                     indent: 16,
  //                     endIndent: 16,
  //                     height: 30,
  //                   ),
  //               padding: EdgeInsets.only(
  //                 top: 16,
  //               ),
  //               physics: ScrollPhysics(),
  //               scrollDirection: Axis.vertical,
  //               shrinkWrap: true,
  //               itemCount: restaurants?.length ?? 0,
  //               itemBuilder: (BuildContext context, int i) {
  //                 return InkWell(
  //                   onTap: () {
  //                     Get.to(() => RestaurantScreen(
  //                         restaurants![i].id!, restaurants[i].vendor!));
  //                   },
  //                   child: restaurantInfoCard(
  //                     context,
  //                     restaurants![i].restaurantName!,
  //                     restaurants[i].logo?.imageUrl,
  //                     restaurants[i]
  //                         .cuisines
  //                         .map((e) => e.cuisineName)
  //                         .join(', '),
  //                     restaurants[i].franchiseName,
  //                     restaurants[i].calcDistance!,
  //                     restaurants[i].averageRating,
  //                     restaurants[i].preparationTime,
  //                     restaurants[i].workingHours?.timings[0].slot ?? '',
  //                     restaurants[i].isFavorite,
  //                     restaurants[i].storeOpen,
  //                   ),
  //                 );
  //               }),
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget cuisinesBlock(BuildContext context, List<Cuisine>? cuisines, state) =>
      Container(
        color: Colors.white,
        height: 165,
        margin: EdgeInsets.only(top: 8),
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleViewAllRow(context, 'BROWSE_BY_CUISINES'.tr, () {
              Get.to(() => ViewAllScreen('CUISINES'.tr, ViewAllType.cuisine));
            }),
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (_, __) => Divider(
                        thickness: .3,
                        color: Colors.black12,
                        height: 30,
                      ),
                  padding: EdgeInsets.only(top: 12, left: 10, right: 10),
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: cuisines?.length ?? 0,
                  itemBuilder: (BuildContext context, int i) => InkWell(
                        onTap: () {
                          Get.to(() => BrowseByCuisine(cuisine: cuisines![i]));
                        },
                        child: cuisineCard(
                          context,
                          cuisines![i].imageUrl,
                          cuisines[i].cuisineName,
                        ),
                      )),
            )
          ],
        ),
      );

  Widget featuredRestaurantsBlock(
      BuildContext context, List<Restaurant>? restaurants, state) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          titleViewAllRow(context, 'FEATURED_RESTAURANTS'.tr, () {
            Get.to(
              () => ViewAllScreen(
                  'FEATURED_RESTAURANTS'.tr, ViewAllType.featuredRestaurant),
            );
          }),
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
                padding: EdgeInsets.only(top: 16),
                physics: ScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: restaurants?.length ?? 0,
                itemBuilder: (BuildContext context, int i) {
                  return InkWell(
                    onTap: () {
                      Get.to(() => RestaurantScreen(
                          restaurants![i].id!, restaurants[i].vendor!));
                    },
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
                }),
          )
        ],
      ),
    );
  }

// offersBlock(BuildContext context, List<Offer> offers) {
//   return Container(
//     color: Colors.white,
//     margin: EdgeInsets.only(top: 8),
//     padding: EdgeInsets.symmetric(vertical: 16),
//     child: Column(
//       children: [
//         titleViewAllRow(context, 'Offers For You'),
//         GFCarousel(
//           autoPlay: false,
//           pagination: true,
//           viewportFraction: .95,
//           activeIndicator: primary,
//           passiveIndicator: darkLight2,
//           height: 180,
//           aspectRatio: 2,
//           onPageChanged: (_) {},
//           items: offers?.map((offer) {
//                 return InkWell(
//                     onTap: () {},
//                     child: carouselCard(
//                         context,
//                         offer.imageUrl,
//                         '${offer.discount} % OFF',
//                         offer.description,
//                         'ORDER NOW'));
//               })?.toList() ??
//               [],
//         ),
//       ],
//     ),
//   );
// }
// topPickBlock(BuildContext context, List<Product> products) {
//   return Container(
//     color: Colors.white,
//     height: 180,
//     margin: EdgeInsets.only(top: 8),
//     padding: EdgeInsets.symmetric(vertical: 16),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         titleViewAllRow(context, 'Top picks for you', () {}),
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: ListView.builder(
//                 padding: EdgeInsets.only(top: 12, left: 16),
//                 physics: ScrollPhysics(),
//                 scrollDirection: Axis.horizontal,
//                 shrinkWrap: true,
//                 itemCount: products?.length ?? 0,
//                 itemBuilder: (BuildContext context, int i) {
//                   return InkWell(
//                     onTap: () {
//                       Get.to(()=>RestaurantScreen());
//                     },
//                     child: restaurantCard(
//                       context,
//                       products[i].productImage.imageUrl,
//                       products[i].productName,
//                       '20 min',
//                     ),
//                   );
//                 }),
//           ),
//         )
//       ],
//     ),
//   );
// }
}
