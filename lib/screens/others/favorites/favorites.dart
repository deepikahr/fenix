import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/common/utils.dart';
import 'package:restaurant_saas/models/api_response_models/restaurant/restaurant.dart';
import 'package:restaurant_saas/providers/providers.dart';
import 'package:restaurant_saas/screens/checkout/cart_screen/cart_screen.dart';
import 'package:restaurant_saas/screens/others/favorites/shimmer_favourite.dart';
import 'package:restaurant_saas/screens/restaurant/restaurant_screen.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/appbar.dart';
import 'package:restaurant_saas/widgets/buttons.dart';
import 'package:restaurant_saas/widgets/card.dart';
import 'package:restaurant_saas/widgets/network_image.dart';
import 'package:restaurant_saas/widgets/normalText.dart';

class Favorites extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final state = useProvider(favoritesProvider);
    final cart = useProvider(cartProvider);

    useEffect(() {
      Future.delayed(Duration.zero, () {
        context.read(favoritesProvider.notifier).fetchFavourites();
      });
      return;
    }, const []);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar:
            titleAppbarWithCart(context, 'FAVORITE'.tr, cart?.cartCount, () {
          Get.to(CartScreen(backButton: true));
        }),
        body: Stack(
          children: [
            ListView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: [
                Container(
                    padding: EdgeInsets.all(16),
                    height: 65,
                    child: Row(
                      children: [
                        categoryTabButton(context, 'RESTAURANTS'.tr, () {
                          context
                              .read(favoritesProvider.notifier)
                              .onRestaurantSelect();
                        }, state.showRestaurants),
                        // SizedBox(
                        //   width: 6,
                        // ),
                        //TODO: favourite dishes not implemented
                        // categoryTabButton(context, 'DISHES'.tr, () {
                        //   context
                        //       .read(favoritesProvider.notifier)
                        //       .onDishesSelect(state.pageNumber);
                        // }, state.showDishes),
                      ],
                    )),
                greyDivider(context),
                if (state.showRestaurants)
                  _forRestaurants(state.restaurants, state.favouriteIndex,
                      state.isFavouriteLoading, state.pageNumber)
              ],
            ),
            if (state.restaurants.isEmpty)
              Center(child: Text('NO_FAVOURITES_AVAILABLE'.tr)),
            if (state.isLoading)
              Container(color: Colors.white, child: shimmerFavorites()),
          ],
        ));
  }

  Widget _forRestaurants(List<Restaurant>? restaurants, favouriteIndex,
          isFavouriteLoading, int pageNumber) =>
      Container(
        child: ListView.separated(
            separatorBuilder: (_, __) => Divider(
                  thickness: .3,
                  color: Colors.black12,
                  height: 30,
                ),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            physics: ScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: restaurants?.length ?? 0,
            itemBuilder: (BuildContext context, int i) {
              handleScrollWithIndex(
                  i,
                  pageNumber,
                  () => context
                      .read(favoritesProvider.notifier)
                      .fetchFavourites());
              return InkWell(
                onTap: () => Get.to(() => RestaurantScreen(
                    restaurants![i].id!, restaurants[i].vendor!)),
                child: catererBlock(
                    context,
                    restaurants![i].logo?.imageUrl,
                    restaurants[i].restaurantName,
                    restaurants[i]
                        .cuisines
                        .map((e) => e.cuisineName)
                        .join(', '),
                    restaurants[i].franchiseName,
                    restaurants[i].averageRating,
                    restaurants[i].preparationTime,
                    restaurants[i].workingHours?.timings[0].slot ?? '',
                    '',
                    restaurants[i].calcDistance,
                    isFavouriteLoading: isFavouriteLoading
                        ? favouriteIndex == i
                            ? true
                            : false
                        : false, removeFavouriteListener: () {
                  context
                      .read(favoritesProvider.notifier)
                      .onRemoveFavourite(i, restaurants[i].id!);
                }),
              );
            }),
      );

  Widget dishesList() {
    return ListView.builder(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (BuildContext context, int i) {
          // return dishesInfoCard(
          //   context,
          //   'productInfo',
          //   () {
          //     Get.to(()=>ProductSizeSelection());
          //   },
          // );
          return Container();
        });
  }

  Widget restaurantList() {
    return Container(
      color: Colors.white,
      child: ListView.separated(
          separatorBuilder: (_, __) => Divider(
                thickness: .3,
                color: Colors.black12,
                height: 30,
              ),
          padding: EdgeInsets.all(16),
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 6,
          itemBuilder: (BuildContext context, int i) {
            return restaurantInfoCard(
                context, '', '', '', '', .0, 0, 0, '', false, false);
          }),
    );
  }

  Widget catererBlock(context, image, caterername, cuisine, address, rating,
      deliverytime, restaurantTime, timeStatus, distance,
      {removeFavouriteListener, isFavouriteLoading = false}) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      color: Colors.white,
      child: Column(
        children: [
          GFListTile(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            avatar: networkImage(image, 97, 109, 10),
            title:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: titleTextDarkSmallBR(context, caterername),
                  ),
                ],
              ),
              SizedBox(height: 5),
              titleTextDarkLightXSmallBR(context, cuisine),
              SizedBox(height: 5),
              Text(
                '$address, ${(distance / 1000.0).toStringAsFixed(2)} ${'KM'.tr}',
                style: textDarkLight2XSmallBR(context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ratingDistanceRow(
                      context, rating, '$deliverytime ${'MINS'.tr}'),
                  isFavouriteLoading
                      ? GFLoader()
                      : InkWell(
                          onTap: removeFavouriteListener,
                          child: Image.asset(
                            'lib/assets/icons/heart.png',
                            scale: 3,
                          ),
                        )
                ],
              ),
              dottedLine(context, darkLight, 5),
              Row(
                children: [
                  titleTextDarkLightXSmallBR(context, restaurantTime),
                  Text(timeStatus, style: textRedLightXSmallBR(context))
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
