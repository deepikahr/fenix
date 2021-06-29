import 'package:fenix_user/models/api_response_models/banner_response/banner_response.dart';
import 'package:fenix_user/models/api_response_models/category_response/category_response.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/product/product_list/productList.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import '../../../database/db.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final db = DB();

class Home extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final state = useProvider(homeProvider);
    final isMounted = useIsMounted();

    useEffect(() {
      Future.delayed(Duration.zero, () async {
        if (isMounted()) {
          await context.read(homeProvider.notifier).fetchHome();
        }
      });
      return;
    }, const []);

    return Scaffold(
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
                if ((state.homeData?.category.length ?? 0) > 0)
                  categoryBlock(context, state.homeData?.category),
              ],
            ),
            if (state.isLoading) GFLoader()
          ],
        ),
      ),
    );
  }

  Widget bannerBlock(BuildContext context, List<BannerResponse>? banners) {
    var list = banners!.map(
      (banner) {
        return InkWell(
          onTap: () {},
          child: carouselCard(
            context,
            banner.image!.imageUrl,
            banner.title,
            'banner.description',
            'ORDER_NOW'.tr,
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
          items: list),
    );
  }

  Widget categoryBlock(BuildContext context, List<CategoryResponse>? category) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 8, left: 12, right: 12, bottom: 8),
      // padding: EdgeInsets.symmetric(vertical: 1),
      child: ListView.separated(
          separatorBuilder: (_, __) => Divider(
                thickness: .3,
                color: Colors.black12,
                indent: 16,
                endIndent: 16,
                height: 30,
              ),
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: category!.length,
          itemBuilder: (BuildContext context, int i) {
            return InkWell(
              onTap: () {
                Get.to(() => ProductList(categoryId: category[i].id));
              },
              child: restaurantInfoCard(context, category[i].title, category[i].imageUrl),
            );
          }),
    );
  }
}
