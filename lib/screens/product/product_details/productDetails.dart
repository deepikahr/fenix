import 'package:fenix_user/screens/home/drawer/drawer.dart';
import 'package:fenix_user/screens/others/notify_waiter/notifyWaiter.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/appbar.dart';
import 'package:fenix_user/widgets/normalText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:getwidget/getwidget.dart';

class ProductDetails extends HookWidget {
  final List<String> items = <String>[
    "red",
    "blue",
    "black",
    "Idiomos",
  ];

  String selectedItem = 'Idiomos';
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        drawer: DrawerPage(),
        appBar: fenixAppbar(context, _scaffoldKey, items, selectedItem,  (String? string) =>
            useState(() => selectedItem = string!)),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: Stack(
                children: [
                  Container(
                    child: Image.asset(
                      'lib/assets/images/thankYou.png',
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                  ),
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
                              context, 'Ternera con verduras salteadas')),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  titleTextDarkLightSmallBR(context,
                      'Mezcla de verduras al vapor con ternera de primera, En vero eos et accusamus et iusto odio dignissimos ducimus qui.'),

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
                              Text('12', style: textBlackLargeBM(context)),
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
                  Row(
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'lib/assets/images/p1.png',
                            width: 50,
                            height: 50,
                          ),
                          Text(
                            'Title',
                            style: textDarkRegularBM10(context),
                          ),
                          Text(
                            'description',
                            style: textDarkLightSmallBR9(context),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'lib/assets/images/p2.png',
                            width: 50,
                            height: 50,
                          ),
                          Text(
                            'Title',
                            style: textDarkRegularBM10(context),
                          ),
                          Text(
                            'description',
                            style: textDarkLightSmallBR9(context),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'lib/assets/images/p3.png',
                            width: 50,
                            height: 50,
                          ),
                          Text(
                            'Title',
                            style: textDarkRegularBM10(context),
                          ),
                          Text(
                            'description',
                            style: textDarkLightSmallBR9(context),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'lib/assets/images/p4.png',
                            width: 50,
                            height: 50,
                          ),
                          Text(
                            'Title',
                            style: textDarkRegularBM10(context),
                          ),
                          Text(
                            'description',
                            style: textDarkLightSmallBR9(context),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'lib/assets/images/p5.png',
                            width: 50,
                            height: 50,
                          ),
                          Text(
                            'Title',
                            style: textDarkRegularBM10(context),
                          ),
                          Text(
                            'description',
                            style: textDarkLightSmallBR9(context),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'lib/assets/images/p10.png',
                            width: 50,
                            height: 50,
                          ),
                          Text(
                            'Title',
                            style: textDarkRegularBM10(context),
                          ),
                          Text(
                            'description',
                            style: textDarkLightSmallBR9(context),
                          )
                        ],
                      ),
                    ],
                  ),

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
                          ))
                    ],
                  )
                ],
              ),
            ),
            Center(
                child: Text('TOTAL + EXTRAS 10,50€',
                    style: textBlackLargeBM(context))),
          ],
        ));
  }
}
