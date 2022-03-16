import 'dart:convert';
import 'dart:developer';

import 'package:fenix_user/models/api_request_models/payment_request/payment_request.dart';
import 'package:fenix_user/models/api_response_models/order_details_response/order_details_response.dart';
import 'package:fenix_user/models/api_response_models/payment_response/payment_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/tip_waiter/tip_waiter_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TipWaiterStateNotifier extends StateNotifier<TipWaiterState> {
  final ProviderReference ref;

  API get api {
    return ref.read(apiProvider);
  }

  TipWaiterStateNotifier(this.ref) : super(TipWaiterState());

  Future<PaymentResponse?> requestPayment(OrderDetailsResponse? order,
      PAYMENT_TYPE? paymentType, int? index) async {
    state = state.copyWith.call(isLoading: true, tipIndex: index);
    log(jsonEncode(order));
    print(paymentType);
    final res = await api.paymentRequest(
      PaymentRequest(
        orderId: order?.id,
        paymentType: paymentType,
        tableNumber: order?.tableNumber,
        amount: order?.grandTotal,
        tipAmount: order?.tipAmount,
      ),
    );
    if (mounted) state = state.copyWith.call(isLoading: false, tipIndex: null);
    return res;
  }
}
