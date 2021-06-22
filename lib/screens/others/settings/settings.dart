import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:getwidget/components/rating/gf_rating.dart';
import 'package:getwidget/getwidget.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/buttons.dart';
import 'package:restaurant_saas/widgets/normalText.dart';
import 'package:restaurant_saas/widgets/textFields.dart';

class Settings extends HookWidget {
  double _rating = 3;
  final List<String> items = <String>[
    "red",
    "blue",
    "black",
    "Primary",
  ];
  String? selectedItem = 'Primary';
  @override
  Widget build(BuildContext context) {
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
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              primaryButtonSmall(context, 'OK', () {}),
              primaryButton(context, 'SALIR', () {}),
            ],
          ),
        ),
        body: Container(
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
                      // setState(() {
                      //   _rating = value;
                      // }
                      // );
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  titleTextDarkRegularBS(context, 'color del tama'),
                  DropdownButton<String>(
                    underline: Container(color: Colors.transparent),
                    iconSize: 40,
                    value: selectedItem,
                    onChanged: (String? string) =>
                        useState(() => selectedItem = string),
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
                        useState(() => selectedItem = string),
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
                      firstNameTextField(
                        context,
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
                        useState(() => selectedItem = string),
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
                        useState(() => selectedItem = string),
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
                    value: false,
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
                        useState(() => selectedItem = string),
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
                      firstNameTextField(
                        context,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  titleTextDarkRegularBS(context, 'carta selecionada'),
                  GFToggle(
                    onChanged: (val) {},
                    enabledThumbColor: Colors.blue,
                    enabledTrackColor: Colors.blue.withOpacity(0.3),
                    value: false,
                  )
                ],
              ),
            ],
          ),
        ));
  }

  Widget firstNameTextField(
    BuildContext context,
    // controller,
    // FocusNode focusNode,
    // ValueChanged<String> onFieldSubmitted,
  ) {
    return TextFormField(
      keyboardType: TextInputType.text,
      // controller: controller,
      // focusNode: focusNode,
      // onFieldSubmitted: onFieldSubmitted,
      // validator: validateFirstName,
      decoration: InputDecoration(
        // labelText: 'FIRST_NAME'.tr,
        labelStyle: textDarkLightSmallBR(context),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: InputBorder.none,
      ),
    );
  }
}
