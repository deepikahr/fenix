import 'dart:async';

import 'package:fenix_user/common/utils.dart';
import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/category_response/category_response.dart';
import 'package:fenix_user/models/api_response_models/sub_category_response/sub_category_response.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/product/product_list/product_list.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:get/get.dart';

class SubCategoryScreen extends HookWidget {
  final String categoryId;
  final String categoryTitle;

  SubCategoryScreen(this.categoryId, this.categoryTitle, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = useProvider(subCategoryProvider);
    final notifier = useProvider(subCategoryProvider.notifier);
    final isMounted = useIsMounted();

    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () async {
          await notifier.fetchSubCategory(categoryId);
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
                subCategoryList(context, categoryTitle),
              if ((state.subCategory?.length ?? 0) > 0)
                DB().getType() == 'list'
                    ? subCategoryBlock(
                    context, state.subCategory, notifier, state.pageNumber)
                    : subCategoryListGrid(
                    context, state.subCategory, notifier, state.pageNumber),
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

  Widget subCategoryList(context, String? subCategory) => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Padding(
        padding: const EdgeInsets.only(right: 15.0, bottom: 16),
        child: Text(
          subCategory ?? '',
          style: textDarkRegularBS(context),
        ),
      )
    ],
  );

  Widget subCategoryBlock(BuildContext context, List<SubCategoryResponse>? subCategory,
      notifier, pageNumber) {
    return Container(
      margin: EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
      child: ListView.builder(
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: subCategory!.length,
          itemBuilder: (BuildContext context, int i) {
            handleScrollWithIndex(
                i, pageNumber, () => notifier.fetch(categoryId));
            return InkWell(
              onTap: () {
                context.read(homeTabsProvider.notifier).showScreen(ProductList(
                  subCategory[i].id ?? '',
                  subCategory[i].imageUrl ?? '',
                ));
              },
              child: restaurantInfoCard(
                context,
                subCategory[i].title,
                subCategory[i].imageUrl,
              ),
            );
          }),
    );
  }

  Widget subCategoryListGrid(BuildContext context,
      List<SubCategoryResponse>? subCategory, notifier, pageNumber) =>
      GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: subCategory!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            childAspectRatio: MediaQuery.of(context).size.width / 500),
        itemBuilder: (context, i) {
          handleScrollWithIndex(
            i,
            pageNumber,
                () => notifier.fetch(categoryId),
          );
          return InkWell(
              onTap: () {
                context.read(homeTabsProvider.notifier).showScreen(ProductList(
                  subCategory[i].id ?? '',
                  subCategory[i].imageUrl ?? '',
                ));
              },
              child: restaurantInfoCardGrid(
                context,
                subCategory[i].title,
                subCategory[i].imageUrl,
              ));
        },
      );
}
