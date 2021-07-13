import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/cart/cart.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/home/drawer/drawer.dart';
import 'package:fenix_user/screens/others/notify_waiter/notifyWaiter.dart';
import 'package:fenix_user/screens/others/payment/payment.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/appbar.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:fenix_user/widgets/normalText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/all.dart';

class TotalAmount extends HookWidget {

  @override
  Widget build(BuildContext context) {

    final cart = useProvider(cartProvider);
    final state = useProvider(cartScreenProvider);
    final cartNotifier = useProvider(cartScreenProvider.notifier);
    final isMounted = useIsMounted();

    useEffect(() {
      if (isMounted()) {
        context.read(cartScreenProvider.notifier);
      }
      return;
    }, const []);

    return Scaffold(
        body: ListView(
          children: [
            Container(
              color: white,
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('ORDER ID: 4456', style: textBlackLargeBM(context)),
                      Text('UNIDADES', style: textBlackLargeBM(context)),
                    ],
                  ),
                  SizedBox(height: 10),
                  cart == null || !DB().isLoggedIn()
                      ? Center(
                    child: Text('CART_IS_EMPTY'),
                  )
                      : cartItemBlock(context, cart, state),
                  if (state.isLoading) GFLoader(),
                  Container(
                    padding: EdgeInsets.all(12),
                    color: light,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: Text('${cart!.subTotal} Iva incl. TOTAL',
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
                                  },
                                  value: true,
                                ),
                                SizedBox(width: 10),
                                Text('DIVIDIR LA CUENTA',
                                    style: textBlackLargeBM20(context)),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('${cart.grandTotal} TOTAL SELECCIÓN',
                            style: textBlackLargeBM20G(context)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Center(
                        child:
                        custombuttonsm(context, 'OK, FORMAS DE PAGO', () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Payment(),
                            ),
                          );
                        })),
                  ),
                  //   ],
                  // ),
                ],
              ),
            )
          ],
        ));
  }

  cartItemBlock(BuildContext context, Cart cart, state) {
    return ListView.builder(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: cart.products.length,
        itemBuilder: (BuildContext context, int i) {
          final cartProduct = cart.products.elementAt(i);
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
                      GFCheckbox(
                        size: 20,
                        activeBgColor: GFColors.DANGER,
                        onChanged: (value) {
                          // setState(() {
                          //   isChecked = value;
                          // }
                          // );
                        },
                        value: false,
                      ),
                      SizedBox(width: 10),
                      Text('${cartProduct.totalProductPrice}€', style: textBlackLargeBM(context)),
                    ],
                  ),
                  Text('${cartProduct.totalQuantity}', style: textBlackLargeBM(context)),
                ],
              ),
              Divider()
            ],
          );
        });
  }

}
