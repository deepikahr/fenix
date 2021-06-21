import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/models/api_response_models/manage_address_resposne/manage_address_response.dart';
import 'package:restaurant_saas/models/api_response_models/user_address/user_address.dart';
import 'package:restaurant_saas/network/api_service.dart';

import 'manageAddressState.dart';

class ManageAddressStateNotifier extends StateNotifier<ManageAddressState> {
  final API api;
  ManageAddressStateNotifier(this.api) : super(ManageAddressState());

  Future<ManageAddressReponse?> fetchAddressList() async {
    state = state.copyWith(isLoading: true);
    final res = await api.addressList();
    state = state.copyWith(
        addressList: res?.data ?? [], total: res?.total ?? 0, isLoading: false);
    return res;
  }

  Future<String?> deleteAddress(UserAddress address) async {
    state = state.copyWith(isLoading: true);
    final res = await api.deleteAddress(address.id!);
    await fetchAddressList();
    state = state.copyWith(isLoading: false);
    return res;
  }

  Future<void> setAsDefault(UserAddress address) async {
    state = state.copyWith(isLoading: true);
    await api.updateAddress(address.copyWith(isDefault: true));
    await fetchAddressList();
    state = state.copyWith(isLoading: false);
  }
}
