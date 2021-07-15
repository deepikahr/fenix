import 'package:fenix_user/common/utils.dart';
import 'package:fenix_user/models/api_request_models/cart/cart.dart';
import 'package:fenix_user/models/api_response_models/add_on_category/add_on_category.dart';
import 'package:fenix_user/models/api_response_models/add_on_item/add_on_item.dart';
import 'package:fenix_user/models/api_response_models/product_details_response/product_details_response.dart';
import 'package:fenix_user/models/api_response_models/product_response/product_response.dart';
import 'package:fenix_user/models/api_response_models/variant_response/variant_response.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/home/drawer/drawer.dart';
import 'package:fenix_user/screens/home/home_tabs/homeTabs.dart';
import 'package:fenix_user/screens/others/notify_waiter/notifyWaiter.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/appbar.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:fenix_user/widgets/network_image.dart';
import 'package:fenix_user/widgets/normalText.dart';
import 'package:fenix_user/widgets/textFields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:get/get.dart';

class ProductDetails extends HookWidget {
  final String? productId;
  ProductDetails({this.productId});

  String selectedItem = 'Idiomos';
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isChecked = false;

  final noteFocusNode = FocusNode();
  final GlobalKey<FormFieldState> formKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    final noteEditController = useTextEditingController();
    final state = useProvider(productDetailsProvider);
    final notifier = useProvider(productDetailsProvider.notifier);
    final cart = useProvider(cartProvider);
    final cartState = useProvider(cartScreenProvider);
    final cartNotifier = useProvider(cartScreenProvider.notifier);
    final isMounted = useIsMounted();

    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () {
          notifier.fetchProductDetails(productId!);
        });
        context.read(cartScreenProvider.notifier);
      }
      return;
    }, const []);

    return Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        drawer: DrawerPage(),
        appBar: fenixAppbar(context, _scaffoldKey, items, selectedItem,
            (String? string) => useState(() => selectedItem = string!)),
        body: Stack(
          children: [
            if (!state.isLoading && state.productDetails != null)
              productData(context, state.productDetails!, state, notifier,
                  noteEditController, cart),
            if (state.isLoading) GFLoader()
          ],
        ),
    );
  }

  Widget productData(BuildContext context, ProductDetailsResponse product,
      state, notifier, noteEditController, cart) {
    return ListView(
      children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: product.productImage!.imageUrl != null
                ? Stack(
                    children: [
                      networkImage(product.productImage!.imageUrl!,
                          MediaQuery.of(context).size.width, 200, 4),
                      Positioned(
                          child: Container(
                        color: Colors.blue,
                        padding: EdgeInsets.all(4),
                        child: Text(
                          'OFFER',
                          style: textDarkRegularBSW(context),
                          // textAlign: TextAlign.center,
                        ),
                      )),
                      Positioned(
                          child: Container(
                        color: Colors.blue,
                        padding: EdgeInsets.all(4),
                        child: Text(
                          'OFFER',
                          style: textDarkRegularBSW(context),
                          textAlign: TextAlign.center,
                        ),
                      )),
                      Positioned(
                          bottom: 0,
                          child: Container(
                            color: darkLight,
                            padding: EdgeInsets.all(4),
                            child: Text(
                              '350 gm',
                              style: textDarkRegularBSW(context),
                              textAlign: TextAlign.center,
                            ),
                          )),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.blue,
                        padding: EdgeInsets.all(4),
                        child: Text(
                          'OFFER',
                          style: textDarkRegularBSW(context),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        color: darkLight,
                        padding: EdgeInsets.all(4),
                        child: Text(
                          '350 gm',
                          style: textDarkRegularBSW(context),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  )),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
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
              // titleTextDarkLightSmallBR(context, '${product.productDescription}'),
              HtmlWidget(
                product.productDescription!,
                textStyle: textDarkLightSmallBR(context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '5,95€',
                    style: textDarkRegularBS(context),
                  ),
                  product.totalQuantity > 0 && !state.showAddButton
                      ? Container(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        print('aaaaaaaa');
                                        if (product.isSameProductMultipleTime == true) {
                                          showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  showMulitipleTimeProductPopUp(
                                                      context, cart));
                                        } else {
                                          print('bbbbbb');
                                          notifier.updateProductsQuantity(
                                              product, false);
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 35,
                                          height: 35,
                                          decoration: BoxDecoration(
                                              color: white,
                                              border: Border.all(
                                                  color: dark, width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Icon(
                                            Icons.remove,
                                            color: dark,
                                          ),
                                        ),
                                      )),
                                  Text(product.totalQuantity.toString(), style: textBlackLargeBM(context)),
                                  InkWell(
                                    onTap: () async {
                                      if (product.isCustomizable) {
                                        print('aaaaaaaa uppp');
                                        await showDialog(
                                            context: context,
                                            builder: (context) =>
                                                showPopUp(context, product, () async {
                                                  Get.back();
                                                  await notifier.findLastUpdateProduct(
                                                      product,
                                                      true,
                                                      product.restaurantName);
                                                }, cart));
                                      } else {
                                        print('bbbbbb upp');
                                        await notifier.findLastUpdateProduct(
                                            product, true, product.restaurantName);
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            color: white,
                                            border: Border.all(
                                                color: dark, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Icon(
                                          Icons.add,
                                          color: dark,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )))
                      : Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: custombuttonsm(
                            context,
                            'ADD',
                            () async {
                              context.read(productDetailsProvider.notifier).showAddButton(false);
                              await notifier.saveCart(
                                context,
                                state.selectedAddOnItems,
                                state
                                    .productDetails!.variants[state.groupValue],
                                state.productDetails!,
                                productId,
                              );
                            },
                          ),
                        ),
                ],
              ),
              sizeBlock(
                  context, state.groupValue, product.variants ?? [], state),
              allergenList(context, product.allergens ?? []),
              optionBlockExtra(state.productDetails?.addOnItems ?? [],
                  state.selectedAddOnItems, state),
            ],
          ),
        ),
        Container(
            alignment: AlignmentDirectional.center,
            padding: EdgeInsets.only(bottom: 16),
            child: Text('TOTAL + EXTRAS ${product.totalProductPrice}€',
                style: textBlackLargeBM(context))),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: titleTextDark17RegularBR(
            context,
            'sugerencias',
          ),
        ),
        Container(
          margin: EdgeInsets.all(16),
          child: noteTextField(
            context,
            noteEditController,
            noteFocusNode,
            (value) {
              FocusScope.of(context).unfocus();
              formKey.currentState!.validate();
            },
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
          'Allergens',
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
                    Text(
                      'description',
                      style: textDarkLightSmallBR9(context),
                    )
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
          titleTextDark17RegularBR(context, 'Choose size'),
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
                title: Row(
                  children: [
                    Text('${variants[i].sizeName} -  ',
                        style: textDarkRegularBR(context)),
                    Text('${'\$'}${variants[i].price}',
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
                      return CheckboxListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: green,
                        value: selectedAddOnItems!.contains(addOnItems[i]),
                        title: Row(
                          children: [
                            Text('${addOnItems[i].addOnItemName} - ',
                                style: textDarkRegularBR(context)),
                            Text('${'\$'}${addOnItems[i].addOnItemPrice}',
                                style: textBlackLargeBM(context)),
                          ],
                        ),
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
                      );
                    }),
                dottedLine(context, darkLight3.withOpacity(0.2), 12),
              ],
            );
          }),
    );
  }

  Widget showMulitipleTimeProductPopUp(BuildContext context, Cart? cart) {
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
                  color: primary,
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
                    await Get.to(() => Cart());
                    context.read(productDetailsProvider.notifier).updateQuantity();
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

  Widget showPopUp(BuildContext context, ProductDetailsResponse product,
      Function() onRepeat, Cart? cart) {
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
                  color: primary,
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
                    context.read(productDetailsProvider.notifier).showAddButton(true);
                    Get.back();
                    await Get.to(
                        () => ProductDetails(productId: product.productId!));
                    context.read(productListProvider.notifier).updateQuantity();
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
