import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/cart/cart.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/providers/cart_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'cartState.dart';

class CartScreenStateNotifier extends StateNotifier<CartScreenState> {
  final API api;
  final DB db;
  final CartNotifier cartState;
  Cart? get cart {
    return cartState.state;
  }

  CartScreenStateNotifier(this.api, this.db, this.cartState)
      : super(CartScreenState());

}
