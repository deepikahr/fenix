import 'dart:async';

import 'package:fenix_user/common/utils.dart';
import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/category_response/category_response.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/category/category_state_notifier.dart';
import 'package:fenix_user/screens/product/product_list/product_list.dart';
import 'package:fenix_user/screens/sub_category/sub_category.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

enum CATEGORY_TYPE {
  @JsonValue('BEVERAGE_CATEGORY')
  beverageCategory,
  @JsonValue('FOOD_CATEGORY')
  foodCategory,
}

class CategoryScreen extends HookWidget {
  final CATEGORY_TYPE categoryType;

  CategoryScreen(Key key, this.categoryType) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = useProvider(categoryProvider);
    final notifier = useProvider(categoryProvider.notifier);
    final isMounted = useIsMounted();

    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () async {
          await notifier.fetchCategory(categoryType, true);
        });
      }
      return;
    }, const []);

    return Container(
      color: light,
      child: Stack(
        children: [
          if (!state.isLoading && state.total == 0)
            Center(
              child: Text('NO_ITEMS'.tr),
            ),
          ListView(
            padding: EdgeInsets.symmetric(vertical: 16),
            shrinkWrap: true,
            physics: ScrollPhysics(),
            children: [
              if (state.category.length > 0)
                DB().getType() == 'LIST'
                    ? categoryBlock(
                        context, state.category, notifier, state.pageNumber)
                    : categoryListGrid(
                        context, state.category, notifier, state.pageNumber),
              Container(
                height: 45,
              ),
            ],
          ),
          if (state.isLoading) GFLoader(type: GFLoaderType.ios)
        ],
      ),
    );
  }

  Widget categoryBlock(BuildContext context, List<CategoryResponse>? category,
      CategoryStateNotifier notifier, pageNumber) {
    return Container(
      margin: EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
      child: ListView.builder(
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: category!.length,
          itemBuilder: (BuildContext context, int i) {
            handleScrollWithIndex(
              i,
              pageNumber,
              () => notifier.fetchCategory(categoryType),
            );
            return InkWell(
              onTap: () {
                category[i].subCategoryCount == 0
                    ? context
                        .read(homeTabsProvider.notifier)
                        .showScreen(ProductList(
                          category[i].id ?? '',
                          category[i].imageUrl ?? '',
                        ))
                    : context.read(homeTabsProvider.notifier).showScreen(
                        SubCategoryScreen(
                            category[i].id ?? '', category[i].title ?? ''));
              },
              child: restaurantInfoCard(
                context,
                category[i].title,
                category[i].imageUrl,
              ),
            );
          }),
    );
  }

  Widget categoryListGrid(BuildContext context, List<CategoryResponse> category,
          CategoryStateNotifier notifier, pageNumber) =>
      GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: category.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            childAspectRatio: MediaQuery.of(context).size.width / 500),
        itemBuilder: (context, i) {
          handleScrollWithIndex(
              i, pageNumber, () => notifier.fetchCategory(categoryType),
              pageLimit: 8);
          return InkWell(
              onTap: () {
                category[i].subCategoryCount == 0
                    ? context
                        .read(homeTabsProvider.notifier)
                        .showScreen(ProductList(
                          category[i].id ?? '',
                          category[i].imageUrl ?? '',
                        ))
                    : context.read(homeTabsProvider.notifier).showScreen(
                        SubCategoryScreen(
                            category[i].id ?? '', category[i].title ?? ''));
              },
              child: restaurantInfoCardGrid(
                context,
                category[i].title,
                category[i].imageUrl,
              ));
        },
      );
}
