import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/banner_response/banner_response.dart';
import 'package:fenix_user/models/api_response_models/category_response/category_response.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/product/product_details/product_details.dart';
import 'package:fenix_user/screens/product/product_list/product_list.dart';
import 'package:fenix_user/screens/sub_category/sub_category.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'home_notifier.dart';

class Home extends HookWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = useProvider(homeProvider);
    final notifier = useProvider(homeProvider.notifier);
    final isMounted = useIsMounted();
    final db = useProvider(dbProvider);

    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () async {
          await notifier.fetchHome();
        });
      }
      return;
    }, const []);

    return Container(
      color: grey2,
      child: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            children: [
              if (state.banners.length > 0) bannerBlock(context, state.banners),
              if (state.categories.length > 0) ...[
                if (db.getType() == 'list')
                  categoryBlock(context, state.categories, notifier, db),
                if (db.getType() != 'list')
                  categoryListGrid(context, state.categories, notifier, db),
              ]
            ],
          ),
          if (state.isLoading) GFLoader(type: GFLoaderType.ios)
        ],
      ),
    );
  }

  Widget bannerBlock(BuildContext context, List<BannerResponse> banners) {
    var list = banners.map(
      (banner) {
        return InkWell(
          onTap: () {
            if (banner.productId != null) {
              context
                  .read(homeTabsProvider.notifier)
                  .showScreen(ProductDetails(banner.productId ?? ''));
            }
          },
          child: carouselCard(
            context,
            banner.image!.imageUrl,
            banner.title,
            'ORDER_NOW'.tr,
          ),
        );
      },
    ).toList();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: GFCarousel(
        autoPlay: false,
        pagination: true,
        viewportFraction: 1.0,
        activeIndicator: primary(),
        passiveIndicator: darkLight2,
        height: 300,
        aspectRatio: 2,
        onPageChanged: (_) {},
        items: list,
      ),
    );
  }

  Widget categoryBlock(BuildContext context, List<CategoryResponse> categories,
          HomeNotifier notifier, DB db) =>
      Container(
        margin: EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
        child: ListView.builder(
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int i) {
            return InkWell(
              onTap: () {
                categories[i].subCategoryCount == 0 ?
                context.read(homeTabsProvider.notifier).showScreen(ProductList(
                    categories[i].id ?? '', categories[i].imageUrl ?? ''))
                    : context.read(homeTabsProvider.notifier).showScreen(SubCategoryScreen(
                    categories[i].menuId ?? ''));
              },
              child: restaurantInfoCard(
                context,
                categories[i].title,
                categories[i].imageUrl,
              ),
            );
          },
        ),
      );

  Widget categoryListGrid(BuildContext context,
          List<CategoryResponse> categories, HomeNotifier notifier, DB db) =>
      GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 6),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            childAspectRatio: MediaQuery.of(context).size.width / 350),
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              categories[i].subCategoryCount == 0 ?
              context.read(homeTabsProvider.notifier).showScreen(
                    ProductList(
                        categories[i].id ?? '', categories[i].imageUrl ?? ''),
                  ) : context.read(homeTabsProvider.notifier).showScreen(SubCategoryScreen(
                  categories[i].menuId ?? ''));
            },
            child: restaurantInfoCardGrid(
              context,
              categories[i].title ?? '',
              categories[i].imageUrl ?? '',
            ),
          );
        },
      );
}
