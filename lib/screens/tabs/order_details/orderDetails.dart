import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/cart_product/cart_product.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/tabs/payment/payment.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:get/get.dart';

class OrderDetails extends HookWidget {

  @override
  Widget build(BuildContext context) {

    final state = useProvider(orderDetailsProvider);
    final notifier = useProvider(orderDetailsProvider.notifier);
    final isMounted = useIsMounted();

    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () {
          notifier.fetchOrderDetails();
        });
      }
      return;
    }, const []);

    return Scaffold(
        body: ListView(
          children: [
            state.orderDetails == null || !DB().isLoggedIn()
                ? state.isLoading ? GFLoader(type: GFLoaderType.ios) : Center(
              child: Text('CART_IS_EMPTY'.tr),
            ) : Container(
              color: white,
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${'ORDER ID'.tr}: ${state.orderDetails!.orderID}', style: textDarkLight3SmallBR(context)),
                      Text('${state.orderDetails!.orderStatus}', style: textDarkLight3SmallBR(context)),
                    ],
                  ),
                  SizedBox(height: 10),
                  cartItemBlock(context, state.orderDetails!.cart, state),
                  if (state.isLoading) GFLoader(type: GFLoaderType.ios),
                  Container(
                    padding: EdgeInsets.all(12),
                    color: light,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: Text('${state.orderDetails!.subTotal!.toStringAsFixed(2)} ${'VAT_INCLUDE_TOTAL'.tr}',
                              style: textBlackLargeBM20G(context)),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                GFCheckbox(
                                  size: 20,
                                  activeBgColor: GFColors.DANGER,
                                  onChanged: (value) {
                                    context.read(orderDetailsProvider.notifier)
                                        .divideAccount(value);
                                  },
                                  value: state.divideAccount,
                                ),
                                SizedBox(width: 10),
                                Text('DIVIDE_THE_ACCOUNT'.tr,
                                    style: textBlackLargeBM20(context)),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('${state.orderDetails!.grandTotal!.toStringAsFixed(2)} ${'TOTAL_SELECTION'.tr}',
                            style: textBlackLargeBM20G(context)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Center(
                        child:
                        custombuttonsm(context, 'OK,_PAYMENT_METHODS'.tr, () {
                          Get.to(() => Payment());
                        }, false)),
                  ),
                  //   ],
                  // ),
                ],
              ),
            )
          ],
        ));
  }

  cartItemBlock(BuildContext context, List<CartProduct> cart, state) {
    return ListView.builder(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: cart.length,
        itemBuilder: (BuildContext context, int i) {
          final cartProduct = cart.elementAt(i);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 26.0),
                child: Text(cartProduct.productName!,
                    style: textBlackLargeBM20(context)),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      state.divideAccount ? GFCheckbox(
                        size: 20,
                        activeBgColor: GFColors.DANGER,
                        onChanged: (value) {

                        },
                        value: false,
                      ) : Container(),
                      SizedBox(width: 10),
                      Text('${cartProduct.totalProductPrice}€', style: textBlackLargeBM(context)),
                    ],
                  ),
                  Text('${cartProduct.quantity}', style: textBlackLargeBM(context)),
                ],
              ),
              Divider()
            ],
          );
        });
  }

}
