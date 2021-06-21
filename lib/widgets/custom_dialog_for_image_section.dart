import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:restaurant_saas/styles/styles.dart';

class CustomDialogForImageSection extends StatelessWidget {
  final Function? onTap;
  final Function? onTapRemove;
  final bool showRemove;

  const CustomDialogForImageSection(
      {Key? key, this.onTap, this.showRemove = false, this.onTapRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SELECT_PHOTO'.tr,
                style: textPrimarySmallBM(context),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () async {
                  PickedFile? image =
                      await selectImage(source: ImageSource.camera);
                  Get.back();
                  if ((image?.path) != null) {
                    onTap!(image);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'TAKE_PHOTO'.tr,
                        style: textPrimarySmallBM(context),
                      ),
                      Icon(
                        Icons.photo_outlined,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  PickedFile? image =
                      await selectImage(source: ImageSource.gallery);
                  Get.back();
                  if ((image?.path) != null) {
                    onTap!(image);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'CHOOSE_FROM_PHOTO'.tr,
                        style: textPrimarySmallBM(context),
                      ),
                      Icon(
                        Icons.camera_alt,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              if (showRemove)
                InkWell(
                  onTap: () {
                    Get.back();
                    onTapRemove!();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'REMOVE_PIC'.tr,
                          style: textPrimarySmallBM(context),
                        ),
                        Icon(
                          Icons.highlight_remove,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                )
            ],
          ),
        ),
      );

  Future<dynamic> selectImage({ImageSource? source, int? imageQuality}) async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.getImage(
        source: source ?? ImageSource.gallery,
        imageQuality: imageQuality ?? 20);
    return pickedFile;
  }
}
