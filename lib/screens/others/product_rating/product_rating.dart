import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/models/api_response_models/product/product.dart';
import 'package:restaurant_saas/providers/providers.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/alertBox.dart';
import 'package:restaurant_saas/widgets/appbar.dart';
import 'package:restaurant_saas/widgets/buttons.dart';
import 'package:restaurant_saas/widgets/network_image.dart';
import 'package:restaurant_saas/widgets/normalText.dart';
// import 'package:restaurant_saas/screens/others/product_rating/product_rating_shimmer.dart';

class ProductRating extends HookWidget {
  final String? orderId;
  final Product? productData;
  final focusNode = FocusNode();
  final GlobalKey<FormFieldState> formKey = GlobalKey<FormFieldState>();

  ProductRating({this.productData, this.orderId});

  @override
  Widget build(BuildContext context) {
    final ratingTextFieldController = useTextEditingController();

    final state = useProvider(productRatingProvider);
    final isMounted = useIsMounted();
    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () async {
          context
              .read(productRatingProvider.notifier)
              .setProductRating(productData);
          ratingTextFieldController.text = productData?.rateDescription ?? '';
        });
      }
      return;
    }, const []);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: titleAppbar(context, 'RATE_PRODUCT'.tr),
      body: Stack(
        fit: StackFit.expand,
        children: [
          ListView(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            children: [
              rateCard(
                  context,
                  productData?.productImage?.imageUrl,
                  'lib/assets/images/thankYou.png',
                  'TELL_US_HOW_DELICIOUS_YOUR_FOOD_WAS'.tr,
                  state.rating,
                  ratingTextFieldController),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        child: primaryBlockButton(context, 'SUBMIT_FEEDBACK'.tr, () async {
          final response =
              await context.read(productRatingProvider.notifier).submitMenu(
                    state.rating,
                    ratingTextFieldController.text,
                    orderId,
                    productData?.productId,
                    productData?.sizeName,
                  );

          if (response != null) {
            await customDialog(status: DIALOG_STATUS.SUCCESS, title: response);
            Get.back();
          }
        }),
      ),
    );
  }

  Widget rateCard(BuildContext context, imageURL, image, text, rating,
      ratingTextFieldController) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          imageURL == null
              ? Image.asset(
                  image,
                  scale: 3,
                )
              : networkImage(imageURL,
                  (MediaQuery.of(context).size.width * .8).toInt(), 200, 6),
          SizedBox(
            height: 35,
          ),
          Text(
            text,
            style: textDarkLight2RegularBM(context),
          ),
          SizedBox(
            height: 12,
          ),
          titleTextDarkLightSmallBR(context, 'PLEASE_SUBMIT_YOUR_FEEDBACK'.tr),
          SizedBox(
            height: 25,
          ),
          rating != null && rating > 0
              ? GFRating(
                  itemCount: 5,
                  value: rating ?? 0.0,
                  size: 45,
                  color: primary,
                  allowHalfRating: true,
                  defaultIcon: Icon(
                    Icons.star,
                    color: darkLight3,
                    size: 46,
                  ),
                  onChanged: (value) {
                    context
                        .read(productRatingProvider.notifier)
                        .onRating(value);
                  },
                )
              : Container(),
          SizedBox(
            height: 25,
          ),
          commentTextField(
              context, formKey, ratingTextFieldController, focusNode, (value) {
            FocusScope.of(context).unfocus();
            formKey.currentState!.validate();
          }),
        ],
      ),
    );
  }

  Widget commentTextField(BuildContext context, GlobalKey<FormFieldState> key,
      controller, FocusNode focusNode, ValueChanged<String> onSubmitted) {
    return Container(
      decoration: BoxDecoration(
          color: dark.withOpacity(0.04),
          border: Border.all(color: dark.withOpacity(0.16)),
          borderRadius: BorderRadius.circular(4)),
      child: TextFormField(
        focusNode: focusNode,
        controller: controller,
        key: key,
        keyboardType: TextInputType.multiline,
        onFieldSubmitted: onSubmitted,
        maxLines: 4,
        decoration: InputDecoration(
          labelText: 'TELL_US_YOUR_EXPERIENCE'.tr,
          labelStyle: textDarkLightSmallBR(context),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
