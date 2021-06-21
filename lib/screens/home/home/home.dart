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

    useEffect(() {
      Future.delayed(Duration.zero, () async {
        if (isMounted()) {
          await context.read(homeProvider.notifier).fetchHomeData(6, 1);
        }
      });
      return;
    }, const []);

    return Scaffold(
      appBar: homeAppbar(context, onAppBarTap,
          '${db.getLocalAddress() == null ? "" : (db.getLocalAddress()?.address ?? '')}'),
      body: Container(
          color: light,
          child: Stack(
            children: [
              ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: [
                  if ((state.homeData?.banners.length ?? 0) > 0)
                    bannerBlock(context, state.homeData?.banners),
                  if ((state.homeData?.nearByRestaurants.length ?? 0) > 0)
                    nearByYouBlock(
                        context, state.homeData?.nearByRestaurants, state),
                  // topPickBlock(context, state?.homeData?.products),
                  if ((state.homeData?.brands.length ?? 0) > 0)
                    popularBrandsBlock(context, state.homeData?.brands, state),
                  if ((state.homeData?.topRatedRestaurants.length ?? 0) > 0)
                    topRatedBlock(
                        context, state.homeData?.topRatedRestaurants, state),
                  if ((state.homeData?.cuisines.length ?? 0) > 0)
                    cuisinesBlock(context, state.homeData?.cuisines, state),
                  if ((state.homeData?.featureRestaurants.length ?? 0) > 0)
                    featuredRestaurantsBlock(
                        context, state.homeData?.featureRestaurants, state),
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
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          titleViewAllRow(context, 'NEAR_BY_YOU'.tr, () {
            Get.to(() => ViewAllScreen(
                'NEAR_BY_RESTAURANTS'.tr, ViewAllType.nearByRestaurant));
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
