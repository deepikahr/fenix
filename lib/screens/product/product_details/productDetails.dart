import 'package:fenix_user/models/api_response_models/add_on_category/add_on_category.dart';
import 'package:fenix_user/models/api_response_models/add_on_item/add_on_item.dart';
import 'package:fenix_user/models/api_response_models/product_details_response/product_details_response.dart';
import 'package:fenix_user/models/api_response_models/variant_response/variant_response.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/home/drawer/drawer.dart';
import 'package:fenix_user/screens/others/notify_waiter/notifyWaiter.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/appbar.dart';
import 'package:fenix_user/widgets/network_image.dart';
import 'package:fenix_user/widgets/normalText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/all.dart';

class ProductDetails extends HookWidget {
  final String? productId;
  ProductDetails({this.productId});

  String selectedItem = 'Idiomos';
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {

    final state = useProvider(productDetailsProvider);
    final notifier = useProvider(productDetailsProvider.notifier);
    final isMounted = useIsMounted();

    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () {
          notifier.fetchProductDetails(productId!);
        });
      }
      return;
    }, const []);


    return Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        drawer: DrawerPage(),
        appBar: fenixAppbar(context, _scaffoldKey, items, selectedItem,  (String? string) =>
            useState(() => selectedItem = string!)),
        body: Stack(
          children: [
            if(!state.isLoading)
              productData(context, state.productDetails!, state),
            if(state.isLoading)
              GFLoader()
          ],
        )
    );
  }

  Widget productData(BuildContext context, ProductDetailsResponse product, state){
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Stack(
            children: [
              product.productImage!.imageUrl != null ?
              networkImage(product.productImage!.imageUrl!, MediaQuery.of(context).size.width, 200, 4) :
              Container(
                  child: Image.asset(
                    'lib/assets/images/refer.png',
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    fit: BoxFit.cover,
                  )),
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
          ),
        ),
        Container(
          padding:
          const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
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
              titleTextDarkLightSmallBR(context, '${product.productDescription}'),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '5,95€',
                    style: textDarkRegularBS(context),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: white,
                          // border: Border.all(
                          //     color: grey.shade300, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            // onTap: onRemove,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: white,
                                      border: Border.all(color: dark, width: 1),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Icon(
                                    Icons.remove,
                                    color: dark,
                                  ),
                                ),
                              )),
                          Text('1', style: textBlackLargeBM(context)),
                          InkWell(
                            // onTap: onUpdate,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: white,
                                    border:
                                    Border.all(color: dark, width: 1),
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
                      ))
                ],
              ),
              sizeBlock(context, state.groupValue, product.variants ?? [], state),
              allergenList(context, product.allergens ?? []),
              optionBlockExtra(
                  state.productDetails?.addOnItems ?? [],
                  state.selectedAddOnItems,
                  state),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GFCheckbox(
                        size: 20,
                        activeBgColor: GFColors.DANGER,
                        onChanged: (value) {
                          // setState(() {
                          //   isChecked = value;
                          // }
                          // );
                        },
                        value: isChecked,
                      ),
                      SizedBox(width: 4),
                      Text('Extra de patatas',
                          style: textDarkRegularBR(context)),
                    ],
                  ),
                  Text('1,0€', style: textBlackLargeBM(context)),
                  Container(
                      decoration: BoxDecoration(
                          color: white,
                          // border: Border.all(
                          //     color: grey.shade300, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            // onTap: onRemove,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      color: white,
                                      border: Border.all(color: dark, width: 1),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Icon(
                                    Icons.remove,
                                    color: dark,
                                  ),
                                ),
                              )),
                          Text('12', style: textBlackLargeBM(context)),
                          InkWell(
                            // onTap: onUpdate,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                    color: white,
                                    border:
                                    Border.all(color: dark, width: 1),
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
                      )),
                ],
              ),
            ],
          ),
        ),
        Center(
            child: Text('TOTAL + EXTRAS 10,50€',
                style: textBlackLargeBM(context))),
      ],
    );
  }

  Widget allergenList(context, List<String> allergens){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        titleTextDark17RegularBR(
          context, 'Allergens',
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
                return  Column(
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


  Widget sizeBlock(context, int groupValue, List<VariantResponse> variants, state) {
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
                    Text('${'\$'}${variants[i].price}', style: textBlackLargeBM(context)),
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

  Widget optionBlockExtra(List<AddOnCategory> categoryList,
      Set<AddOnItem>? selectedAddOnItems, state) {
    return Container(
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
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: green,
                        value: false,
                        title: Row(
                          children: [
                            Text('${addOnItems[i].addOnItemName} - ',
                                style: textDarkRegularBR(context)),
                            Text('${'\$'}${addOnItems[i].addOnItemPrice}', style: textBlackLargeBM(context)),
                          ],
                        ),
                        onChanged: (value) {
                          if (value!) {
                            context
                                .read(productDetailsProvider.notifier)
                                .addSelectedAddOnItem(addOnItems[i]);
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

}
