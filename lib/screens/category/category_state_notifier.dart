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

  Future<CategoryResponse?> fetchCategory(type,
      [bool startPageNumber = false]) async {
    if (startPageNumber) {
      state = state.copyWith(
        isLoading: true,
        pageNumber: startPageNumber ? 1 : state.pageNumber,
        category: [],
      );
    }
    // state = state.copyWith.call(
    //   isLoading: state.pageNumber == 1 || state.type != type ? true : false,
    //   pageNumber: state.type != type ? 1 : state.pageNumber,
    //   type: type,
    //   category: [],
    // );
    final response = await api.category(type, state.pageNumber);
    if (ref.mounted) {
      state = state.copyWith.call(
        category: [...state.category, ...response ?? []],
        pageNumber: state.pageNumber + 1,
        isLoading: false,
      );
    }
  }
}
