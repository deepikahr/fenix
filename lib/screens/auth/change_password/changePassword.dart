import 'dart:async';

import 'package:fenix_user/common/utils.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/auth/login/login.dart';
import 'package:fenix_user/screens/home/home_tabs/homeTabs.dart';
import 'package:fenix_user/screens/others/settings/settings.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/alertBox.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:fenix_user/widgets/normalText.dart';
import 'package:fenix_user/widgets/textFields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class ChangePasswordPage extends HookWidget {
  final oldPasswordFocusNode = FocusNode();
  final newPasswordFocusNode = FocusNode();
  final GlobalKey<FormFieldState> formKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> formKey2 = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    final oldPasswordEditController = useTextEditingController();
    final newPasswordEditController = useTextEditingController();

    final state = useProvider(changePasswordProvider);

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
            oldPasswordTextField(
              context,
              formKey,
              oldPasswordEditController,
              oldPasswordFocusNode,
                  (value) {
                    FocusScope.of(context)
                        .requestFocus(newPasswordFocusNode);
                formKey.currentState!.validate();
              },
            ),
          ),
          SizedBox(
            height: 26,
          ),
          regularTextField(
            context,
            newPasswordTextField(
              context,
              formKey2,
              newPasswordEditController,
              newPasswordFocusNode,
                  (value) {
                FocusScope.of(context).unfocus();
                formKey2.currentState!.validate();
              },
            ),
          ),
          SizedBox(
            height: 66,
          ),
          primaryButton(context, 'SUBMIT'.tr, () async {
            if (formKey.currentState!.validate() && formKey2.currentState!.validate()) {
              final response =
              await context.read(changePasswordProvider.notifier).submit(
                oldPasswordEditController.text,
                newPasswordEditController.text,
              );
              if (response != null) {

                Timer(Duration(seconds: 2), () async {
                  await Get.offAll(() => LoginPage());
                });

                await showDialog(
                  barrierColor: secondary,
                  context: context,
                  builder: (BuildContext context) {
                    return blackAlertBox(
                        context,
                        'Changed password successfully'.tr,
                        Image.asset(
                          'lib/assets/icons/done.png',
                          scale: 3,
                        ),
                        null);
                  },
                );
              }
            }
          }),
          if (state.isLoading) GFLoader(),
        ],
      ),
    );
  }

  Widget oldPasswordTextField(
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
          labelText: 'CURRENT PASSWORD'.tr,
          labelStyle: textDarkLightSmallBR(context),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          border: InputBorder.none,
          counterText: ''
      ),
    );
  }

  Widget newPasswordTextField(
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
          labelText: 'NEW PASSWORD'.tr,
          labelStyle: textDarkLightSmallBR(context),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          border: InputBorder.none,
          counterText: ''
      ),
    );
  }
}

