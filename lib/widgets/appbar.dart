import 'package:fenix_user/common/constant.dart';
import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/language_response/language_response.dart';
import 'package:fenix_user/screens/home/home_tabs/homeTabs.dart';
import 'package:fenix_user/screens/others/notify_waiter/notifyWaiter.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'normalText.dart';

PreferredSizeWidget fenixAppbar(BuildContext context, _scaffoldKey,
    onSelectLanguage, List<LanguageResponse> languages, isLoading) {
  return PreferredSize(
    preferredSize: Size(MediaQuery.of(context).size.width, 135.0),
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
                  height: 8,
                  // color: white,
                  decoration: new BoxDecoration(color: white, boxShadow: [
                    BoxShadow(color: grey.withOpacity(0.5), blurRadius: 10)
                  ]),
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
                  color: primary(),
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
                  titleTextDarkRegularBW(context, Constants.restaurantName),
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
                        text: 'DESK'.tr,
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
                    Get.to(() => HomeTabs(tabIndex: 0,),);
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: primary(),
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
                          'HOME'.tr,
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
                    Get.to(() => NotifyWaiter());
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                         color: primary(),
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
                          'TO_CALL'.tr,
                          style:
                          TextStyle(color: white, fontSize: 10),
                        )
                      ],
                    ),
                  ),
                )),
            isLoading ? GFLoader(type: GFLoaderType.ios,) : Positioned(
              right: 40,
              top: 105,
              child: DropdownButton<String>(
                underline: Container(color: Colors.transparent),
                iconSize: 0,
                value: db.getLanguage() ?? languages.first.languageName,
                onChanged: onSelectLanguage,
                selectedItemBuilder: (BuildContext context) {
                  return languages.map<Widget>((item) {
                    return Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.network(
                            item.imageUrl!,
                            width: 50,
                            height: 36,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          item.languageName!,
                          style: textDarkRegularBGS(context),
                        ),
                      ],
                    );
                  }).toList();
                },
                items: languages.map((item) {
                  db.saveLanguageCode(item.languageCode);
                  return DropdownMenuItem(
                    value: item.languageName,
                    child:
                    // Text(
                    //   '${item.languageName}',
                    //   style: textDarkRegularBG(context),
                    // ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        item.imageUrl!,
                        width: 50,
                        height: 36,
                        fit: BoxFit.fill,
                      ),
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


