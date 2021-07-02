import 'package:fenix_user/screens/home/drawer/drawer.dart';
import 'package:fenix_user/screens/others/notify_waiter/notifyWaiter.dart';
import 'package:fenix_user/screens/others/order_in_progress/orderInProgress.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/appbar.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:fenix_user/widgets/normalText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CartScreen extends HookWidget {
  final List<String> items = <String>[
    "red",
    "blue",
    "black",
    "Idiomos",
  ];
  String selectedItem = 'Idiomos';
  bool isChecked = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: light,
        key: _scaffoldKey,
        drawer: DrawerPage(),
        appBar: fenixAppbar(context, _scaffoldKey, items, selectedItem,  (String? string) =>
            useState(() => selectedItem = string!)),
        body: ListView(
          children: [
            Container(
              color: white,
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('PRODUCTOS SELECCIONADOS',
                      style: textBlackLargeBM(context)),
                  SizedBox(height: 10),
                  // Row(
                  //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Extra de patatas',
                          style: textBlackLargeBM20(context)),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text('1,0€', style: textBlackLargeBM(context)),
                              SizedBox(width: 4),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: primary,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  'Alérgenos',
                                  style: textWhiteRegularBM(),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: white,
                                      // border: Border.all(
                                      //     color: grey.shade300, width: 1),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      Text('12',
                                          style: textBlackLargeBM(context)),
                                      InkWell(
                                        // onTap: onUpdate,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 25,
                                            height: 25,
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
                                  )),
                              SizedBox(width: 10),
                              Icon(
                                Icons.delete,
                                color: dark,
                              )
                            ],
                          ),
                        ],
                      ),
                      Divider()
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Center(
                        child: custombuttonsm(context, 'OK, ENVIAR PEDIDO', () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrdersInProcess(),
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
