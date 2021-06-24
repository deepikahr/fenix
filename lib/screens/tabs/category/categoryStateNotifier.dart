import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'categoryState.dart';

class CategoryStateNotifier extends StateNotifier<CategoryState> {
  final API api;
  final DB db;
  CategoryStateNotifier(this.api, this.db) : super(CategoryState(isLoading: true));

}
