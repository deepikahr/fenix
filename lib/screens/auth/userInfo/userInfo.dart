import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/common/utils.dart';
import 'package:restaurant_saas/providers/providers.dart';
import 'package:restaurant_saas/screens/home/homeTabs/homeTabs.dart';
import 'package:restaurant_saas/screens/pre_auth/pickLocation/pickLocation.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/appbar.dart';
import 'package:restaurant_saas/widgets/buttons.dart';
import 'package:restaurant_saas/widgets/normalText.dart';
import 'package:restaurant_saas/widgets/textFields.dart';
import 'package:get/get.dart';
import 'package:restaurant_saas/database/db.dart';

final db = DB();

class UserInfo extends HookWidget {
  final firstNameFocusNode = FocusNode();
  final lastNameFocusNode = FocusNode();
  final emailEditFocusNode = FocusNode();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final firstNameEditController = useTextEditingController();
    final lastNameEditController = useTextEditingController();
    final emailEditController = useTextEditingController();

    final state = useProvider(userInfoProvider);

    return Scaffold(
      appBar: introAppbar(context),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: [
                    Image.asset(
                      'lib/assets/images/bg1.png',
                      height: screenHeight(context) * 0.6,
                      width: screenWidth(context),
                      fit: BoxFit.fill,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            titleTextDarkXXLargeBM(context, 'ALMOST_THERE'.tr),
                            SizedBox(
                              height: 12,
                            ),
                            titleTextDarkSmallBR(
                                context, 'PLEASE_ENTER_EMAIL_AND_PHONE'.tr),
                            SizedBox(
                              height: 36,
                            ),
                            regularTextField(
                              context,
                              firstNameTextField(
                                  context,
                                  firstNameEditController,
                                  firstNameFocusNode, (value) {
                                FocusScope.of(context)
                                    .requestFocus(lastNameFocusNode);
                              }),
                            ),
                            SizedBox(
                              height: 26,
                            ),
                            regularTextField(
                              context,
                              lastNameTextField(context, lastNameEditController,
                                  lastNameFocusNode, (value) {
                                FocusScope.of(context)
                                    .requestFocus(emailEditFocusNode);
                              }),
                            ),
                            SizedBox(
                              height: 26,
                            ),
                            regularTextField(
                              context,
                              mailTextField(context, emailEditController,
                                  emailEditFocusNode, (value) {
                                FocusScope.of(context).unfocus();
                              }),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            infoRow(
                              context,
                              'lib/assets/icons/info.png',
                              'PLEASE_ENTER_EMAIL_INVOICE'.tr,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 66,
                ),
                primaryButton(context, 'SUBMIT'.tr, () async {
                  if (formKey.currentState!.validate()) {
                    final response =
                        await context.read(userInfoProvider.notifier).submit(
                              firstNameEditController.text,
                              lastNameEditController.text,
                              emailEditController.text,
                            );

                    if (response.isNotEmpty) {
                      db.saveUserValue(true);
                      var addressInfoFillOrNoy = db.getAddressValue();
                      if (addressInfoFillOrNoy == true) {
                        await Get.offAll(() => HomeTabs());
                      } else {
                        await Get.to(() => PickLocation());
                      }
                    }
                  }
                }),
              ],
            ),
          ),
          if (state.isLoading) GFLoader(),
        ],
      ),
    );
  }

  Widget firstNameTextField(
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
      validator: validateFirstName,
      decoration: InputDecoration(
        labelText: 'FIRST_NAME'.tr,
        labelStyle: textDarkLightSmallBR(context),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: InputBorder.none,
      ),
    );
  }

  Widget lastNameTextField(
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
      validator: validateLastName,
      decoration: InputDecoration(
        labelText: 'LAST_NAME'.tr,
        labelStyle: textDarkLightSmallBR(context),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: InputBorder.none,
      ),
    );
  }

  Widget mailTextField(
    BuildContext context,
    controller,
    FocusNode focusNode,
    ValueChanged<String> onFieldSubmitted,
  ) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      validator: validateEmailAddress,
      decoration: InputDecoration(
        labelText: 'EMAIL_ID'.tr,
        labelStyle: textDarkLightSmallBR(context),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: InputBorder.none,
      ),
    );
  }
}
