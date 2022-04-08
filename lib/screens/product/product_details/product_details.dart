import 'dart:async';
import 'package:fenix_user/common/allergen_images.dart';
import 'package:fenix_user/common/constant.dart';
import 'package:fenix_user/models/api_response_models/add_on_category/add_on_category.dart';
import 'package:fenix_user/models/api_response_models/add_on_item/add_on_item.dart';
import 'package:fenix_user/models/api_response_models/product_details_response/product_details_response.dart';
import 'package:fenix_user/models/api_response_models/variant_response/variant_response.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/cart_screen/cart_screen.dart';
import 'package:fenix_user/widgets/arrow_pointed_to_cart.widget.dart';
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

import '../../../widgets/alertBox.dart';
import 'product_details_state.dart';

// ignore: must_be_immutable
class ProductDetails extends HookWidget {
  final String productId;

  ProductDetails(this.productId);

  @override
  Widget build(BuildContext context) {
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

    return Stack(
      children: [
        Container(
          color: grey2,
          child: Stack(
            children: [
              ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                padding:
                    EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
                children: [
                  if (!state.isLoading && state.productDetails != null)
                    state.productDetails!.productImage!.imageUrl != null
                        ? Stack(
                            children: [
                              networkImageWithWidth(
                                  state.productDetails!.productImage!.imageUrl!,
                                  MediaQuery.of(context).size.width - 32,
                                  0),
                              if (state.productDetails?.tags?.isNotEmpty ??
                                  false)
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
                                        '${state.productDetails!.tags!.first.title}',
                                        style: textDarkRegularBSW(context),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              if (state.productDetails!
                                      .variants[state.groupValue].sizeName !=
                                  null)
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    color: darkLight,
                                    padding: EdgeInsets.all(4),
                                    child: Text(
                                      '${state.productDetails!.variants[state.groupValue].sizeName ?? ''}',
                                      style: textDarkRegularBSW(context),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (state.productDetails?.tags?.isNotEmpty ??
                                  false)
                                Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    Image.asset(
                                      'lib/assets/images/b2.png',
                                      scale: 1,
                                      color: primary(),
                                    ),
                                    Text(
                                      '${state.productDetails?.tags?.first.title}',
                                      style: textDarkRegularBSW(context),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              if (state.productDetails?.tags?.isEmpty ?? true)
                                const Spacer(),
                              if (state.productDetails!
                                      .variants[state.groupValue].sizeName !=
                                  null)
                                Container(
                                  color: darkLight,
                                  padding: EdgeInsets.all(4),
                                  child: Text(
                                    '${state.productDetails!.variants[state.groupValue].sizeName ?? ''}',
                                    style: textDarkRegularBSW(context),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                            ],
                          ),
                  if (!state.isLoading && state.productDetails != null)
                    productData(
                      context,
                      state.productDetails!,
                      state,
                      notifier,
                      noteFocusNode,
                    ),
                  Container(
                    height: 45,
                  ),
                ],
              ),
              if (state.isLoading) GFLoader(type: GFLoaderType.ios),
              if (state.productAdded)
                Align(
                    alignment: Alignment.bottomCenter,
                    child: ArrowTowardsCart())
            ],
          ),
        ),
        Positioned(
          top: 20,
          right: 30,
          child: !state.showAddButton &&
                  notifier.getCurrentQuanityOfProduct(state.productDetails!) > 0
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (notifier
                            .getCurrentQuanityOfProduct(state.productDetails!) >
                        notifier.getLastOrderedQuantityOfProduct(
                            state.productDetails!))
                      counterIcon(
                        'REMOVE',
                        true,
                        () {
                          notifier.addProduct(
                            state.productDetails!,
                            false,
                          );
                        },
                      ),
                    Text(
                        '${state.productDetails!.modified ? state.productDetails!.modifiedQuantity ?? state.productDetails!.variantQuantity : state.productDetails!.variantQuantity}',
                        style: textBlackLargeBM(context)),
                    counterIcon(
                      'ADD',
                      true,
                      () async {
                        await notifier.addProduct(
                          state.productDetails!,
                          true,
                        );
                      },
                    ),
                  ],
                )
              : Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.white, width: 4)),
                  width: 110,
                  child: GFButton(
                    elevation: 3,
                    size: 50,
                    borderShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    onPressed: () async {
                      context
                          .read(productDetailsProvider.notifier)
                          .showAddButton(true);
                      if (state.productDetails != null &&
                          state.productDetails!.addOnItems!.isNotEmpty) {
                        bool isadd = false;
                        for (var element in state.productDetails!.addOnItems!) {
                          if (element.isRequired == true) {
                            final totalPreviousQuantity =
                                state.selectedAddOnItems!.isNotEmpty
                                    ? state.selectedAddOnItems
                                        ?.toList()
                                        .map((cp) => element.addOnCategoryId ==
                                                cp.addOnCategoryId
                                            ? cp.quantity
                                            : 0)
                                        .reduce((_, __) => _ + __)
                                    : 0;

                            if (totalPreviousQuantity != element.limitNumber) {
                              isadd = false;
                              customDialog(
                                status: DIALOG_STATUS.WARNING,
                                title: 'NOTE_SELECT_DAILOG'
                                    .tr
                                    .replaceAll(
                                      'NUMBER',
                                      '${element.limitNumber}',
                                    )
                                    .replaceAll(
                                      'CATEGORY_NAME',
                                      '${element.addOnCategoryName}',
                                    ),
                              );
                              break;
                            } else {
                              isadd = true;
                            }
                          } else {
                            isadd = true;
                          }
                        }
                        print(isadd);
                        if (isadd == true) {
                          await notifier.addProduct(
                            state.productDetails!,
                            true,
                          );
                        }
                      } else {
                        await notifier.addProduct(
                          state.productDetails!,
                          true,
                        );
                      }
                    },
                    color: primary(),
                    text: 'ADD'.tr,
                    textStyle: textLightLargeBM(context),
                  ),
                ),
        )
      ],
    );
  }

  Widget productData(
    BuildContext context,
    ProductDetailsResponse product,
    ProductDetailsState state,
    ProductDetailsNotifier notifier,
    FocusNode noteFocusNode,
  ) {
    return StickyHeader(
      header: Column(
        children: [
          Container(
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
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      content: ListView(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 12,
          ),
          if (product.allergens.isNotEmpty)
            allergenList(context, product.allergens),
          sizeBlock(context, state.groupValue, product.variants, state),
          dottedLine(context, darkLight3.withOpacity(0.2), 12),
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
            noteFocusNode,
            useTextEditingController(
                text: state.productDetails?.productInstructions),
            (value) {
              FocusScope.of(context).unfocus();
            },
            notifier.updateInstructions,
          ),
        ],
      ),
    );
  }

  Widget noteTextField(
    BuildContext context,
    FocusNode focusNode,
    TextEditingController controller,
    ValueChanged<String> onFieldSubmitted,
    ValueChanged<String> onChange,
  ) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: controller,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      maxLines: 5,
      onChanged: onChange,
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
          height: 100,
          child: ListView.builder(
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: allergens.length,
              itemBuilder: (BuildContext context, int i) {
                final image = LocalStoredAllergenImages()
                    .getImageForAllergen(allergens[i]);
                return Column(
                  children: [
                    if (image == null)
                      Image.asset(
                        'lib/assets/images/p3.png',
                        width: 50,
                        height: 50,
                      )
                    else
                      networkImageWithWidth(image, 50, 50),
                    Text(
                      allergens[i].tr,
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
                contentPadding: EdgeInsets.all(0),
                dense: true,
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: green,
                value: i,
                groupValue: groupValue,
                title: Row(
                  children: [
                    if (variants[i].sizeName != null)
                      Text('${variants[i].sizeName ?? ''} -  ',
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
                RichText(
                  text: TextSpan(
                    text: '${addOnCategory[index].addOnCategoryName} ' +
                        '${addOnCategory[index].limitNumber != null && addOnCategory[index].isRequired == true ? '(${'NOTE_SELECT'.tr.replaceAll('NUMBER', '${addOnCategory[index].limitNumber}')})' : ''}',
                    style: textDark17RegularBR(context),
                    children: <TextSpan>[
                      if (addOnCategory[index].isRequired == true)
                        TextSpan(
                            text: ' * ', style: textDark17RegularBRR(context)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListView.separated(
                    separatorBuilder: (__, _) {
                      return SizedBox(
                        height: 5,
                      );
                    },
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: addOnItems.length,
                    itemBuilder: (BuildContext context, int i) {
                      return Row(
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: blackN.withOpacity(0.60)),
                            ),
                            child: (addOnItems[i].imageUrl != null)
                                ? networkImageWithWidth(
                                    addOnItems[i].imageUrl!, 70, 70)
                                : Image.asset(
                                    'lib/assets/images/no_images.png',
                                    width: 70,
                                    height: 70,
                                  ),
                          ),
                          Expanded(
                            child: addOnCategory[index].addOnItems.length > 1
                                ? addOnCategory[index].selectionType ==
                                        SELECTION_TYPE.single
                                    ? RadioListTile(
                                        contentPadding: EdgeInsets.all(0),
                                        dense: true,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        activeColor: green,
                                        value: i,
                                        groupValue:
                                            addOnCategory[index].selectionValue,
                                        onChanged: (value) {
                                          if (addOnCategory[index]
                                                  .selectionValue !=
                                              i) {
                                            context
                                                .read(productDetailsProvider
                                                    .notifier)
                                                .addSelectedAddOnItemSingle(
                                                  addOnItems[i],
                                                  index,
                                                  i,
                                                );
                                          }
                                        },
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                    '${addOnItems[i].addOnItemName} - ',
                                                    style: textDarkRegularBR(
                                                        context)),
                                                Text(
                                                    '${addOnItems[i].addOnItemPrice}${Constants.currency}',
                                                    style: textBlackLargeBM(
                                                        context)),
                                              ],
                                            ),
                                            selectedAddOnItems!
                                                        .toList()
                                                        .singleWhere(
                                                            (element) =>
                                                                element.id ==
                                                                addOnItems[i]
                                                                    .id,
                                                            orElse: () =>
                                                                AddOnItem())
                                                        .id !=
                                                    null
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      counterIcon(
                                                        'REMOVE',
                                                        true,
                                                        () {
                                                          context
                                                              .read(
                                                                  productDetailsProvider
                                                                      .notifier)
                                                              .updateAddonItemQuantity(
                                                                  addOnItems[i],
                                                                  false);
                                                        },
                                                      ),
                                                      Text(
                                                          selectedAddOnItems
                                                              .toList()
                                                              .singleWhere(
                                                                  (element) =>
                                                                      element
                                                                          .id ==
                                                                      addOnItems[
                                                                              i]
                                                                          .id,
                                                                  orElse: () =>
                                                                      AddOnItem())
                                                              .quantity
                                                              .toString(),
                                                          style:
                                                              textBlackLargeBM(
                                                                  context)),
                                                      counterIcon(
                                                        'ADD',
                                                        selectedAddOnItems.map(
                                                                  (e) {
                                                                    return (e.addOnCategoryId ==
                                                                            addOnCategory[index].addOnCategoryId)
                                                                        ? e.quantity
                                                                        : 0;
                                                                  },
                                                                ).reduce((_,
                                                                        __) =>
                                                                    _ + __) !=
                                                                addOnCategory[
                                                                        index]
                                                                    .limitNumber
                                                            ? true
                                                            : false,
                                                        () async {
                                                          if (selectedAddOnItems
                                                                  .map(
                                                                (e) {
                                                                  return (e.addOnCategoryId ==
                                                                          addOnCategory[index]
                                                                              .addOnCategoryId)
                                                                      ? e.quantity
                                                                      : 0;
                                                                },
                                                              ).reduce((_,
                                                                          __) =>
                                                                      _ + __) !=
                                                              addOnCategory[
                                                                      index]
                                                                  .limitNumber) {
                                                            context
                                                                .read(productDetailsProvider
                                                                    .notifier)
                                                                .updateAddonItemQuantity(
                                                                    addOnItems[
                                                                        i],
                                                                    true);
                                                          }
                                                        },
                                                      ),
                                                    ],
                                                  )
                                                : Container(),
                                          ],
                                        ),
                                      )
                                    : ListTile(
                                        dense: true,
                                        contentPadding: EdgeInsets.zero,
                                        leading: Checkbox(
                                          activeColor: green,
                                          value: selectedAddOnItems!
                                                  .toList()
                                                  .singleWhere(
                                                      (element) =>
                                                          element.id ==
                                                          addOnItems[i].id,
                                                      orElse: () => AddOnItem())
                                                  .id !=
                                              null,
                                          onChanged: (value) {
                                            if (value!) {
                                              if (selectedAddOnItems
                                                  .isNotEmpty) {
                                                if (selectedAddOnItems.map(
                                                      (e) {
                                                        return (e.addOnCategoryId ==
                                                                addOnCategory[
                                                                        index]
                                                                    .addOnCategoryId)
                                                            ? e.quantity
                                                            : 0;
                                                      },
                                                    ).reduce(
                                                        (_, __) => _ + __) !=
                                                    addOnCategory[index]
                                                        .limitNumber) {
                                                  context
                                                      .read(
                                                          productDetailsProvider
                                                              .notifier)
                                                      .addSelectedAddOnItem(
                                                          addOnItems[i],
                                                          addOnCategory[index]);
                                                }
                                              } else {
                                                context
                                                    .read(productDetailsProvider
                                                        .notifier)
                                                    .addSelectedAddOnItem(
                                                        addOnItems[i],
                                                        addOnCategory[index]);
                                              }
                                            } else {
                                              context
                                                  .read(productDetailsProvider
                                                      .notifier)
                                                  .removeAddOnItem(
                                                      addOnItems[i]);
                                            }
                                          },
                                        ),
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                    '${addOnItems[i].addOnItemName} - ',
                                                    style: textDarkRegularBR(
                                                        context)),
                                                Text(
                                                    '${addOnItems[i].addOnItemPrice}${Constants.currency}',
                                                    style: textBlackLargeBM(
                                                        context)),
                                              ],
                                            ),
                                            selectedAddOnItems
                                                        .toList()
                                                        .singleWhere(
                                                            (element) =>
                                                                element.id ==
                                                                addOnItems[i]
                                                                    .id,
                                                            orElse: () =>
                                                                AddOnItem())
                                                        .id !=
                                                    null
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      counterIcon(
                                                        'REMOVE',
                                                        true,
                                                        () {
                                                          context
                                                              .read(
                                                                  productDetailsProvider
                                                                      .notifier)
                                                              .updateAddonItemQuantity(
                                                                  addOnItems[i],
                                                                  false);
                                                        },
                                                      ),
                                                      Text(
                                                          selectedAddOnItems
                                                              .toList()
                                                              .singleWhere(
                                                                  (element) =>
                                                                      element
                                                                          .id ==
                                                                      addOnItems[
                                                                              i]
                                                                          .id,
                                                                  orElse: () =>
                                                                      AddOnItem())
                                                              .quantity
                                                              .toString(),
                                                          style:
                                                              textBlackLargeBM(
                                                                  context)),
                                                      counterIcon(
                                                        'ADD',
                                                        selectedAddOnItems.map(
                                                                  (e) {
                                                                    return (e.addOnCategoryId ==
                                                                            addOnCategory[index].addOnCategoryId)
                                                                        ? e.quantity
                                                                        : 0;
                                                                  },
                                                                ).reduce((_,
                                                                        __) =>
                                                                    _ + __) !=
                                                                addOnCategory[
                                                                        index]
                                                                    .limitNumber
                                                            ? true
                                                            : false,
                                                        () async {
                                                          if (selectedAddOnItems
                                                                  .map(
                                                                (e) {
                                                                  return (e.addOnCategoryId ==
                                                                          addOnCategory[index]
                                                                              .addOnCategoryId)
                                                                      ? e.quantity
                                                                      : 0;
                                                                },
                                                              ).reduce((_,
                                                                          __) =>
                                                                      _ + __) !=
                                                              addOnCategory[
                                                                      index]
                                                                  .limitNumber) {
                                                            context
                                                                .read(productDetailsProvider
                                                                    .notifier)
                                                                .updateAddonItemQuantity(
                                                                    addOnItems[
                                                                        i],
                                                                    true);
                                                          }
                                                        },
                                                      ),
                                                    ],
                                                  )
                                                : Container(),
                                          ],
                                        ),
                                      )
                                : ListTile(
                                    dense: true,
                                    contentPadding: EdgeInsets.zero,
                                    leading: Checkbox(
                                      activeColor: green,
                                      value: selectedAddOnItems!
                                              .toList()
                                              .singleWhere(
                                                  (element) =>
                                                      element.id ==
                                                      addOnItems[i].id,
                                                  orElse: () => AddOnItem())
                                              .id !=
                                          null,
                                      onChanged: (value) {
                                        if (value!) {
                                          if (selectedAddOnItems.isNotEmpty) {
                                            if (selectedAddOnItems.map(
                                                  (e) {
                                                    return (e.addOnCategoryId ==
                                                            addOnCategory[index]
                                                                .addOnCategoryId)
                                                        ? e.quantity
                                                        : 0;
                                                  },
                                                ).reduce((_, __) => _ + __) !=
                                                addOnCategory[index]
                                                    .limitNumber) {
                                              context
                                                  .read(productDetailsProvider
                                                      .notifier)
                                                  .addSelectedAddOnItem(
                                                      addOnItems[i],
                                                      addOnCategory[index]);
                                            }
                                          } else {
                                            context
                                                .read(productDetailsProvider
                                                    .notifier)
                                                .addSelectedAddOnItem(
                                                    addOnItems[i],
                                                    addOnCategory[index]);
                                          }
                                        } else {
                                          context
                                              .read(productDetailsProvider
                                                  .notifier)
                                              .removeAddOnItem(addOnItems[i]);
                                        }
                                      },
                                    ),
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                                '${addOnItems[i].addOnItemName} - ',
                                                style:
                                                    textDarkRegularBR(context)),
                                            Text(
                                                '${addOnItems[i].addOnItemPrice}${Constants.currency}',
                                                style:
                                                    textBlackLargeBM(context)),
                                          ],
                                        ),
                                        selectedAddOnItems
                                                    .toList()
                                                    .singleWhere(
                                                        (element) =>
                                                            element.id ==
                                                            addOnItems[i].id,
                                                        orElse: () =>
                                                            AddOnItem())
                                                    .id !=
                                                null
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  counterIcon(
                                                    'REMOVE',
                                                    true,
                                                    () {
                                                      context
                                                          .read(
                                                              productDetailsProvider
                                                                  .notifier)
                                                          .updateAddonItemQuantity(
                                                              addOnItems[i],
                                                              false);
                                                    },
                                                  ),
                                                  Text(
                                                      selectedAddOnItems
                                                          .toList()
                                                          .singleWhere(
                                                              (element) =>
                                                                  element.id ==
                                                                  addOnItems[i]
                                                                      .id,
                                                              orElse: () =>
                                                                  AddOnItem())
                                                          .quantity
                                                          .toString(),
                                                      style: textBlackLargeBM(
                                                          context)),
                                                  counterIcon(
                                                    'ADD',
                                                    selectedAddOnItems.map(
                                                              (e) {
                                                                return (e.addOnCategoryId ==
                                                                        addOnCategory[index]
                                                                            .addOnCategoryId)
                                                                    ? e.quantity
                                                                    : 0;
                                                              },
                                                            ).reduce((_, __) =>
                                                                _ + __) !=
                                                            addOnCategory[index]
                                                                .limitNumber
                                                        ? true
                                                        : false,
                                                    () async {
                                                      if (selectedAddOnItems
                                                              .map(
                                                            (e) {
                                                              return (e.addOnCategoryId ==
                                                                      addOnCategory[
                                                                              index]
                                                                          .addOnCategoryId)
                                                                  ? e.quantity
                                                                  : 0;
                                                            },
                                                          ).reduce((_, __) =>
                                                                  _ + __) !=
                                                          addOnCategory[index]
                                                              .limitNumber) {
                                                        context
                                                            .read(
                                                                productDetailsProvider
                                                                    .notifier)
                                                            .updateAddonItemQuantity(
                                                                addOnItems[i],
                                                                true);
                                                      }
                                                    },
                                                  ),
                                                ],
                                              )
                                            : Container(),
                                      ],
                                    ),
                                  ),
                          ),
                        ],
                      );
                    }),
                dottedLine(context, darkLight3.withOpacity(0.2), 12),
              ],
            );
          }),
    );
  }

  Widget showMultipleTimeProductPopUp(BuildContext context) {
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
                    context
                        .read(homeTabsProvider.notifier)
                        .showScreen(CartScreen());
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
              '${'HOW_YOU_LIKE_TO_CUSTOMIZE'.tr}',
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
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
