import 'dart:async';

import 'package:fenix_user/common/constant.dart';
import 'package:fenix_user/models/api_response_models/add_on_category/add_on_category.dart';
import 'package:fenix_user/models/api_response_models/add_on_item/add_on_item.dart';
import 'package:fenix_user/models/api_response_models/product_details_response/product_details_response.dart';
import 'package:fenix_user/models/api_response_models/variant_response/variant_response.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/product/product_details/product_details_notifier.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/counterBox.dart';
import 'package:fenix_user/widgets/network_image.dart';
import 'package:fenix_user/widgets/normalText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sticky_headers/sticky_headers.dart';

import 'product_details_state.dart';

class ProductDetails extends HookWidget {
  final String productId;

  ProductDetails(this.productId);

  @override
  Widget build(BuildContext context) {
    final noteEditController = useTextEditingController();
    final state = useProvider(productDetailsProvider);
    final notifier = useProvider(productDetailsProvider.notifier);
    final isMounted = useIsMounted();
    final noteFocusNode = useFocusNode();

    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () async {
          final res = await notifier.fetchProductDetails(productId);
          if (res != null) {
            final cartProduct = notifier
                .getProductFromCartWithSameVariantOrLastUsedVariant(res);
            if (cartProduct != null) {
              notifier.updateProductWithCartProduct(cartProduct);
            }
          }
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
              if (!state.isLoading && state.productDetails != null)
                productData(
                  context,
                  state.productDetails!,
                  state,
                  notifier,
                  noteEditController,
                  noteFocusNode,
                ),
            ],
          ),
          if (state.isLoading) GFLoader(type: GFLoaderType.ios)
        ],
      ),
    );
  }

  Widget productData(
    BuildContext context,
    ProductDetailsResponse product,
    ProductDetailsState state,
    ProductDetailsNotifier notifier,
    TextEditingController noteEditController,
    FocusNode noteFocusNode,
  ) {
    return ListView(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
      children: [
        product.productImage!.imageUrl != null
            ? Stack(
                children: [
                  networkImage(product.productImage!.imageUrl!,
                      MediaQuery.of(context).size.width, 240, 0),
                  Positioned(
                      top: 0,
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Image.asset(
                            'lib/assets/images/b2.png',
                            scale: 1,
                            color: primary(),
                          ),
                          Text(
                            '${product.tags!.first.title}',
                            style: textDarkRegularBSW(context),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                  Positioned(
                      bottom: 0,
                      child: Container(
                        color: darkLight,
                        padding: EdgeInsets.all(4),
                        child: Text(
                          '${product.variants[state.groupValue].sizeName}',
                          style: textDarkRegularBSW(context),
                          textAlign: TextAlign.center,
                        ),
                      )),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Image.asset(
                        'lib/assets/images/b2.png',
                        scale: 1,
                        color: primary(),
                      ),
                      Text(
                        '${product.tags?.first.title}',
                        style: textDarkRegularBSW(context),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Container(
                    color: darkLight,
                    padding: EdgeInsets.all(4),
                    child: Text(
                      '${product.variants[state.groupValue].sizeName}',
                      style: textDarkRegularBSW(context),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
        StickyHeader(
          header: Container(
            color: white,
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: titleTextDarkRegularBR(
                            context, '${product.productName}')),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                HtmlWidget(
                  product.productDescription!,
                  textStyle: textDarkLightSmallBR(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${((product.variants[state.groupValue].price) + ((state.selectedAddOnItems!.toList().isNotEmpty) ? state.selectedAddOnItems!.toList().map((saot) => ((saot.addOnItemPrice ?? 0) * saot.quantity)).reduce((_, __) => _ + __) : 0)).toStringAsFixed(2)}${Constants.currency}',
                      style: textDarkRegularBS(context),
                    ),
                    !state.showAddButton
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              counterIcon(
                                'remove',
                                () {
                                  if (product.isSameProductMultipleTime ==
                                      true) {
                                    showDialog(
                                        context: context,
                                        builder: (context) =>
                                            showMultipleTimeProductPopUp(
                                              context,
                                            ));
                                  } else {
                                    notifier.addProduct(product, false);
                                  }
                                },
                              ),
                              Text('${product.variantQuantity}',
                                  style: textBlackLargeBM(context)),
                              counterIcon(
                                'add',
                                () async {
                                  // if (product.isCustomizable) {
                                  //   await showDialog(
                                  //       context: context,
                                  //       builder: (context) => showPopUp(
                                  //             context,
                                  //             product,
                                  //             () async {
                                  //               Get.back();
                                  //               await notifier.addProduct(
                                  //                 product,
                                  //                 true,
                                  //               );
                                  //             },
                                  //           ));
                                  // } else {
                                  await notifier.addProduct(product, true);
                                  // }
                                },
                              ),
                            ],
                          )
                        : Container(
                            width: 100,
                            child: GFButton(
                              elevation: 3,
                              size: GFSize.LARGE,
                              borderShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              onPressed: () async {
                                context
                                    .read(productDetailsProvider.notifier)
                                    .showAddButton(true);
                                await notifier.addProduct(product, true);
                              },
                              color: primary(),
                              text: 'ADD'.tr,
                              textStyle: textLightLargeBM(context),
                            ),
                          ),
                  ],
                ),
              ],
            ),
          ),
          content: ListView(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 12,
              ),
              allergenList(context, product.allergens ?? []),
              sizeBlock(context, state.groupValue, product.variants, state),
              optionBlockExtra(state.productDetails?.addOnItems ?? [],
                  state.selectedAddOnItems, state),
              SizedBox(
                height: 4,
              ),
              titleTextDark17RegularBR(
                context,
                'INSTRUCTIONS'.tr,
              ),
              SizedBox(
                height: 8,
              ),
              noteTextField(
                context,
                noteEditController,
                noteFocusNode,
                (value) {
                  FocusScope.of(context).unfocus();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget noteTextField(
    BuildContext context,
    controller,
    FocusNode focusNode,
    ValueChanged<String> onFieldSubmitted,
  ) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: controller,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      maxLines: 5,
      decoration: InputDecoration(
        fillColor: Colors.white,
        labelStyle: textDarkLightSmallBR(context),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black26, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black26, width: 1.0),
        ),
      ),
    );
  }

  Widget allergenList(context, List<String> allergens) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        titleTextDark17RegularBR(
          context,
          'ALLERGENS'.tr,
        ),
        Container(
          alignment: AlignmentDirectional.topStart,
          height: 85,
          child: ListView.builder(
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: allergens.length,
              itemBuilder: (BuildContext context, int i) {
                return Column(
                  children: [
                    Image.asset(
                      'lib/assets/images/p3.png',
                      width: 50,
                      height: 50,
                    ),
                    Text(
                      allergens[i],
                      style: textDarkRegularBM10(context),
                    ),
                  ],
                );
              }),
        ),
      ],
    );
  }

  Widget sizeBlock(
      context, int groupValue, List<VariantResponse> variants, state) {
    return Container(
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
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: green,
                value: i,
                groupValue: groupValue,
                title: Row(
                  children: [
                    Text('${variants[i].sizeName} -  ',
                        style: textDarkRegularBR(context)),
                    Text('${variants[i].price}${Constants.currency}',
                        style: textBlackLargeBM(context)),
                  ],
                ),
                onChanged: (dynamic value) {
                  context
                      .read(productDetailsProvider.notifier)
                      .onSizeSelect(value);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  AddOnItem? estateSelected;

  Widget optionBlockExtra(List<AddOnCategory> addOnCategory,
      Set<AddOnItem>? selectedAddOnItems, state) {
    return Container(
      child: ListView.builder(
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: addOnCategory.length,
          itemBuilder: (BuildContext context, int index) {
            final addOnItems = addOnCategory[index].addOnItems;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleTextDark17RegularBR(
                  context,
                  addOnCategory[index].addOnCategoryName,
                ),
                ListView.builder(
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: addOnItems.length,
                    itemBuilder: (BuildContext context, int i) {
                      return ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        leading: Checkbox(
                          activeColor: green,
                          value: selectedAddOnItems!
                                  .toList()
                                  .singleWhere(
                                      (element) =>
                                          element.id == addOnItems[i].id,
                                      orElse: () => AddOnItem())
                                  .id !=
                              null,
                          onChanged: (value) {
                            if (value!) {
                              context
                                  .read(productDetailsProvider.notifier)
                                  .addSelectedAddOnItem(
                                      addOnItems[i], addOnCategory[index]);
                            } else {
                              context
                                  .read(productDetailsProvider.notifier)
                                  .removeAddOnItem(addOnItems[i]);
                            }
                          },
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text('${addOnItems[i].addOnItemName} - ',
                                    style: textDarkRegularBR(context)),
                                Text(
                                    '${addOnItems[i].addOnItemPrice}${Constants.currency}',
                                    style: textBlackLargeBM(context)),
                              ],
                            ),
                            selectedAddOnItems
                                        .toList()
                                        .singleWhere(
                                            (element) =>
                                                element.id == addOnItems[i].id,
                                            orElse: () => AddOnItem())
                                        .id !=
                                    null
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      counterIcon(
                                        'remove',
                                        () {
                                          context
                                              .read(productDetailsProvider
                                                  .notifier)
                                              .updateAddonItemQuantity(
                                                  addOnItems[i], false);
                                        },
                                      ),
                                      Text(
                                          selectedAddOnItems
                                              .toList()
                                              .singleWhere(
                                                  (element) =>
                                                      element.id ==
                                                      addOnItems[i].id,
                                                  orElse: () => AddOnItem())
                                              .quantity
                                              .toString(),
                                          style: textBlackLargeBM(context)),
                                      counterIcon(
                                        'add',
                                        () async {
                                          context
                                              .read(productDetailsProvider
                                                  .notifier)
                                              .updateAddonItemQuantity(
                                                  addOnItems[i], true);
                                        },
                                      ),
                                    ],
                                  )
                                : Container(),
                          ],
                        ),
                      );
                    }),
                dottedLine(context, darkLight3.withOpacity(0.2), 12),
              ],
            );
          }),
    );
  }

  Widget showMultipleTimeProductPopUp(
    BuildContext context,
  ) {
    return Dialog(
      child: Container(
        height: 165,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${'MULTIPLE_SAME_PRODUCTS_IN_CART'.tr}',
              style: textBlackLargeBM(context),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                    child: GFButton(
                  blockButton: true,
                  size: GFSize.LARGE,
                  color: primary(),
                  type: GFButtonType.outline,
                  onPressed: () => Get.back(),
                  child: Text(
                    'CANCEL'.tr.toUpperCase(),
                    style: textPrimarySmallBM(context),
                    textAlign: TextAlign.center,
                  ),
                )),
                SizedBox(width: 10),
                Expanded(
                    child: GFButton(
                  blockButton: true,
                  size: GFSize.LARGE,
                  color: GFColors.DARK,
                  type: GFButtonType.outline,
                  onPressed: () async {
                    Get.back();
                    // context
                    // .read(productDetailsProvider.notifier)
                    // .updateQuantity();
                  },
                  child: Text(
                    'CART'.tr.toUpperCase(),
                    style: textBlackSmallBM(context),
                    textAlign: TextAlign.center,
                  ),
                )),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget showPopUp(
    BuildContext context,
    ProductDetailsResponse product,
    Function() onRepeat,
  ) {
    return Dialog(
      child: Container(
        height: 165,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${'HOW_YOU_LIKE_TO_CUSTOMIZE_?'.tr}',
              style: textBlackLargeBM(context),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                    child: GFButton(
                  blockButton: true,
                  size: GFSize.LARGE,
                  color: primary(),
                  type: GFButtonType.outline,
                  onPressed: onRepeat,
                  child: Text(
                    'REPEAT_LAST'.tr.toUpperCase(),
                    style: textPrimarySmallBM(context),
                    textAlign: TextAlign.center,
                  ),
                )),
                SizedBox(width: 10),
                Expanded(
                    child: GFButton(
                  blockButton: true,
                  size: GFSize.LARGE,
                  color: GFColors.DARK,
                  type: GFButtonType.outline,
                  onPressed: () async {
                    context
                        .read(productDetailsProvider.notifier)
                        .showAddButton(false);
                    Get.back();
                  },
                  child: Text(
                    'NEW'.tr.toUpperCase(),
                    style: textBlackSmallBM(context),
                    textAlign: TextAlign.center,
                  ),
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
