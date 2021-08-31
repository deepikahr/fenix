import 'package:fenix_user/common/constant.dart';
import 'package:fenix_user/common/utils.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/settings/settings.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:fenix_user/widgets/normalText.dart';
import 'package:fenix_user/widgets/textFields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
    final notifier = useProvider(loginProvider.notifier);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: Container(
          decoration: new BoxDecoration(
              color: secondary1,
              boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 20)]),
          child: AppBar(
            backgroundColor: appBarDark,
            leading: InkWell(
              onTap: () async {
                await Get.offAll(() => Settings());
              },
              child: Container(
                margin: EdgeInsets.only(left: 16, top: 16),
                decoration: BoxDecoration(
                    color: primary(), borderRadius: BorderRadius.circular(8)),
                child: Icon(
                  Icons.settings,
                  color: secondary1,
                  size: 30,
                ),
              ),
            ),
            centerTitle: true,
            title: Container(
              padding: EdgeInsets.all(16),
              // color: Colors.blueGrey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  titleTextDarkRegularBW(context, Constants.restaurantName),
                  titleTextDarkRegularBW17(
                      context, Constants.restaurantAddress),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: light,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 65,
              ),
              Center(
                  child: Text(
                'LOGIN'.tr,
                style: textDarkLargeBM(context),
              )),
              SizedBox(
                height: 25,
              ),
              regularTextField(
                context,
                tableNumberTextField(
                    context, tableNumberEditController, tableNumberFocusNode,
                    (value) {
                  FocusScope.of(context).requestFocus(franchiseCodeFocusNode);
                }),
              ),
              SizedBox(
                height: 26,
              ),
              regularTextField(
                context,
                franchiseCodeTextField(context, franchiseCodeEditController,
                    franchiseCodeFocusNode, (value) {
                  FocusScope.of(context).requestFocus(passwordFocusNode);
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
                  final response = await notifier.submit(
                    int.parse(tableNumberEditController.text),
                    int.parse(franchiseCodeEditController.text),
                    passwordEditController.text,
                  );
                  if (response != null) {
                    await Get.offAll(() => Settings());
                  }
                }
              }, state.isLoading),
            ],
          ),
        ),
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
      validator: validateTableNumber,
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
      validator: validateFranchiseCode,
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
      validator: validatePassword,
      decoration: InputDecoration(
          labelText: 'PASSCODE'.tr,
          labelStyle: textDarkLightSmallBR(context),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          border: InputBorder.none,
          counterText: ''),
    );
  }
}
