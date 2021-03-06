import 'package:fenix_user/common/constant.dart';
import 'package:fenix_user/common/kios_mode_utils.dart';
import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/language_response/language_response.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:twemoji/twemoji.dart';

import 'normalText.dart';

PreferredSizeWidget fenixAppbar(
    BuildContext context,
    _scaffoldKey,
    onSelectLanguage,
    List<LanguageResponse> languages,
    isLoading,
    settingsLoading,
    callWaiter,
    onHomeSelect,
    onNotifySelect) {
  return PreferredSize(
    preferredSize: Size(MediaQuery.of(context).size.width, 165.0),
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
                onTap: () {
                  if (shouldBeAbleToChangeTabs) {
                    _scaffoldKey.currentState!.openDrawer();
                  } else {
                    if (isStuckOnPaymentForKioskMode) {
                      Fluttertoast.showToast(
                          msg: 'USER_CANT_CHANGE_PAYMENT'.tr);
                    } else {
                      Fluttertoast.showToast(msg: 'USER_CANT_CHANGE_ORDER'.tr);
                    }
                  }
                },
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
                  titleTextDarkRegularBW(context,
                      DB().getRestaurantName() ?? Constants.restaurantName),
                  titleTextDarkRegularBW17(
                      context, DB().getMenuName() ?? 'MENU'),
                ],
              ),
            ),
            Positioned(
              top: 35,
              right: 16,
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
                  Text(DB().getTableNumber()!.toString(),
                      style: textDarkRegularBW40(context)),
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
                    width: 85,
                    height: 85,
                    decoration: BoxDecoration(
                        color: primary(),
                        border: Border.all(color: white, width: 2),
                        boxShadow: [
                          BoxShadow(color: Colors.black45, blurRadius: 2)
                        ],
                        borderRadius: BorderRadius.circular(18)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'lib/assets/images/i.png',
                          width: 50,
                          height: 50,
                        ),
                        Text(
                          'HOME'.tr,
                          style: TextStyle(color: white, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                )),
            settingsLoading
                ? GFLoader(
                    type: GFLoaderType.ios,
                  )
                : callWaiter
                    ? Positioned(
                        top: 95,
                        left: 120,
                        child: InkWell(
                          onTap: onNotifySelect,
                          child: Container(
                            width: 85,
                            height: 85,
                            decoration: BoxDecoration(
                                color: primary(),
                                border: Border.all(color: white, width: 2),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black45, blurRadius: 2)
                                ],
                                borderRadius: BorderRadius.circular(18)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: Image.asset(
                                    'lib/assets/images/c.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                                Text(
                                  'TO_CALL'.tr,
                                  style: TextStyle(color: white, fontSize: 16),
                                )
                              ],
                            ),
                          ),
                        ))
                    : Container(),
            isLoading
                ? GFLoader(
                    type: GFLoaderType.ios,
                  )
                : Positioned(
                    right: 20,
                    top: 95,
                    child: Container(
                      child: DropdownButton<String>(
                        underline: Container(color: Colors.transparent),
                        itemHeight: 80,
                        iconSize: 0,
                        value:
                            DB().getLanguage() ?? languages.first.languageName,
                        onChanged: onSelectLanguage,
                        selectedItemBuilder: (BuildContext context) {
                          return languages.map<Widget>((item) {
                            return Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Twemoji(
                                    emoji: '${item.flagCode}',
                                    height: 55,
                                    width: 55,
                                  ),
                                  // Twemoji(
                                  //   text: '${item.flagCode}',
                                  //   style: TextStyle(fontSize: 30),
                                  // )
                                  // Text(
                                  //   '${item.flagCode}',
                                  //   style: TextStyle(fontSize: 30),
                                  // ),

                                  Text(
                                    item.languageName ?? '',
                                    style: textDarkRegularLBS(context),
                                  ),
                                ],
                              ),
                            );
                          }).toList();
                        },
                        items: languages.map((item) {
                          return DropdownMenuItem(
                            value: item.languageName,
                            child: Center(
                              child: Twemoji(
                                emoji: '${item.flagCode}',
                                height: 50,
                                width: 50,
                              ),
                              //     Text(
                              //   '${item.flagCode}',
                              //   style: TextStyle(fontSize: 45),
                              // ),
                            ),
                            // Text(
                            //   '${item.languageName}',
                            //   style: textDarkRegularBG(context),
                            // ),
                          );
                        }).toList(),
                      ),
                    ),
                  )
          ],
        )
      ],
    ),
  );
}
