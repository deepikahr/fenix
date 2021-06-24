import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'productListState.dart';

class ProductListStateNotifier extends StateNotifier<ProductListState> {
  final API api;
  final DB db;
  ProductListStateNotifier(this.api, this.db) : super(ProductListState(isLoading: true));

}
