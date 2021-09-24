import 'package:fenix_user/common/utils.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:fenix_user/widgets/textFields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PrinterTestScreen extends HookWidget {
  final ipAddressFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final service = useProvider(printerProvider);
    final ipAddressEditController = useTextEditingController();

    final loading = useState(false);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            regularTextField(
                context,
                ipAddressTextField(context, ipAddressEditController,
                    ipAddressFocusNode, (val) {})),
            primaryButton(context, 'Print', () async {
              loading.value = true;
              final success = await service.printTestReciept();
              if (success) {
                print(' - - - - - - - - - - - - - -  - - - - - -  SUCESSSSS');
              } else {
                print(' - - - - - - - - - - - - - -  - - - - - -  FAILL');
              }
              loading.value = false;
            }, loading.value),
          ],
        ),
      ),
    );
  }

  Widget ipAddressTextField(
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
      validator: validateIpAddress,
      decoration: InputDecoration(
        labelText: 'IP Adress',
        labelStyle: textDarkLightSmallBR(context),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: InputBorder.none,
      ),
    );
  }
}
