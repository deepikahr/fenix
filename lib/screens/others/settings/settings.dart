import 'dart:async';

import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/menu_response/menu_response.dart';
import 'package:fenix_user/models/api_response_models/settings_response/settings_response.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/auth/change_password/changePassword.dart';
import 'package:fenix_user/screens/home/home_tabs/homeTabs.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/alertBox.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:fenix_user/widgets/normalText.dart';
import 'package:fenix_user/widgets/textFields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getwidget/components/rating/gf_rating.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:get/get.dart';

import '../../../main.dart';

class Settings extends HookWidget {
  double _rating = 3;
  final tableNumberFocusNode = FocusNode();
  final ipAddressFocusNode = FocusNode();
  final GlobalKey<FormFieldState> formKey = GlobalKey<FormFieldState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final tableNumberEditController = useTextEditingController();
    final ipAddressEditController = useTextEditingController();

    final state = useProvider(settingsProvider);
    final notifier = useProvider(settingsProvider.notifier);
    final isMounted = useIsMounted();

    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () async {
          await notifier.fetchSettings();
          await notifier.fetchMenuList();
        });
      }
      return;
    }, const []);

    // print('wwwwwww ${state.menuList}');

    return Scaffold(
      key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: new BoxDecoration(color: secondary1, boxShadow: [
                  BoxShadow(color: Colors.black45, blurRadius: 20)
                ]),
              ),
              Positioned(
                top: 40,
                left: 50,
                right: 50,
                child: Column(
                  children: [
                    titleTextDarkRegularBW15(context, "MAC 91:75:1a:ec:9a:c7"),
                    SizedBox(height: 5),
                    titleTextDarkRegularBW(context, "GASTROBAR"),
                    titleTextDarkRegularBW17(context, "CALLE LARIOS 12"),
                  ],
                ),
              ),
            ],
          ),
          preferredSize: new Size(MediaQuery.of(context).size.width, 90.0),
        ),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              if (state.settings != null && state.menuList != null)
                contentBlock(context, state.settings!, state.menuList!,
                    tableNumberEditController, ipAddressEditController, state),
              if (state.isLoading) GFLoader(type: GFLoaderType.ios)
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              primaryButtonSmall(context, 'CANCEL', () {
                Get.back();
              }),
              primaryButton(context, 'UPDATE', () async {
                if (state.menuTitle != null || DB().getMenuName() != null) {
                  final response = await context
                      .read(settingsProvider.notifier)
                      .updateSettings(
                      state.resetCategory ?? state.settings!.tabSetting!.resetCategory,
                      state.enableCall ?? state.settings!.tabSetting!.callToWaiter,
                      state.payOnCommand ?? state.settings!.tabSetting!.payTypeKiosk,
                      state.validatePayment ?? state.settings!.tabSetting!.validatePaymentByWaiter,
                      state.themeColor ?? state.settings!.tabSetting!.themeColour,
                      state.orderMode ?? state.settings!.tabSetting!.orderingMode,
                      state.type ?? state.settings!.tabSetting!.viewType
                  );

                  if(response != null){
                    Timer(Duration(seconds: 2), () async {
                      await Get.offAll(() => HomeTabs());
                    });

                    await showDialog(
                      // barrierColor: grey,
                      context: context,
                      builder: (BuildContext context) {
                        return blackAlertBox(
                            context,
                            'Settings updated successfully'.tr,
                            Image.asset(
                              'lib/assets/icons/done.png',
                              scale: 3,
                            ),
                            null);
                      },
                    );
                  }
                }else{
                  await showDialog(
                    barrierColor: secondary,
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        actions: [
                          flatPrimaryUnderlineButton(
                              context, 'OK', (){
                                Get.back();
                          })
                        ],
                        insetPadding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        contentPadding: EdgeInsets.zero,
                        backgroundColor: dark,
                        content: Container(
                          width: double.infinity,
                          height: 176,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 55),
                                child: Text(
                                  'Please select menu ',
                                  style: textWhiteRegularBM(),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              }, state.isUpdateLoading),
            ],
          ),
        ));
  }

  Widget contentBlock(
      BuildContext context,
      SettingsResponse settings,
      List<MenuResponse>? menuList,
      tableNumberEditController,
      ipAddressEditController,
      state) {
    DB().saveTableNumber(settings.tableNumber.toString());
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleTextDarkRegularBS(context, 'codigo conexion'),
              GFRating(
                value: _rating,
                color: dark,
                borderColor: dark,
                size: 25,
                onChanged: (value) {},
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleTextDarkRegularBS(context, 'Mesa Nº'),
              titleTextDarkRegularBS(context, '${settings.tableNumber}'),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleTextDarkRegularBS(context, 'table capacity'),
              titleTextDarkRegularBS(context, '${settings.tableCapacity}'),
              // Container(
              //   width: 160,
              //   child: regularTextField(
              //     context,
              //     tableNumberTextField(
              //         context,
              //         tableNumberEditController,
              //         tableNumberFocusNode, (value) {
              //       FocusScope.of(context)
              //           .requestFocus(ipAddressFocusNode);
              //     }
              //     ),
              //   ),
              // ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleTextDarkRegularBS(context, 'color del tama'),
              DropdownButton<String>(
                underline: Container(color: Colors.transparent),
                iconSize: 20,
                hint: Text(
                  'menu selection',
                  style: textDarkRegularBG(context),
                ),
                value: state.themeColor ?? settings.tabSetting!.themeColour,
                onChanged: (value) async {
                  await context.read(settingsProvider.notifier)
                      .setThemeColor(value!);
                },
                items: <String>[
                  'red',
                  'green','blue'
                ].map<DropdownMenuItem<String>>((String item) {
                  return DropdownMenuItem<String>(
                    child: Text(
                      '$item',
                      style: textDarkRegularBG(context),
                    ),
                    value: item,
                  );
                }).toList(),
              ),
              // titleTextDarkRegularBS(
              //     context, '${settings.tabSetting!.themeColour}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleTextDarkRegularBS(context, 'carta selecionada'),
              DropdownButton<String>(
                underline: Container(color: Colors.transparent),
                iconSize: 20,
                hint: Text(
                  'Choose menu',
                  style: textDarkRegularBG(context),
                ),
                value: state.menuTitle ?? DB().getMenuName(),
                onChanged: (value) async {
                  for (var i = 0; i < menuList!.length; i++) {
                    if (menuList[i].title == value) {
                      await context.read(settingsProvider.notifier)
                          .setMenu(menuList[i].id!, value);
                    }
                  }
                },
                items: menuList!.map((MenuResponse item) {
                  return DropdownMenuItem(
                    child: Text(
                      item.title!,
                      style: textDarkRegularBG(context),
                    ),
                    value: item.title,
                  );
                }).toList(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleTextDarkRegularBS(context, 'Representación de categoría'),
              DropdownButton<String>(
                underline: Container(color: Colors.transparent),
                iconSize: 20,
                value: state.type ?? settings.tabSetting!.viewType,
                onChanged: (String? value) async {
                  await context.read(settingsProvider.notifier)
                      .setType(value!);
                },
                items: <String>[
                  'list',
                  'grid',
                ].map<DropdownMenuItem<String>>((String item) {
                  return DropdownMenuItem<String>(
                    child: Text(
                      '$item',
                      style: textDarkRegularBG(context),
                    ),
                    value: item,
                  );
                }).toList(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleTextDarkRegularBS(context, 'ENCABEZADO CATEGORIE'),
              GFToggle(
                onChanged: (bool? value) async {
                  await context.read(settingsProvider.notifier)
                      .setResetCategory(value!);
                },
                enabledThumbColor: primary,
                enabledTrackColor: primary.withOpacity(0.3),
                value: settings.tabSetting!.resetCategory!,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleTextDarkRegularBS(context, 'ORDERING MODE'),
              DropdownButton<String>(
                underline: Container(color: Colors.transparent),
                iconSize: 20,
                value: state.orderMode ??settings.tabSetting!.orderingMode,
                onChanged: (String? value) async {
                  await context.read(settingsProvider.notifier)
                      .setOrderMode(value!);
                },
                items: <String>['printer', "waiter's app", 'pos link']
                    .map<DropdownMenuItem<String>>((String item) {
                  return DropdownMenuItem<String>(
                    child: Text(
                      '$item',
                      style: textDarkRegularBG(context),
                    ),
                    value: item,
                  );
                }).toList(),
              ),
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Expanded(
          //         child: titleTextDarkRegularBS(
          //             context, 'IP ADDRESS FOR WIFI PRINTER IN DIRECT MODE')),
          //     Container(
          //       width: 160,
          //       child: regularTextField(
          //         context,
          //         ipAddressTextField(
          //             context, ipAddressEditController, ipAddressFocusNode,
          //             (value) {
          //           FocusScope.of(context).unfocus();
          //         }),
          //       ),
          //     ),
          //   ],
          // ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: titleTextDarkRegularBS(
                    context, 'ENABLE CALL TO WAITER (UPPER BAR)'),
              ),
              GFToggle(
                onChanged: (bool? value) async {
                  await context.read(settingsProvider.notifier)
                      .setEnableCall(value!);
                },
                enabledThumbColor: primary,
                enabledTrackColor: primary.withOpacity(0.3),
                value: settings.tabSetting!.callToWaiter!,
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: titleTextDarkRegularBS(
                    context, 'PAY WHEN YOU MAKE THE COMMAND (KIOSK TYPE)'),
              ),
              GFToggle(
                onChanged: (bool? value) async {
                  await context.read(settingsProvider.notifier)
                      .setPayOnCommand(value!);
                },
                enabledThumbColor: primary,
                enabledTrackColor: primary.withOpacity(0.3),
                value: settings.tabSetting!.payTypeKiosk!,
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: titleTextDarkRegularBS(
                      context, 'VALIDATE PAYMENT / COMMANDS BY WAITER')),
              GFToggle(
                onChanged: (bool? value) async {
                  await context.read(settingsProvider.notifier)
                      .setValidatePayment(value!);
                },
                enabledThumbColor: primary,
                enabledTrackColor: primary.withOpacity(0.3),
                value: settings.tabSetting!.validatePaymentByWaiter!,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget tableNumberTextField(
    BuildContext context,
    controller,
    FocusNode focusNode,
    ValueChanged<String> onFieldSubmitted,
  ) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: controller,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        labelStyle: textDarkLightSmallBR(context),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: InputBorder.none,
      ),
    );
  }

  Widget ipAddressTextField(
    BuildContext context,
    controller,
    FocusNode focusNode,
    ValueChanged<String> onFieldSubmitted,
  ) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: controller,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        labelStyle: textDarkLightSmallBR(context),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: InputBorder.none,
      ),
    );
  }
}
