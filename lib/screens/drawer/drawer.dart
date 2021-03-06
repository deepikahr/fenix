import 'package:fenix_user/common/constant.dart';
import 'package:fenix_user/models/api_response_models/category_response/category_response.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/auth/access_setting/access_setting.dart';
import 'package:fenix_user/screens/product/product_list/product_list.dart';
import 'package:fenix_user/screens/sub_category/sub_category.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/normalText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DrawerPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final state = useProvider(drawerProvider);
    final notifier = useProvider(drawerProvider.notifier);
    final isMounted = useIsMounted();

    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () async {
          await notifier.fetchHome();
        });
      }
      return;
    }, const []);

    return Container(
      child: Drawer(
          child: ListView(
        children: [
          Container(
            alignment: AlignmentDirectional.center,
            width: MediaQuery.of(context).size.width,
            height: 110,
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            decoration: new BoxDecoration(
                color: secondary1,
                boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 20)]),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => AccessSettings());
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: primary(),
                        borderRadius: BorderRadius.circular(12)),
                    child: Icon(
                      Icons.settings,
                      color: secondary1,
                      size: 40,
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      titleTextDarkRegularBW(
                          context,
                          notifier.db.getRestaurantName() ??
                              Constants.restaurantName),
                      titleTextDarkRegularBW17(
                          context,
                          notifier.db.getAddress() ??
                              Constants.restaurantAddress),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if ((state.homeData?.category.length ?? 0) > 0) ...[
            categoryBlock(context, state.homeData?.category),
            Divider()
          ],
          // InkWell(
          //   onTap: () {
          //     Get.to(() => ChangePasswordPage());
          //   },
          //   child: Container(
          //     width: double.maxFinite,
          //     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          //     child: titleTextDarkRegularBB20(context, 'CHANGE_PASSCODE'.tr),
          //   ),
          // ),
          // Divider(),
          // InkWell(
          //   onTap: () {
          //     if (DB().isLoggedIn()) {
          //       notifier.logout();
          //     } else {
          //       Get.to(() => LoginPage());
          //     }
          //   },
          //   child: Container(
          //     width: double.maxFinite,
          //     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          //     child: titleTextDarkRegularBB20(
          //         context, DB().isLoggedIn() ? 'LOGOUT'.tr : 'LOGIN'.tr),
          //   ),
          // ),
          // Divider(),
        ],
      )),
    );
  }

  Widget categoryBlock(BuildContext context, List<CategoryResponse>? category) {
    return ListView.separated(
      physics: ScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: category!.length,
      itemBuilder: (BuildContext context, int i) {
        return InkWell(
          onTap: () {
            Get.back();
            category[i].subCategoryCount == 0
                ? context
                    .read(homeTabsProvider.notifier)
                    .showScreen(ProductList(
                      category[i].id ?? '',
                      category[i].imageUrl ?? '',
                      key: UniqueKey(),
                    ))
                : context.read(homeTabsProvider.notifier).showScreen(
                    SubCategoryScreen(
                        category[i].id ?? '', category[i].title ?? ''));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: titleTextDarkRegularBB20(context, category[i].title),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
    );
  }
}
