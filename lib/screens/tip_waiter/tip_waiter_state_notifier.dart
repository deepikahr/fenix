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
}