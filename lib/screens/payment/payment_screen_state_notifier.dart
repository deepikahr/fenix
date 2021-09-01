import 'package:fenix_user/models/api_request_models/payment_request/payment_request.dart';
import 'package:fenix_user/models/api_response_models/order_details_response/order_details_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/payment/payment_screen_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PaymentScreenStateNotifier extends StateNotifier<PaymentScreenState> {
  final ProviderReference ref;

  API get api {
    return ref.read(apiProvider);
  }

  PaymentScreenStateNotifier(this.ref) : super(PaymentScreenState());

  Future<String?> requestPayment(
      OrderDetailsResponse? order, PAYMENT_TPES buttonName) async {
    state = state.copyWith.call(isLoading: true, buttonName: buttonName);
    final res = await api.paymentRequest(PaymentRequest(
      orderId: order?.id,
      paymentType: buttonName,
      tableNumber: order?.tableNumber,
      amount: order?.grandTotal,
    ));
    state = state.copyWith.call(isLoading: false, buttonName: null);
    return res;
  }
}
