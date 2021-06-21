import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/providers/providers.dart';
import 'package:restaurant_saas/screens/others/htmlPage/htmlSimmer.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/appbar.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HtmlPageScreen extends HookWidget {
  final bool isTermsAndCondition, isAboutUs, isProvacyPolicy, isHelp;

  HtmlPageScreen({
    this.isTermsAndCondition = false,
    this.isAboutUs = false,
    this.isProvacyPolicy = false,
    this.isHelp = false,
  });

  @override
  Widget build(BuildContext context) {
    final state = useProvider(htmlPageScreenProvider);
    final isMounted = useIsMounted();
    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () {
          if (isAboutUs) {
            context.read(htmlPageScreenProvider.notifier).fetchAboutUs();
          }
          if (isTermsAndCondition) {
            context
                .read(htmlPageScreenProvider.notifier)
                .fetchTermsAndCondition();
          }
          if (isHelp) {
            context.read(htmlPageScreenProvider.notifier).fetchHelp();
          }
          if (isProvacyPolicy) {
            context.read(htmlPageScreenProvider.notifier).fetchPrivacyPolicy();
          }
        });
      }
      return;
    }, const []);

    return Scaffold(
        backgroundColor: light,
        appBar: titleAppbar(
            context,
            '${isAboutUs ? 'ABOUT_US' : isTermsAndCondition ? 'TERMS_AND_CONDITIONS' : isProvacyPolicy ? 'PRIVACY_POLICY' : isHelp ? 'PROFILE_HELP' : ''}'
                .tr),
        body: (state.isLoading)
            ? Container(color: Colors.white, child: shimmerHtml())
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  children: [
                    if (isAboutUs)
                      Image.asset(
                        'lib/assets/logo.png',
                        width: 200,
                        height: 200,
                      ),
                    if (isAboutUs) SizedBox(height: 20),
                    if (state.data?.description != null)
                      HtmlWidget(state.data!.description)
                  ],
                ),
              ));
  }
}
