import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/models/api_response_models/order/order.dart';
import 'package:restaurant_saas/models/api_response_models/user_to_admin_chat_message_reponse/user_to_admin_chat_message_reponse.dart';
import 'package:restaurant_saas/providers/providers.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/appbar.dart';
import 'package:restaurant_saas/widgets/normalText.dart';
import 'package:get/get.dart';

class UserToAdminChat extends HookWidget {
  final String? orderId;
  final int? orderID;

  UserToAdminChat({this.orderId, this.orderID});

  final focusNode = FocusNode();
  final GlobalKey<FormFieldState> formKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    var _scrollController = ScrollController();
    final sendMessageTextController = useTextEditingController();
    final state = useProvider(userToAdminChatProvider);
    final isMounted = useIsMounted();
    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () {
          context
              .read(userToAdminChatProvider.notifier)
              .socketConnectOrDisconnect(orderId);
        });
      }
      return;
    }, const []);
    if (state.chatData != null) {
      Timer(Duration(milliseconds: 300), () {
        Timer(
            Duration(milliseconds: 300),
            () => _scrollController
                .jumpTo(_scrollController.position.maxScrollExtent));
      });
    }
    return Scaffold(
      backgroundColor: light,
      appBar: titleAppbar(context, '${'CHAT'.tr} : ${orderID ?? ""}'),
      body: state.isLoading
          ? Container(color: Colors.white, child: GFLoader())
          : Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                        padding: EdgeInsets.all(8.0),
                        itemCount: state.chatData!.messages.length,
                        itemBuilder: (BuildContext context, int index) {
                          Map chatData =
                              state.chatData!.messages[index].toJson();
                          var isOwnMessage = false;
                          if (chatData['sentBy'] == 'USER') {
                            isOwnMessage = true;
                          }
                          return chatMessgae(
                              context, chatData['message'] ?? '', isOwnMessage);
                        },
                      ),
                    ),
                    Divider(height: 1.0),
                    state.chatData?.orderStatus == ORDER_STATUS.delivered
                        ? Container()
                        : Container(
                            decoration: BoxDecoration(color: Colors.grey[200]),
                            child: IconTheme(
                              data: IconThemeData(
                                  color: Theme.of(context).accentColor),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: commentTextField(
                                            context,
                                            sendMessageTextController,
                                            focusNode, (value) {
                                          FocusScope.of(context).unfocus();
                                          formKey.currentState!.validate();
                                        }),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.send,
                                            color: primary, size: 30),
                                        onPressed: () {
                                          var chatRequest =
                                              UserToAdminChatMessageReponse(
                                                  orderId: state.chatData?.id,
                                                  adminId:
                                                      state.chatData?.adminId,
                                                  userId: state.profile?.id,
                                                  userName:
                                                      "${state.profile?.firstName ?? ""} ${state.profile?.lastName}",
                                                  message:
                                                      sendMessageTextController
                                                          .text,
                                                  sentBy: 'USER');
                                          context
                                              .read(userToAdminChatProvider
                                                  .notifier)
                                              .sendMessage(chatRequest);
                                          FocusScope.of(context).unfocus();
                                          sendMessageTextController.clear();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ],
                )
              ],
            ),
    );
  }

  Widget commentTextField(BuildContext context, controller, FocusNode focusNode,
      ValueChanged<String> onSubmitted) {
    return Container(
      decoration: BoxDecoration(
          color: dark.withOpacity(0.04),
          border: Border.all(color: dark.withOpacity(0.16)),
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        focusNode: focusNode,
        controller: controller,
        key: key,
        keyboardType: TextInputType.multiline,
        onFieldSubmitted: onSubmitted,
        decoration: InputDecoration(
          labelText: 'TYPE_A_MESSAGE'.tr,
          labelStyle: textDarkLightSmallBR(context),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
