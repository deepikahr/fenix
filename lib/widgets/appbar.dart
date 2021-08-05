import 'package:fenix_user/common/constant.dart';
import 'package:fenix_user/common/utils.dart';
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
    onSelectLanguage, List<LanguageResponse> languages, isLoading, settingLoading, settingsState, onHomeSelect) {
  printWrapped('xxxxxxxxxxxxxxxxxxxxxxxxxx ${db.getLanguage()}');
  return PreferredSize(
    preferredSize: Size(MediaQuery.of(context).size.width, 155.0),
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
              right: 10,
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
                  onTap: onHomeSelect,
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        color: primary(),
                        border: Border.all(color: white, width: 2),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black45, blurRadius: 2)
                        ],
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'lib/assets/images/i.png',
                          width: 40,
                          height: 40,
                        ),
                        Text(
                          'HOME'.tr,
                          style: TextStyle(color: white, fontSize: 12),
                        )
                      ],
                    ),
                  ),
                )),
            settingLoading ? GFLoader(type: GFLoaderType.ios,) : settingsState.settings!.tabSetting!.callToWaiter ? Positioned(
                top: 95,
                left: 120,
                child: InkWell(
                  onTap: () {
                    Get.to(() => NotifyWaiter());
                  },
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                         color: primary(),
                        border: Border.all(color: white, width: 2),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black45, blurRadius: 2)
                        ],
                        borderRadius: BorderRadius.circular(16)),
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
                          TextStyle(color: white, fontSize: 12),
                        )
                      ],
                    ),
                  ),
                )) : Container(),
            isLoading ? GFLoader(type: GFLoaderType.ios,) : Positioned(
              right: 10,
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
                        Container(
                          margin: EdgeInsets.only(bottom: 1),
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(8)
                          ),
                            child: Text('${item.flagCode}', style: TextStyle(fontSize: 30),)),
                        Text(
                          item.languageName ?? '',
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
                    child: Center(child: Text('${item.flagCode}', style: TextStyle(fontSize: 35),)),
                    // Text(
                    //   '${item.languageName}',
                    //   style: textDarkRegularBG(context),
                    // ),
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


