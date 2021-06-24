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

class TotalAmount extends HookWidget {
  final List<String> items = <String>[
    "red",
    "blue",
    "black",
    "Idiomos",
  ];
  String? selectedItem = 'Idiomos';
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
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
                  Text('UNIDADES', style: textBlackLargeBM(context)),
                  SizedBox(height: 10),
                  // Row(
                  //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 26.0),
                        child: Text('Extra de patatas',
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
                                value: isChecked,
                              ),
                              SizedBox(width: 10),
                              Text('1,0€', style: textBlackLargeBM(context)),
                            ],
                          ),
                          Text('12', style: textBlackLargeBM(context)),
                        ],
                      ),
                      Divider()
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 26.0),
                        child: Text('Extra de patatas',
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
                                value: isChecked,
                              ),
                              SizedBox(width: 10),
                              Text('1,0€', style: textBlackLargeBM(context)),
                            ],
                          ),
                          Text('12', style: textBlackLargeBM(context)),
                        ],
                      ),
                      Divider()
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    color: light,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: Text('35,50 Iva incl. TOTAL',
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
                                    // setState(() {
                                    //   isChecked = value;
                                    // }
                                    // );
                                  },
                                  value: isChecked,
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
                        Text('35,50 TOTAL SELECCIÓN',
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
}
