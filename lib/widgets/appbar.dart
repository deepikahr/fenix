import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/screens/home/home_tabs/homeTabs.dart';
import 'package:fenix_user/screens/others/notify_waiter/notifyWaiter.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/textFields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'normalText.dart';

final items = <String>[
  'red',
  'blue',
  'black',
  'Idiomos',
];

PreferredSizeWidget fenixAppbar(BuildContext context, _scaffoldKey, item, selectedItem, onSelect) {
  return PreferredSize(
    preferredSize: Size(MediaQuery.of(context).size.width, 146.0),
    child: Stack(
      children: [
        Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 125,
                  color: secondary1,
                ),
                Container(
                  height: 40,
                  color: white,
                ),
              ],
            ),
            Positioned(
              top: 35,
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
              top: 35,
              left: 50,
              right: 50,
              child: Column(
                children: [
                  titleTextDarkRegularBW(context, 'GASTROBAR'),
                  titleTextDarkRegularBW17(context, db.getMenuName()),
                ],
              ),
            ),
            Positioned(
              top: 35,
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
                  Text(DB().getTableNumber()!.toString(), style: textDarkRegularBW40(context)),
                ],
              ),
            ),
          ],
        ),
        Stack(
          children: [
            Positioned(
                top: 95,
                left: 20,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeTabs(tabIndex: 0,),
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
                          BoxShadow(
                              color: Colors.black45, blurRadius: 2)
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
                  ),
                )),
            Positioned(
                top: 95,
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
                          BoxShadow(
                              color: Colors.black45, blurRadius: 2)
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
                          style:
                          TextStyle(color: white, fontSize: 10),
                        )
                      ],
                    ),
                  ),
                )),
            Positioned(
              right: 40,
              top: 105,
              child: DropdownButton<String>(
                underline: Container(color: Colors.transparent),
                iconSize: 0,
                value: selectedItem,
                onChanged: onSelect,
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
                    value: item,
                    child: Text(
                      '$item',
                      style: textDarkRegularBG(context),
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        )
      ],
    ),
  );
}


PreferredSizeWidget introAppbar(BuildContext context) {
  return GFAppBar(
    backgroundColor: secondary,
    leading: InkWell(
      onTap: () {
        Get.back();
      },
      child: Image.asset(
        'lib/assets/icons/leftArrow.png',
        scale: 3,
      ),
    ),
    elevation: 0,
  );
}

PreferredSizeWidget commonAppbar(BuildContext context, title) => GFAppBar(
      backgroundColor: primary,
      centerTitle: true,
      iconTheme: IconThemeData(color: primary),
      title: Text(
        title,
        style: textWhiteRegularBS(context),
      ),
      elevation: 0,
    );

PreferredSizeWidget titleAppbar(BuildContext context, title) {
  return GFAppBar(
    backgroundColor: primary,
    leading: InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Image.asset(
        'lib/assets/icons/leftArrow.png',
        scale: 3,
        color: light,
      ),
    ),
    centerTitle: true,
    title: Text(title, style: textLightRegularBS(context)),
    elevation: 0,
  );
}

PreferredSizeWidget titleAppbarWithOutBack(BuildContext context, title) {
  return GFAppBar(
    backgroundColor: primary,
    automaticallyImplyLeading: false,
    centerTitle: true,
    title: Text(title, style: textLightRegularBS(context)),
    elevation: 0,
  );
}

PreferredSizeWidget homeAppbar(BuildContext context, onTap, title) {
  return GFAppBar(
    backgroundColor: primary,
    automaticallyImplyLeading: false,
    title: InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            'lib/assets/icons/currentLocation.png',
            scale: 3,
          ),
          SizedBox(width: 6),
          Expanded(
            child: Text(
              title,
              style: textLightRegularBS(context),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 25,
              width: 25,
              child: Image.asset(
                'lib/assets/icons/downArrow.png',
                scale: 3,
              ),
            ),
          ),
        ],
      ),
    ),
    elevation: 0,
  );
}

PreferredSizeWidget searchAppbar(BuildContext context, locationTextField) {
  return PreferredSize(
    preferredSize: Size.fromHeight(62.0),
    child: GFAppBar(
      backgroundColor: primary,
      automaticallyImplyLeading: false,
      title: regularTextField(context, locationTextField),
      elevation: 0,
    ),
  );
}

PreferredSizeWidget titleAppbarWithCart(
    BuildContext context, title, cartCount, void Function() onCartTap) {
  return GFAppBar(
    backgroundColor: primary,
    leading: InkWell(
      onTap: () {
        Get.back();
      },
      child: Image.asset(
        'lib/assets/icons/leftArrow.png',
        scale: 3,
        color: light,
      ),
    ),
    centerTitle: true,
    title: Text(title, style: textLightRegularBS(context)),
    elevation: 0,
    actions: [
      InkWell(
        onTap: onCartTap,
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Image.asset(
                'lib/assets/icons/cart1.png',
                scale: 3,
                color: light,
              ),
              Positioned(
                top: 16,
                right: 4,
                child: cartCount == null || cartCount == 0
                    ? Container()
                    : GFBadge(
                        shape: GFBadgeShape.circle,
                        color: dark,
                        size: 26,
                        child: Text(
                          '$cartCount',
                          textAlign: TextAlign.center,
                          style: textWhiteXXSmallBM(context),
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    ],
  );
}
