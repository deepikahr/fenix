import 'package:fenix_user/models/api_response_models/settings_response/settings_response.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:fenix_user/widgets/normalText.dart';
import 'package:fenix_user/widgets/textFields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:getwidget/components/rating/gf_rating.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/all.dart';

class Settings extends HookWidget {
  double _rating = 3;
  final List<String> items = <String>[
    "red",
    "blue",
    "black",
    "Primary",
  ];
  String selectedItem = 'Primary';

  final tableNumberFocusNode = FocusNode();
  final ipAddressFocusNode = FocusNode();
  final GlobalKey<FormFieldState> formKey = GlobalKey<FormFieldState>();
  final tableNumberEditController = useTextEditingController();
  final ipAddressEditController = useTextEditingController();

  @override
  Widget build(BuildContext context) {


    final state = useProvider(settingsProvider);
    final notifier = useProvider(settingsProvider.notifier);
    final isMounted = useIsMounted();

    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () async {
          await notifier.fetchSettings();
        });
      }
      return;
    }, const []);

    return Scaffold(
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
        body: ListView(
          children: [
            if (state.settings != null)
            contentBlock(context, state.settings!),
            if (state.isLoading)GFLoader()
          ],
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              primaryButtonSmall(context, 'OK', () {}),
              primaryButton(context, 'SALIR', () {}),
            ],
          ),
        )
    );
  }

  Widget contentBlock(BuildContext context, SettingsResponse settings){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: ListView(
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
                onChanged: (value) {
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleTextDarkRegularBS(context, 'color del tama'),
              titleTextDarkRegularBS(context, settings.tabSetting!.themeColour!),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleTextDarkRegularBS(context, 'carta selecionada'),
              DropdownButton<String>(
                underline: Container(color: Colors.transparent),
                iconSize: 40,
                hint: Text('menu selection', style: textDarkRegularBG(context),),
                value: selectedItem,
                onChanged: (String? string) =>
                    useState(() => selectedItem = string!),
                selectedItemBuilder: (BuildContext context) {
                  return items.map<Widget>((String item) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        item,
                        style: textDarkRegularBG(context),
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
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleTextDarkRegularBS(context, 'Table number'),
              titleTextDarkRegularBS(context, settings.tableNumber),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleTextDarkRegularBS(context, 'table capacity'),
              Container(
                width: 160,
                child: regularTextField(
                  context,
                  tableNumberTextField(
                      context,
                      tableNumberEditController,
                      tableNumberFocusNode, (value) {
                    FocusScope.of(context)
                        .requestFocus(ipAddressFocusNode);
                  }
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleTextDarkRegularBS(context, 'carta selecionada'),
              DropdownButton<String>(
                underline: Container(color: Colors.transparent),
                iconSize: 40,
                value: selectedItem,
                onChanged: (String? string) =>
                    useState(() => selectedItem = string!),
                selectedItemBuilder: (BuildContext context) {
                  return items.map<Widget>((String item) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        item,
                        style: textDarkRegularBG(context),
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
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleTextDarkRegularBS(context, 'carta selecionada'),
              DropdownButton<String>(
                underline: Container(color: Colors.transparent),
                iconSize: 40,
                value: selectedItem,
                onChanged: (String? string) =>
                    useState(() => selectedItem = string!),
                selectedItemBuilder: (BuildContext context) {
                  return items.map<Widget>((String item) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        item,
                        style: textDarkRegularBG(context),
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
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleTextDarkRegularBS(context, 'carta selecionada'),
              GFToggle(
                onChanged: (val) {},
                enabledThumbColor: Colors.blue,
                enabledTrackColor: Colors.blue.withOpacity(0.3),
                value: settings.tabSetting!.resetCategory!,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleTextDarkRegularBS(context, 'carta selecionada'),
              DropdownButton<String>(
                underline: Container(color: Colors.transparent),
                iconSize: 40,
                value: selectedItem,
                onChanged: (String? string) =>
                    useState(() => selectedItem = string!),
                selectedItemBuilder: (BuildContext context) {
                  return items.map<Widget>((String item) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        item,
                        style: textDarkRegularBG(context),
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
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleTextDarkRegularBS(context, 'mesa N*'),
              Container(
                width: 160,
                child: regularTextField(
                  context,
                  ipAddressTextField(
                      context,
                      ipAddressEditController,
                      ipAddressFocusNode, (value) {
                    FocusScope.of(context).unfocus();
                  }
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleTextDarkRegularBS(context, 'ENABLE CALL TO WAITER (UPPER BAR)'),
              GFToggle(
                onChanged: (val) {},
                enabledThumbColor: Colors.blue,
                enabledTrackColor: Colors.blue.withOpacity(0.3),
                value: settings.tabSetting!.callToWaiter!,
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleTextDarkRegularBS(context, 'PAY WHEN YOU MAKE THE COMMAND (KIOSK TYPE)'),
              GFToggle(
                onChanged: (val) {},
                enabledThumbColor: Colors.blue,
                enabledTrackColor: Colors.blue.withOpacity(0.3),
                value: settings.tabSetting!.payTypeKiosk!,
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleTextDarkRegularBS(context, 'VALIDATE PAYMENT / COMMANDS BY WAITER'),
              GFToggle(
                onChanged: (val) {},
                enabledThumbColor: Colors.blue,
                enabledTrackColor: Colors.blue.withOpacity(0.3),
                value: settings.tabSetting!.validatePaymentByWaiter!,
              )
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
