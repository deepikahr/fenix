import 'package:fenix_user/screens/home/drawer/drawer.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/appbar.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:fenix_user/widgets/normalText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NotifyWaiter extends HookWidget {
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Center(
                child: Text('AVISO AL CAMARERO',
                    style: textBlackLargeBM(context))),
            SizedBox(height: 20),
            custombuttonsmFW(context, 'AYUDA CON SERVILLETERO', () {}),
            SizedBox(height: 30),
            custombuttonsmFW(context, 'PREGUNTAR ALGO', () {}),
            SizedBox(height: 30),
            custombuttonsmFW(context, 'SOLICITAR SERVILLETAS', () {}),
          ],
        ));
  }
}
