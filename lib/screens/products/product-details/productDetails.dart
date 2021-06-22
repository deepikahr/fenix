import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:getwidget/getwidget.dart';
import 'package:restaurant_saas/screens/home/drawer/drawer.dart';
import 'package:restaurant_saas/screens/home/notify_waiter/notify_waiter.dart';
import 'package:restaurant_saas/screens/others/settings/settings.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/normalText.dart';

class ProductDetails extends HookWidget {
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
        backgroundColor: Colors.white,
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
                  child: Icon(
                    Icons.list,
                    color: primary,
                    size: 40,
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
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: Stack(
                children: [
                  Container(
                    child: Image.asset(
                      'lib/assets/images/refer.png',
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
