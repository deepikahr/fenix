import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:restaurant_saas/screens/fenix_orders/order-inprocess.dart';
import 'package:restaurant_saas/screens/home/drawer/drawer.dart';
import 'package:restaurant_saas/screens/home/notify_waiter/notify_waiter.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/buttons.dart';
import 'package:restaurant_saas/widgets/normalText.dart';

class OrdersList extends HookWidget {
  final List<String> items = <String>[
    "red",
    "blue",
    "black",
    "Idiomos",
  ];
  String? selectedItem = 'Idiomos';
  bool isChecked = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: light,
        key: _scaffoldKey,
        drawer: DrawerPage(),
        appBar: PreferredSize(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                // padding: EdgeInsets.symmetric(vertical: 15),
                decoration: new BoxDecoration(
                  color: secondary1,
                  //  boxShadow: [
                  //   BoxShadow(color: Colors.black45, blurRadius: 20)
                  // ]
                ),
              ),
              Positioned(
                top: 45,
                left: 20,
                child: InkWell(
                  onTap: () => _scaffoldKey.currentState!.openDrawer(),
                  child: Image.asset(
                    'lib/assets/images/drawer.png',
                    scale: 1.8,
                  ),
                ),
              ),
              Positioned(
                top: 45,
                left: 50,
                right: 50,
                child: Column(
                  children: [
                    titleTextDarkRegularBW(context, "GASTROBAR"),
                    titleTextDarkRegularBW17(context, "CALLE LARIOS 12"),
                  ],
                ),
              ),
              Positioned(
                top: 45,
                right: 20,
                child: Row(
                  children: [
                    RotatedBox(
                      quarterTurns: -1,
                      child: RichText(
                        text: TextSpan(
                          text: 'Mesa',
                          style: textDarkRegularBW17(context),
                          children: [],
                        ),
                      ),
                    ),
                    Text('5', style: textDarkRegularBW40(context)),
                  ],
                ),
              ),
            ],
          ),
          preferredSize: new Size(MediaQuery.of(context).size.width, 80.0),
        ),

        // bottomNavigationBar:
        body: ListView(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 35,
                      color: secondary1,
                    ),
                    Container(
                      height: 13,
                      decoration: BoxDecoration(
                        color: white,
                        //    boxShadow: [
                        //    BoxShadow(color:Colors.black45,blurRadius:5)
                        //  ]
                      ),
                    ),
                    Container(
                      height: 12,
                      color: white,
                    ),
                  ],
                ),
                Positioned(
                    bottom: 0,
                    left: 20,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Color(0xFFFD2959),
                          border: Border.all(color: white, width: 2),
                          boxShadow: [
                            BoxShadow(color: Colors.black45, blurRadius: 2)
                          ],
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'lib/assets/images/i.png',
                            width: 30,
                            height: 40,
                          ),
                          Text(
                            'INICIO',
                            style: TextStyle(color: white, fontSize: 10),
                          )
                        ],
                      ),
                    )),
                Positioned(
                    bottom: 0,
                    left: 100,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotifyWaiter(),
                          ),
                        );
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Color(0xFFFD2959),
                            border: Border.all(color: white, width: 2),
                            boxShadow: [
                              BoxShadow(color: Colors.black45, blurRadius: 2)
                            ],
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'lib/assets/images/c.png',
                              width: 40,
                              height: 40,
                            ),
                            Text(
                              'LLAMAR',
                              style: TextStyle(color: white, fontSize: 10),
                            )
                          ],
                        ),
                      ),
                    )),
                Positioned(
                  right: 20,
                  bottom: 0,
                  child: DropdownButton<String>(
                    underline: Container(color: Colors.transparent),
                    iconSize: 0,
                    value: selectedItem,
                    onChanged: (String? string) =>
                        useState(() => selectedItem = string),
                    selectedItemBuilder: (BuildContext context) {
                      return items.map<Widget>((String item) {
                        return Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            children: [
                              Image.asset(
                                'lib/assets/images/food1.png',
                                width: 50,
                                height: 36,
                                fit: BoxFit.fill,
                              ),
                              Text(
                                item,
                                style: textDarkRegularBGS(context),
                              ),
                            ],
                          ),
                        );
                      }).toList();
                    },
                    items: items.map((String item) {
                      return DropdownMenuItem<String>(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 14, 16, 4),
                          child: Text(
                            '$item',
                            style: textDarkRegularBG(context),
                          ),
                        ),
                        value: item,
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
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
