import 'package:fenix_user/models/api_response_models/category_response/category_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/category/category_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoryStateNotifier extends StateNotifier<CategoryState> {
  final ProviderReference ref;

  API get api {
    return ref.read(apiProvider);
  }

  CategoryStateNotifier(this.ref) : super(CategoryState());

  Future<CategoryResponse?> fetchCategory(type) async {
    state = state.copyWith.call(
      isLoading: true,
      category: null,
    );
    final response = await api.category(type, state.pageNumber);
    if (ref.mounted) {
      state = state.copyWith.call(
        category: response ?? [],
        pageNumber: state.pageNumber + 1,
        isLoading: false,
      );
    }
  }
}
