import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/category_response/category_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'categoryState.dart';

class CategoryStateNotifier extends StateNotifier<CategoryState> {
  final API api;
  final DB db;
  CategoryStateNotifier(this.api, this.db) : super(CategoryState(isLoading: true));

  Future<CategoryResponse?> fetchCategory(type, page, limit) async {
    state = state.copyWith.call(isLoading: true);
    final response = await api.category(type, page, limit);
    state = state.copyWith.call(
      category: response,
      isLoading: false,
    );
  }


}
