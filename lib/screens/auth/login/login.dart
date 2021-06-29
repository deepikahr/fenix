import 'package:fenix_user/common/utils.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/auth/change_password/changePassword.dart';
import 'package:fenix_user/screens/home/home_tabs/homeTabs.dart';
import 'package:fenix_user/screens/others/settings/settings.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:fenix_user/widgets/normalText.dart';
import 'package:fenix_user/widgets/textFields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../main.dart';

class LoginPage extends HookWidget {
  final tableNumberFocusNode = FocusNode();
  final franchiseCodeFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final GlobalKey<FormFieldState> formKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    final tableNumberEditController = useTextEditingController();
    final franchiseCodeEditController = useTextEditingController();
    final passwordEditController = useTextEditingController();

    final state = useProvider(loginProvider);

    return Scaffold(
      appBar: AppBar(
        leading:  InkWell(
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
        centerTitle: true,
        title: Column(
          children: [
            titleTextDarkRegularBW(context, "GASTROBAR"),
            titleTextDarkRegularBW17(context, "CALLE LARIOS 12"),
          ],
        ),
      ),
      backgroundColor: light,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          SizedBox(height: 65,),
          Center(child: Text('CÓDIGO DE SEGURIDAD', style: textDarkLargeBM(context),)),
          SizedBox(height: 25,),
          regularTextField(
            context,
            tableNumberTextField(
                context,
                tableNumberEditController,
                tableNumberFocusNode, (value) {
              FocusScope.of(context)
                  .requestFocus(franchiseCodeFocusNode);
            }),
          ),
          SizedBox(
            height: 26,
          ),
          regularTextField(
            context,
            franchiseCodeTextField(context, franchiseCodeEditController,
                franchiseCodeFocusNode, (value) {
                  FocusScope.of(context)
                      .requestFocus(passwordFocusNode);
                }),
          ),
          SizedBox(
            height: 26,
          ),
          regularTextField(
            context,
            passwordTextField(
              context,
              formKey,
              passwordEditController,
              passwordFocusNode,
                  (value) {
                FocusScope.of(context).unfocus();
                formKey.currentState!.validate();
              },
            ),
          ),
          SizedBox(
            height: 66,
          ),
          primaryButton(context, 'SUBMIT'.tr, () async {
            if (formKey.currentState!.validate()) {
              final response =
              await context.read(loginProvider.notifier).submit(
                int.parse(tableNumberEditController.text),
                int.parse(franchiseCodeEditController.text),
                passwordEditController.text,
              );
              if (response != null) {
                  await Get.offAll(() => Settings());
              }
            }
          }),

          if (state.isLoading) GFLoader(),
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
      keyboardType: TextInputType.number,
      controller: controller,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      validator: validateFirstName,
      decoration: InputDecoration(
        labelText: 'TABLE_NUMBER'.tr,
        labelStyle: textDarkLightSmallBR(context),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: InputBorder.none,
      ),
    );
  }

  Widget franchiseCodeTextField(
      BuildContext context,
      controller,
      FocusNode focusNode,
      ValueChanged<String> onFieldSubmitted,
      ) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: controller,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      validator: validateLastName,
      decoration: InputDecoration(
        labelText: 'FRANCHISE_CODE'.tr,
        labelStyle: textDarkLightSmallBR(context),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: InputBorder.none,
      ),
    );
  }

  Widget passwordTextField(
      BuildContext context,
      GlobalKey<FormFieldState> key,
      controller,
      FocusNode focusNode,
      ValueChanged<String> onFieldSubmitted,
      ) {
    return TextFormField(
      key: key,
      keyboardType: TextInputType.phone,
      controller: controller,
      onFieldSubmitted: onFieldSubmitted,
      focusNode: focusNode,
      maxLength: 6,
      obscureText: true,
      validator: validateOtp,
      decoration: InputDecoration(
        labelText: 'PASSWORD'.tr,
        labelStyle: textDarkLightSmallBR(context),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: InputBorder.none,
        counterText: ''
      ),
    );
  }
}

