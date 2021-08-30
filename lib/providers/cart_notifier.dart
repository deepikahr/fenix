import 'dart:convert';

import 'package:fenix_user/models/api_request_models/cart/cart.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartNotifier extends StateNotifier<Cart?> {
  CartNotifier({
    Cart? cart,
  }) : super(cart);

  Future<void> updateCart(Cart? cart) async {
    state = cart;
    await _saveCart(cart);
  }

  Future<void> deleteCart() async {
    state = null;
    await _deleteCart();
  }

  Future<void> _saveCart(Cart? cart) async {
    final box = Hive.box('user');
    await box.put('cart', cart != null ? json.encode(cart.toJson()) : null);
  }

  Future<void> _deleteCart() async {
    final box = Hive.box('user');
    await box.delete('cart');
    await box.deleteAll(['cart', 'orderNumber', 'orderId']);
  }
}
