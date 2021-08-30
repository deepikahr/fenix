import 'package:fenix_user/common/constant.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotifyWaiter extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final state = useProvider(notifyWaiterProvider);
    final notifier = useProvider(notifyWaiterProvider.notifier);

    return Container(
        color: light,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  Center(
                      child: Text('${'NOTICE_TO_THE_WAITER'.tr}',
                          style: textBlackLargeBM(context))),
                  SizedBox(height: 20),
                  requestBlock(context, Constants.notifyList, notifier),
                ],
              ),
            ),
            if (state.isLoading) GFLoader(type: GFLoaderType.ios)
          ],
        ));
  }

  requestBlock(BuildContext context, notification, notifier) {
    return ListView.builder(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: notification.length,
        itemBuilder: (BuildContext context, int i) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              custombuttonsmFW(context, notification[i] ?? '', () async {
                final response =
                    await notifier.callWaiter(notification[i], notification[i]);
                if (response != null) Fluttertoast.showToast(msg: '$response');
              }),
              SizedBox(height: 30),
            ],
          );
        });
  }
}
