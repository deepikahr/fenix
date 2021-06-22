import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getwidget/getwidget.dart';
import 'package:restaurant_saas/screens/others/settings/settings.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/normalText.dart';

class DrawerPage extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 110,
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: new BoxDecoration(color: secondary1, boxShadow: [
                  BoxShadow(color: Colors.black45, blurRadius: 20)
                ]),
              ),
              Positioned(
                bottom: 10,
                left: 20,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Settings(),
                      ),
                    );
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(12)),
                    child: Icon(
                      Icons.settings,
                      color: secondary1,
                      size: 40,
                    ),
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
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: titleTextDarkRegularBB20(context, 'CATEGORIA 1'),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: titleTextDarkRegularBB20(context, 'CATEGORIA 2'),
          ),
          Divider(),
        ],
      )),
    );
  }
}
