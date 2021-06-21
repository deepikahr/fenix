import 'package:restaurant_saas/common/constant.dart';
import 'package:restaurant_saas/models/api_request_models/cart/cart.dart';
import 'package:restaurant_saas/models/api_request_models/cart_stripe_info/cart_stripe_info.dart';
import 'package:restaurant_saas/network/api_service.dart';
import 'package:stripe_payment/stripe_payment.dart';

Future<PaymentIntentResult?> addMoneyToWallet(double amount, API api) async {
  StripePayment.setOptions(
    StripeOptions(
      publishableKey: Constants.stripKey,
    ),
  );

  final paymentMethod = await StripePayment.paymentRequestWithCardForm(
    CardFormPaymentRequest(),
  );

  final res = await api.addMoney(
    amount,
    paymentMethod.id,
    paymentMethod.type,
  );

  PaymentIntentResult? paymentIntent;

  if (res?.clientSecret != null) {
    paymentIntent = await StripePayment.confirmPaymentIntent(
      PaymentIntent(
        clientSecret: res!.clientSecret,
        paymentMethodId: paymentMethod.id,
      ),
    );
  }

  return paymentIntent;
}

Future<PaymentIntentResult?> createOrderViaStripe(Cart cart, API api) async {
  StripePayment.setOptions(
    StripeOptions(
      publishableKey: Constants.stripKey,
    ),
  );

  final paymentMethod = await StripePayment.paymentRequestWithCardForm(
    CardFormPaymentRequest(),
  );

  final paymentCart = cart.copyWith.call(
    paymentType: 'STRIPE',
    paymentInfo: CartStripeInfo(
      paymentMethodId: paymentMethod.id,
      paymentMethodType: paymentMethod.type,
    ),
  );

  final res = await api.createOrder(
    paymentCart,
  );

  PaymentIntentResult? paymentIntent;

  if (res?.clientSecret != null) {
    paymentIntent = await StripePayment.confirmPaymentIntent(
      PaymentIntent(
        clientSecret: res!.clientSecret,
        paymentMethodId: paymentMethod.id,
      ),
    );
  }
  return paymentIntent;
}
