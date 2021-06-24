import 'dart:html';

import 'package:fenix_user/screens/others/settings/settings.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/normalText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
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
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(12)),
            child: Icon(
              Icons.settings,
              color: secondary1,
              size: 40,
            ),
          ),
        ),
        centerTitle: true,
        title: Column(
          children: [
            titleTextDarkRegularBW(context, "GASTROBAR"),
            titleTextDarkRegularBW17(context, "CALLE LARIOS 12"),
          ],
        ),
      ),
      backgroundColor: light,
      body: ListView(
        children: [
          Text('CÓDIGO DE SEGURIDAD', style: textDarkLargeBM(context),),
          Form(
            key: _formKey,
            child: PinCodeTextField(
              appContext: context,
              length: 6,
              obscureText: true,
              obscuringCharacter: '*',
              obscuringWidget: FlutterLogo(
                size: 24,
              ),
              blinkWhenObscuring: true,
              animationType: AnimationType.fade,
              validator: (v) {
                if (v!.length < 6) {
                  return "Please enter 6 digit otp";
                } else {
                  return null;
                }
              },
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
              ),
              cursorColor: Colors.black,
              animationDuration: Duration(milliseconds: 300),
              enableActiveFill: true,
              keyboardType: TextInputType.number,
              onCompleted: (String pin) {
                // if (mounted) {
                //   setState(() {
                //     enteredOtp = pin;
                //   });
                // }
              }, onChanged: (String value) {  },
            ),

          ),
        ],
      ),
    );
  }
}
