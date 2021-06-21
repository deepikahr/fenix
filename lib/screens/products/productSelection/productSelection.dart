import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/database/db.dart';
import 'package:restaurant_saas/models/api_response_models/add_on_category/add_on_category.dart';
import 'package:restaurant_saas/models/api_response_models/add_on_item/add_on_item.dart';
import 'package:restaurant_saas/models/api_response_models/variant/variant.dart';
import 'package:restaurant_saas/providers/providers.dart';
import 'package:restaurant_saas/screens/checkout/cart_screen/cart_screen.dart';
import 'package:restaurant_saas/screens/products/productSelection/shimmerProductSelection.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/appbar.dart';
import 'package:restaurant_saas/widgets/buttons.dart';
import 'package:restaurant_saas/widgets/card.dart';
import 'package:restaurant_saas/widgets/normalText.dart';

final db = DB();

class ProductSizeSelection extends HookWidget {
  final String productId;

  ProductSizeSelection(
    this.productId,
  );

  @override
  Widget build(BuildContext context) {
    final state = useProvider(productSizeProvider);
    final notifier = useProvider(productSizeProvider.notifier);
    final isMounted = useIsMounted();
    final cartCount = useProvider(cartProvider)?.cartCount;

    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () {
          notifier.fetchProductDetails(productId);
        });
      }
      return;
    }, const []);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: titleAppbarWithCart(context, 'CUSTOMIZE'.tr, cartCount, () {
          Get.to(() => CartScreen(backButton: true));
        }),
        body: Stack(fit: StackFit.expand, children: [
          if (!state.isLoading)
            ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
              Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.only(bottom: 8),
                height: 65,
                color: Colors.white,
                child: Row(
                  children: [
                    categoryTabButton(context, 'SIZE'.tr, () {
                      context
                          .read(productSizeProvider.notifier)
                          .onSizeTabSelect();
                    }, state.showSizeTab),
                    SizedBox(
                      width: 6,
                    ),
                    categoryTabButton(context, 'EXTRA'.tr, () {
                      context
                          .read(productSizeProvider.notifier)
                          .onExtraTabSelect();
                    }, state.showExtraTab),
                  ],
                ),
              ),
              productTitleCard(
                context,
                state.productDetails?.productName ?? '',
                state.productDetails?.restaurantName,
                state.productDetails?.franchiseName,
                state.productDetails?.averageRating ?? 0,
                state.productDetails?.preparationTime,
                state.leastPrice,
                state.highestPrice,
                state.productDetails?.isVeg,
                state.currencySymbol,
              ),
              state.showSizeTab
                  ? Column(
                      children: [
                        greyDivider(context),
                        sizeBlock(context, state.groupValue,
                            state.productDetails?.variants ?? [], state),
                      ],
                    )
                  : Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: dottedLine(
                              context, darkLight3.withOpacity(0.2), 12),
                        ),
                        sizeBlockExtra(context,
                            state.productDetails!.variants[state.groupValue],
                            () {
                          context
                              .read(productSizeProvider.notifier)
                              .onSizeTabSelect();
                          context
                              .read(productSizeProvider.notifier)
                              .removeAllAddOnItem();
                        }),
                        greyDivider(context),
                        optionBlockExtra(
                            state.productDetails?.addOnCategories ?? [],
                            state.selectedAddOnItems,
                            state),
                      ],
                    )
            ]),
          if (!state.isLoading)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: totalRow(context, 'TOTAL'.tr,
                      '${state.currencySymbol}${calculateTotal(state.selectedAddOnItems!, state.productDetails!.variants[state.groupValue])}')),
            ),
          if (state.isLoading)
            Container(
              color: Colors.white,
              child: shimmerProductSelection(),
            )
        ]),
        bottomNavigationBar: !state.isLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: primaryBlockSigleTextButton(
                        context,
                        'BUY_NOW'.tr,
                        () async {
                          await notifier.saveCart(
                            context,
                            state.selectedAddOnItems,
                            state.productDetails!.variants[state.groupValue],
                            'BUYNOW',
                            state.productDetails!,
                            productId,
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: primaryBlockSigleTextButton(
                        context,
                        'ADD_TO_CART'.tr,
                        () async {
                          await notifier.saveCart(
                            context,
                            state.selectedAddOnItems,
                            state.productDetails!.variants[state.groupValue],
                            'ADDTOCART',
                            state.productDetails!,
                            productId,
                          );
                        },
                      ),
                    ),
                  )
                ],
              )
            : Container(height: 1));
  }

  double? calculateTotal(
      Set<AddOnItem> selectedAddOnItems, Variant selectedVariant) {
    var addOnItemsPrice = .0;
    if (selectedAddOnItems.isNotEmpty) {
      addOnItemsPrice =
          selectedAddOnItems.map((value) => value.addOnItemPrice).reduce(
                    (_, __) => _! + __!,
                  ) ??
              .0;
    }

    final totalPrice = selectedVariant.price! + addOnItemsPrice;
    return totalPrice;
  }

  Widget sizeBlockExtra(
      context, Variant selectedVariant, Function() changeVariant) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleTextDarkLightSmallBR(context, 'SIZE'.tr),
              SizedBox(height: 4),
              Text(
                selectedVariant.sizeName!,
                style: textDarkLight2SmallBR(context).copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          flatPrimaryUnderlineButton(context, 'CHANGE'.tr, changeVariant),
        ],
      ),
    );
  }

  Widget optionBlockExtra(List<AddOnCategory> categoryList,
      Set<AddOnItem>? selectedAddOnItems, state) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: categoryList.length,
          itemBuilder: (BuildContext context, int index) {
            final addOnItems = categoryList[index].addOnItems;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleTextDark17RegularBR(
                  context,
                  categoryList[index].addOnCategoryName,
                ),
                ListView.builder(
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: addOnItems.length,
                    itemBuilder: (BuildContext context, int i) {
                      return CheckboxListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.trailing,
                        activeColor: green,
                        value: selectedAddOnItems!.contains(addOnItems[i]),
                        title: titleTextDarkLightSmallBR(
                          context,
                          '${addOnItems[i].addOnItemName} - ${state.currencySymbol}${addOnItems[i].addOnItemPrice}',
                        ),
                        onChanged: (value) {
                          if (value!) {
                            context
                                .read(productSizeProvider.notifier)
                                .addSelectedAddOnItem(addOnItems[i]);
                          } else {
                            context
                                .read(productSizeProvider.notifier)
                                .removeAddOnItem(addOnItems[i]);
                          }
                        },
                      );
                    }),
                dottedLine(context, darkLight3.withOpacity(0.2), 12),
              ],
            );
          }),
    );
  }

  Widget sizeBlock(context, int groupValue, List<Variant> variants, state) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleTextDark17RegularBR(context, 'CHOOSE_SIZE'.tr),
          ListView.builder(
            physics: ScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: variants.length,
            itemBuilder: (BuildContext context, int i) {
              return RadioListTile(
                dense: true,
                controlAffinity: ListTileControlAffinity.trailing,
                activeColor: green,
                value: i,
                groupValue: groupValue,
                title: titleTextDarkLightSmallBR(
                  context,
                  '${variants[i].sizeName} - ${state.currencySymbol}${variants[i].price}',
                ),
                onChanged: (dynamic value) {
                  context
                      .read(productSizeProvider.notifier)
                      .onSizeSelect(value);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
