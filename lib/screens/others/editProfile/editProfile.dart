import 'dart:io';

import 'package:flutter/material.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/appbar.dart';
import 'package:restaurant_saas/widgets/buttons.dart';
import 'package:restaurant_saas/widgets/network_image.dart';
import 'package:restaurant_saas/widgets/textFields.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:restaurant_saas/models/api_response_models/profile/profile.dart';
import 'package:restaurant_saas/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/models/api_request_models/profile_request/profile_request.dart';
import 'package:restaurant_saas/widgets/custom_dialog_for_image_section.dart';
import 'package:get/get.dart';

class EditProfile extends HookWidget {
  final Profile? profile;

  final firstNameFocusNode = FocusNode();
  final lastNameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();

  final formKey = GlobalKey<FormState>();

  EditProfile({this.profile});

  @override
  Widget build(BuildContext context) {
    final state = useProvider(editProfileProvider);

    final firstNameEditController = useTextEditingController();
    final lastNameEditController = useTextEditingController();
    final emailEditController = useTextEditingController();

    final isMounted = useIsMounted();

    useEffect(() {
      if (isMounted()) {
        firstNameEditController.text = profile?.firstName ?? '';
        lastNameEditController.text = profile?.lastName ?? '';
        emailEditController.text = profile?.email ?? '';
      }
      return;
    }, const []);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: titleAppbar(context, 'EDIT_PROFILE'.tr),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(children: [
          Center(
            child: profilePicture(
                context,
                state.imageUrl ??
                    (state.isProfilePicRemove
                        ? null
                        : profile!.profilePictureUrl),
                state.isPicLoading,
                state.imageUrl,
                state.isProfilePicRemove),
          ),
          blockTextField(
              context,
              nameTextField(
                  context,
                  firstNameEditController,
                  firstNameFocusNode,
                  (value) =>
                      FocusScope.of(context).requestFocus(firstNameFocusNode),
                  initialValue: profile?.firstName ?? '',
                  labelText: 'FIRST_NAME'.tr)),
          SizedBox(height: 20),
          blockTextField(
              context,
              nameTextField(
                  context,
                  lastNameEditController,
                  lastNameFocusNode,
                  (value) =>
                      FocusScope.of(context).requestFocus(lastNameFocusNode),
                  initialValue: profile?.lastName ?? '',
                  labelText: 'LAST_NAME'.tr)),
          SizedBox(height: 20),
          blockTextField(
              context,
              emailTextField(
                  context,
                  emailEditController,
                  emailFocusNode,
                  (value) =>
                      FocusScope.of(context).requestFocus(emailFocusNode),
                  initialValue: profile?.email ?? '')),
          SizedBox(height: 30),
          primaryBlockButton(context, 'SUBMIT'.tr, () async {
            await context.read(editProfileProvider.notifier).submit(
                ProfileRequest(
                    lastName: lastNameEditController.text,
                    firstName: firstNameEditController.text,
                    email: emailEditController.text));
          }),
        ]),
      ),
    );
  }

  Widget profilePicture(BuildContext context, String? image, bool isPicLoading,
          imageUrl, isProfilePicRemove) =>
      InkWell(
        onTap: () => showDialog(
            context: context,
            builder: (context) => CustomDialogForImageSection(
                  showRemove: imageUrl != null
                      ? true
                      : isProfilePicRemove
                          ? false
                          : profile!.profilePictureUrl != null
                              ? true
                              : false,
                  onTap: (PickedFile image) {
                    context
                        .read(editProfileProvider.notifier)
                        .uploadProfilePic(File(image.path));
                  },
                  onTapRemove: () async {
                    await context
                        .read(editProfileProvider.notifier)
                        .removeProfilePic();
                  },
                )),
        child: isPicLoading
            ? Container(
                height: 100,
                width: 100,
                child: Center(child: GFLoader()),
              )
            : Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                child: Stack(children: [
                  image != null
                      ? networkImage(
                          image,
                          100,
                          100,
                          50,
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          child: Image.asset(
                            'lib/assets/icons/dp.png',
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 1.0,
                            spreadRadius: 1.0,
                          )
                        ],
                      ),
                      child: Image.asset(
                        'lib/assets/icons/addProfile.png',
                        scale: 5,
                      ),
                    ),
                  )
                ]),
              ),
      );

  Widget nameTextField(BuildContext context, controller, FocusNode focusNode,
          ValueChanged<String> onFieldSubmitted,
          {String? initialValue,
          String? labelText,
          TextInputType? textInputType}) =>
      TextFormField(
        controller: controller,
        keyboardType: textInputType ?? TextInputType.text,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: textDarkLightSmallBR(context),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          border: InputBorder.none,
        ),
      );

  Widget emailTextField(BuildContext context, controller, FocusNode focusNode,
          ValueChanged<String> onFieldSubmitted,
          {String? initialValue}) =>
      TextFormField(
        keyboardType: TextInputType.text,
        controller: controller,
        decoration: InputDecoration(
          labelText: 'EMAIL_ID'.tr,
          labelStyle: textDarkLightSmallBR(context),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          border: InputBorder.none,
        ),
      );
}
