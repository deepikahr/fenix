import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/common/utils.dart';
import 'package:restaurant_saas/models/api_response_models/brand/brand.dart';
import 'package:restaurant_saas/models/api_response_models/restaurant/restaurant.dart';
import 'package:restaurant_saas/providers/providers.dart';
import 'package:restaurant_saas/screens/checkout/cart_screen/cart_screen.dart';
import 'package:restaurant_saas/screens/view_all/shimmer_view_all.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/appbar.dart';
import 'package:restaurant_saas/widgets/card.dart';
import 'package:get/get.dart';
import 'package:restaurant_saas/screens/restaurant/restaurant_screen.dart';

class BrowseByBrand extends HookWidget {
  final Brand? brand;

  BrowseByBrand({this.brand});

  @override
  Widget build(BuildContext context) {
    final state = useProvider(browseByBrandProvider);
    final cartCount = useProvider(cartProvider)?.cartCount;
    useEffect(() {
      Future.delayed(Duration.zero, () {
        context
            .read(browseByBrandProvider.notifier)
            .fetchRestaurantList(brand!.restaurantName!);
      });
      return;
    }, const []);
    return Scaffold(
      backgroundColor: light,
      appBar:
          titleAppbarWithCart(context, brand!.restaurantName, cartCount, () {
        Get.to(CartScreen(backButton: true));
      }),
      body: Stack(
        children: [
          if (state.restaurants.isNotEmpty)
            _forRestaurants(state.restaurants, state.pageNumber),
          if (state.restaurants.isEmpty)
            Center(
              child: Text('NO_RESTAURANTS_AVAILABLE'.tr),
            ),
          if (state.isLoading) shimmerViewList(context),
        ],
      ),
    );
  }

  Widget _forRestaurants(List<Restaurant> restaurants, int pageNumber) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.symmetric(vertical: 16),
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
          itemCount: restaurants.length,
          itemBuilder: (BuildContext context, int i) {
            handleScrollWithIndex(
                i,
                pageNumber,
                () => context
                    .read(browseByBrandProvider.notifier)
                    .fetchRestaurantList(brand!.restaurantName!));
            return InkWell(
              onTap: () {
                Get.to(() => RestaurantScreen(
                    restaurants[i].id!, restaurants[i].vendor!));
              },
              child: restaurantInfoCard(
                context,
                restaurants[i].restaurantName!,
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
          }),
    );
  }
}
