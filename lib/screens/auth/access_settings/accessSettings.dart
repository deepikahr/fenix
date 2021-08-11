import 'package:fenix_user/common/constant.dart';
import 'package:fenix_user/common/utils.dart';
import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/others/settings/settings.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:fenix_user/widgets/normalText.dart';
import 'package:fenix_user/widgets/textFields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class AccessSettings extends HookWidget {
  final tableNumberFocusNode = FocusNode();
  final franchiseCodeFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final GlobalKey<FormFieldState> formKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    final tableNumberEditController = useTextEditingController();
    final franchiseCodeEditController = useTextEditingController();
    final passwordEditController = useTextEditingController();

    final state = useProvider(accessSettingsProvider);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: Container(
          decoration: new BoxDecoration(color: secondary1, boxShadow: [
            BoxShadow(color: Colors.black45, blurRadius: 20)
          ]),
          child: AppBar(
            backgroundColor: appBarDark,
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
                margin: EdgeInsets.only(left: 16, top: 16),
                decoration: BoxDecoration(
                    color: primary(),
                    borderRadius: BorderRadius.circular(8)),
                child: Icon(
                  Icons.settings,
                  color: secondary1,
                  size: 30,
                ),
              ),
            ),
            centerTitle: true,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 16,),
                titleTextDarkRegularBW(context, Constants.restaurantName),
                titleTextDarkRegularBW17(context, Constants.restaurantAddress),
              ],
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
              SizedBox(height: 65,),
              Center(child: Text('ACCESS_SETTINGS'.tr, style: textDarkLargeBM(context),)),
              SizedBox(height: 25,),
              // regularTextField(
              //   context,
              //   tableNumberTextField(
              //       context,
              //       tableNumberEditController,
              //       tableNumberFocusNode, (value) {
              //     FocusScope.of(context)
              //         .requestFocus(franchiseCodeFocusNode);
              //   }),
              // ),
              // SizedBox(
              //   height: 26,
              // ),
              // regularTextField(
              //   context,
              //   franchiseCodeTextField(context, franchiseCodeEditController,
              //       franchiseCodeFocusNode, (value) {
              //         FocusScope.of(context)
              //             .requestFocus(passwordFocusNode);
              //       }),
              // ),
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
                  await context.read(accessSettingsProvider.notifier).submit(
                    int.parse(DB().getTableNumber()!),
                    DB().getFranchiseCode()!,
                    // int.parse(tableNumberEditController.text),
                    // int.parse(franchiseCodeEditController.text),
                    passwordEditController.text,
                  );
                  if (response != null) {
                    await Get.offAll(() => Settings());
                  }
                }
              }, state.isLoading),

              // if (state.isLoading) GFLoader(type: GFLoaderType.ios),
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
          labelText: 'PASSCODE'.tr,
          labelStyle: textDarkLightSmallBR(context),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          border: InputBorder.none,
          counterText: ''
      ),
    );
  }
}

