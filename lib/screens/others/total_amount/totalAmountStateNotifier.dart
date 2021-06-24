import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'totalAmountState.dart';

class TotalAmountStateNotifier extends StateNotifier<TotalAmountState> {
  final API api;
  final DB db;
  TotalAmountStateNotifier(this.api, this.db) : super(TotalAmountState(isLoading: true));

}
