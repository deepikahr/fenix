import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:restaurant_saas/common/utils.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/models/api_response_models/brand/brand.dart';
import 'package:restaurant_saas/models/api_response_models/cuisine/cuisine.dart';
import 'package:restaurant_saas/models/api_response_models/restaurant/restaurant.dart';
import 'package:restaurant_saas/providers/providers.dart';
import 'package:restaurant_saas/screens/checkout/cart_screen/cart_screen.dart';
import 'package:restaurant_saas/screens/home/browseByBrand/browseByBrand.dart';
import 'package:restaurant_saas/screens/home/browseByCuisine/browseByCuisine.dart';
import 'package:restaurant_saas/screens/restaurant/restaurant_screen.dart';
import 'package:restaurant_saas/screens/view_all/shimmer_view_all.dart';
import 'package:restaurant_saas/screens/view_all/view_all_state.dart';
import 'package:restaurant_saas/widgets/appbar.dart';
import 'package:restaurant_saas/widgets/card.dart';

enum ViewAllType {
  brand,
  cuisine,
  topRatedRestaurant,
  nearByRestaurant,
  featuredRestaurant,
  product
}

class ViewAllScreen extends HookWidget {
  final String title;
  final ViewAllType type;

  ViewAllScreen(this.title, this.type);
  @override
  Widget build(BuildContext context) {
    final state = useProvider(viewAllProvider);
    final cartCount = useProvider(cartProvider)?.cartCount;

    useEffect(() {
      Future.delayed(Duration.zero, () {
        context.read(viewAllProvider.notifier).fetch(type);
      });
      return;
    }, const []);

    return Scaffold(
      appBar: titleAppbarWithCart(context, title, cartCount, () {
        Get.to(() => CartScreen(backButton: true));
      }),
      body: Stack(
        children: [
          if (!state.isLoading) body(state),
          if (state.isLoading)
            if (type == ViewAllType.brand || type == ViewAllType.cuisine)
              shimmerCircularViewList(context)
            else
              shimmerViewList(context)
        ],
      ),
    );
  }

  Widget body(ViewAllState state) {
    switch (type) {
      case ViewAllType.brand:
        return _forBrands(state.brands, state.pageNumber);
      case ViewAllType.topRatedRestaurant:
        return _forRestaurants(state.restaurants, state.pageNumber);
      case ViewAllType.nearByRestaurant:
        return _forRestaurants(state.restaurants, state.pageNumber);
      case ViewAllType.featuredRestaurant:
        return _forRestaurants(state.restaurants, state.pageNumber);
      case ViewAllType.cuisine:
        return _forCuisines(state.cuisines, state.pageNumber);
      default:
        throw 'Unhandled type: $type';
    }
  }

  Widget _forRestaurants(List<Restaurant> restaurants, pageNumber) {
    return Container(
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
            handleScrollWithIndex(i, pageNumber,
                () => context.read(viewAllProvider.notifier).fetch(type));
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

  Widget _forBrands(List<Brand> brands, pageNumber) {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        maxCrossAxisExtent: 120,
      ),
      itemCount: brands.length,
      itemBuilder: (context, i) {
        handleScrollWithIndex(i, pageNumber,
            () => context.read(viewAllProvider.notifier).fetch(type));
        return InkWell(
            onTap: () => Get.to(() => BrowseByBrand(brand: brands[i])),
            child: popularRestaurantCard(
              context,
              brands[i].logo!.imageUrl,
              brands[i].restaurantName,
              // radius: 60,
            ));
      },
    );
  }

  Widget _forCuisines(List<Cuisine> cuisines, pageNumber) {
    return GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 120,
        ),
        itemCount: cuisines.length,
        itemBuilder: (BuildContext context, int i) {
          handleScrollWithIndex(i, pageNumber,
              () => context.read(viewAllProvider.notifier).fetch(type));
          return InkWell(
            onTap: () {
              Get.to(() => BrowseByCuisine(cuisine: cuisines[i]));
            },
            child: cuisineCard(
              context,
              cuisines[i].imageUrl,
              cuisines[i].cuisineName,
            ),
          );
        });
  }
}
