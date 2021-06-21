import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/screens/others/editProfile/editProfileState.dart';
import 'package:restaurant_saas/network/api_service.dart';
import 'package:restaurant_saas/widgets/alertBox.dart';
import 'package:restaurant_saas/models/api_request_models/image_request/image_request.dart';

class EditProfileStateNotifier extends StateNotifier<EditProfileState> {
  final API api;
  EditProfileStateNotifier(this.api) : super(EditProfileState());

  Future<void> submit(profileRequest) async {
    state = state.copyWith(isLoading: true);
    final response = await api.updateProfile(profileRequest);
    if (response != null) {
      await customDialog(
        icon: Image.asset(
          'lib/assets/icons/done.png',
          scale: 3,
        ),
        title: response.toString(),
      );
    }
    state = state.copyWith(isLoading: false);
  }

  Future<void> uploadProfilePic(File selectedImage) async {
    state = state.copyWith(isPicLoading: true);
    var formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(selectedImage.path,
          filename: selectedImage.path.split('/').last),
    });
    final res = await api.uploadImage(formData);

    final result = await api.updateProfileImage(ImageRequest(
        profilePictureUrl: res?.url,
        profilePictureId: res?.key,
        profilePictureFilePath: res?.filePath));
    if (result != null) {
      state = state.copyWith(imageUrl: res?.url);
    }

    state = state.copyWith(isPicLoading: false);
  }

  Future<void> removeProfilePic() async {
    state = state.copyWith(isPicLoading: true);

    final result = await api.removeProfilePic();
    if (result != null) {
      state = state.copyWith(isProfilePicRemove: true);
      state = state.copyWith(imageUrl: null);
    }
    state = state.copyWith(isPicLoading: false);
  }
}
