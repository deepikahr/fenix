import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import '../../../database/db.dart';

final db = DB();

class Home extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // final state = useProvider(homeProvider);
    final isMounted = useIsMounted();
    final items = <String>[
      'red',
      'blue',
      'black',
      'Idiomos',
    ];
    String selectedItem = 'Idiomos';
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    // useEffect(() {
    //   Future.delayed(Duration.zero, () async {
    //     if (isMounted()) {
    //       await context.read(homeProvider.notifier).fetchHomeData(6, 1);
    //     }
    //   });
    //   return;
    // }, const []);

    return Scaffold(
      body: Container(
        color: light,
        child: ListView(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            children: [
              // homeButtonRow(context, items, (String? string) =>
              //     useState(() => selectedItem = string!), selectedItem),
              // if ((state.homeData?.banners.length ?? 0) > 0)
              bannerBlock(context),
              // // if ((state.homeData?.nearByRestaurants.length ?? 0) > 0)
              nearByYouBlock(context),
            ],
          ),
      ),
    );
  }

  Widget bannerBlock(BuildContext context,) {
   List banners = ['https://images.pexels.com/photos/2899097/pexels-photo-2899097.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'];
    var list = banners.map(
          (banner) {
        return InkWell(
          onTap: () {

          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: carouselCard(
              context,
              'https://images.pexels.com/photos/2899097/pexels-photo-2899097.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
              'banner.title',
              'banner.description',
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
        items: list
      ),
    );
  }

  Widget nearByYouBlock(
      BuildContext context,) {
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
                itemCount: 3,
                itemBuilder: (BuildContext context, int i) {
                  return InkWell(
                    onTap: () {
                      // Get.to(() => RestaurantScreen(
                      //   // restaurants![i].id!, restaurants[i].vendor!
                      // ));
                    },
                    child: restaurantInfoCard(
                      context,
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }


}
