import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'productDetailsState.dart';

class ProductDetailsStateNotifier extends StateNotifier<ProductDetailsState> {
  final API api;
  final DB db;
  ProductDetailsStateNotifier(this.api, this.db) : super(ProductDetailsState(isLoading: true));

}
