import 'dart:async';
import 'package:fenix_user/common/constant.dart';
import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/menu_response/menu_response.dart';
import 'package:fenix_user/models/api_response_models/settings_response/settings_response.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/home/home_tabs/homeTabs.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/alertBox.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:fenix_user/widgets/normalText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:get/get.dart';

class Settings extends HookWidget {

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

    return Scaffold(
      key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 15),
            decoration: new BoxDecoration(color: secondary1, boxShadow: [
              BoxShadow(color: Colors.black45, blurRadius: 20)
            ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 25),
                titleTextDarkRegularBW15(context, "MAC 91:75:1a:ec:9a:c7"),
                SizedBox(height: 5),
                titleTextDarkRegularBW(context, Constants.restaurantName),
                titleTextDarkRegularBW17(context, Constants.restaurantAddress),
              ],
            ),
          ),
          preferredSize: new Size(MediaQuery.of(context).size.width, 110.0),
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            if (state.settings != null && state.menuList != null)
              contentBlock(context, state.settings!, state.menuList!,
                  tableNumberEditController, ipAddressEditController, state),
            if (state.isLoading) Center(child: GFLoader(type: GFLoaderType.ios))
          ],
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              primaryButton(context, 'CANCEL'.tr, () {
                Get.back();
              }, false),
              primaryButton(context, 'UPDATE'.tr, () async {
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
                      state.type ?? state.settings!.tabSetting!.viewType,
                  );
                  if(response != null){
                    Timer(Duration(seconds: 2), () async {
                      await Get.offAll(() => HomeTabs(tabIndex: 0,));
                    });

                    await showDialog(
                      // barrierColor: grey,
                      context: context,
                      builder: (BuildContext context) {
                        return blackAlertBox(
                            context,
                            '$response',
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
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        actions: [
                          flatPrimaryUnderlineButton(
                              context, 'OK'.tr, (){
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
                                  'PLEASE_SELECT_MENU'.tr,
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
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     titleTextDarkRegularBS(context, 'CONNECTION_CODE'.tr),
          //     Row(
          //       children: [
          //         Text('*', style: TextStyle(fontSize: 35)),
          //         Text('*', style: TextStyle(fontSize: 35)),
          //         Text('*', style: TextStyle(fontSize: 35)),
          //         Text('*', style: TextStyle(fontSize: 35)),
          //         Text('*', style: TextStyle(fontSize: 35)),
          //       ],
          //     )
          //   ],
          // ),
          // SizedBox(
          //   height: 8,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleTextDarkRegularBS(context, 'TABLE_NUMBER'.tr),
              titleTextDarkRegularBS(context, '${settings.tableNumber}'),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleTextDarkRegularBS(context, 'TABLE_CAPACITY'.tr),
              titleTextDarkRegularBS(context, '${settings.tableCapacity}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleTextDarkRegularBS(context, 'SELECT_COLOR'.tr),
              DropdownButton<String>(
                underline: Container(color: Colors.transparent),
                iconSize: 20,
                hint: Text(
                  'red',
                  style: textDarkRegularBG(context),
                ),
                value: state.themeColor ?? settings.tabSetting!.themeColour,
                onChanged: (value) async {
                  await context.read(settingsProvider.notifier)
                      .setThemeColor(value!);
                },
                items: <String>[
                  'red',
                  'green','blue', 'yellow'
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
              titleTextDarkRegularBS(context, 'SELECT_MENU'.tr),
              DropdownButton<String>(
                underline: Container(color: Colors.transparent),
                iconSize: 20,
                hint: Text(
                  'CHOOSE_MENU'.tr,
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
              titleTextDarkRegularBS(context, 'CATEGORY_REPRESENTATION'.tr),
              DropdownButton<String>(
                underline: Container(color: Colors.transparent),
                iconSize: 20,
                value: state.type ?? settings.tabSetting!.viewType,
                onChanged: (String? value) async {
                  await context.read(settingsProvider.notifier)
                      .setType(value!);
                },
                items: <String>[
                  'LIST'.tr,
                  'GRID'.tr,
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
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: titleTextDarkRegularBS(
                    context, 'ENABLE_CALL_TO_WAITER'.tr),
              ),
              GFToggle(
                onChanged: (bool? value) async {
                  await context.read(settingsProvider.notifier)
                      .setEnableCall(value!);
                },
                enabledThumbColor: primary(),
                enabledTrackColor: primary().withOpacity(0.3),
                value: settings.tabSetting!.callToWaiter!,
              )
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     titleTextDarkRegularBS(context, 'RESET_CATEGORY'.tr),
          //     GFToggle(
          //       onChanged: (bool? value) async {
          //         await context.read(settingsProvider.notifier)
          //             .setResetCategory(value!);
          //       },
          //       enabledThumbColor: primary(),
          //       enabledTrackColor: primary().withOpacity(0.3),
          //       value: settings.tabSetting!.resetCategory!,
          //     )
          //   ],
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     titleTextDarkRegularBS(context, 'ORDERING_MODE'.tr),
          //     DropdownButton<String>(
          //       underline: Container(color: Colors.transparent),
          //       iconSize: 20,
          //       value: state.orderMode ??settings.tabSetting!.orderingMode,
          //       onChanged: (String? value) async {
          //         await context.read(settingsProvider.notifier)
          //             .setOrderMode(value!);
          //       },
          //       items: <String>['printer', "waiter's app", 'pos link']
          //           .map<DropdownMenuItem<String>>((String item) {
          //         return DropdownMenuItem<String>(
          //           child: Text(
          //             '$item',
          //             style: textDarkRegularBG(context),
          //           ),
          //           value: item,
          //         );
          //       }).toList(),
          //     ),
          //   ],
          // ),
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

          // SizedBox(height: 10),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Expanded(
          //       child: titleTextDarkRegularBS(
          //           context, 'PAY_WHEN_YOU_MAKE_THE_COMMAND_(KIOSK TYPE)'.tr),
          //     ),
          //     GFToggle(
          //       onChanged: (bool? value) async {
          //         await context.read(settingsProvider.notifier)
          //             .setPayOnCommand(value!);
          //       },
          //       enabledThumbColor: primary(),
          //       enabledTrackColor: primary().withOpacity(0.3),
          //       value: settings.tabSetting!.payTypeKiosk!,
          //     )
          //   ],
          // ),
          // SizedBox(height: 10),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Expanded(
          //         child: titleTextDarkRegularBS(
          //             context, 'VALIDATE_PAYMENT_/_COMMANDS_BY_WAITER'.tr)),
          //     GFToggle(
          //       onChanged: (bool? value) async {
          //         await context.read(settingsProvider.notifier)
          //             .setValidatePayment(value!);
          //       },
          //       enabledThumbColor: primary(),
          //       enabledTrackColor: primary().withOpacity(0.3),
          //       value: settings.tabSetting!.validatePaymentByWaiter!,
          //     ),
          //   ],
          // ),
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
