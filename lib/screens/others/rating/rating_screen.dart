import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/providers/providers.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/alertBox.dart';
import 'package:restaurant_saas/widgets/appbar.dart';
import 'package:restaurant_saas/widgets/buttons.dart';
import 'package:restaurant_saas/widgets/normalText.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:restaurant_saas/screens/others/rating/shimmer_rating.dart';

class RatingScreen extends HookWidget {
  final String? orderId, deliveryBoyId, franchiseId;
  final focusNode = FocusNode();
  final GlobalKey<FormFieldState> formKey = GlobalKey<FormFieldState>();

  RatingScreen({this.orderId, this.deliveryBoyId, this.franchiseId});

  @override
  Widget build(BuildContext context) {
    final deliveryBoyRatingTextFieldController = useTextEditingController();
    final foodRatingTextFieldController = useTextEditingController();

    final state = useProvider(ratingProvider);
    final isMounted = useIsMounted();
    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () async {
          final res = await context
              .read(ratingProvider.notifier)
              .getFoodDeliveryBoyRating(orderId);

          deliveryBoyRatingTextFieldController.text =
              res?.deliveryBoyRating?.description ?? '';

          foodRatingTextFieldController.text =
              res?.restaurantRating?.description ?? '';
        });
      }
      return;
    }, const []);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: titleAppbar(context, 'RATE'.tr),
      body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            children: [
              Container(
                  padding: EdgeInsets.all(16),
                  height: 65,
                  child: Row(
                    children: [
                      categoryTabButton(context, 'DELIVERY'.tr, () {
                        context
                            .read(ratingProvider.notifier)
                            .onDeliverySelect();
                      }, state.showDeliveryRating),
                      SizedBox(
                        width: 6,
                      ),
                      categoryTabButton(context, 'FOOD'.tr, () {
                        context.read(ratingProvider.notifier).onFoodSelect();
                      }, state.showFoodRating),
                    ],
                  )),
              greyDivider(context),
              state.showDeliveryRating
                  ? rateCard(
                      context,
                      'lib/assets/images/rating.png',
                      '${'YourYOUR_ORDER_WAS_DELIVERED_BY'.tr} John Doe',
                      state.ratingData?.deliveryBoyRating,
                      deliveryBoyRatingTextFieldController,
                      state.deliveryBoyRating,
                      state.showDeliveryRating)
                  : rateCard(
                      context,
                      'lib/assets/images/thankYou.png',
                      '${'TELL_US_HOW_DELICIOUS_YOUR_FOOD_WAS'.tr}',
                      state.ratingData?.restaurantRating,
                      foodRatingTextFieldController,
                      state.restuarantRating,
                      state.showDeliveryRating),
            ],
          ),
          if (state.isLoading)
            Container(color: Colors.white, child: shimmerProductRating())
        ],
      ),
      bottomNavigationBar: state.isLoading
          ? Container(height: 1)
          : Container(
              padding: EdgeInsets.all(16),
              child:
                  primaryBlockButton(context, 'SUBMIT_FEEDBACK'.tr, () async {
                if (state.showDeliveryRating) {
                  final response = await context
                      .read(ratingProvider.notifier)
                      .submitDeliveryBoy(
                        state.deliveryBoyRating,
                        deliveryBoyRatingTextFieldController.text,
                        orderId,
                        deliveryBoyId,
                      );

                  if (response != null) {
                    await customDialog(
                        status: DIALOG_STATUS.SUCCESS, title: response);
                    Get.back();
                  }
                } else {
                  final response =
                      await context.read(ratingProvider.notifier).submitFood(
                            state.deliveryBoyRating,
                            foodRatingTextFieldController.text,
                            orderId,
                            franchiseId,
                          );

                  if (response != null) {
                    await customDialog(title: response);
                    Get.back();
                  }
                }
              }),
            ),
    );
  }

  Widget rateCard(BuildContext context, image, text, ratingdata,
      ratingTextFieldController, rating, callRatingFunction) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Image.asset(
            image,
            scale: 3,
          ),
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
          GFRating(
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
              if (callRatingFunction) {
                context
                    .read(ratingProvider.notifier)
                    .onDeliveryBoyRating(value);
              } else {
                context.read(ratingProvider.notifier).onFoodRating(value);
              }
            },
          ),
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
