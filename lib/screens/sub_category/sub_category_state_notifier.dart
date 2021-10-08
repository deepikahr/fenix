import 'package:fenix_user/models/api_response_models/sub_category_model/sub_category_model.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/sub_category/sub_category_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SubCategoryStateNotifier extends StateNotifier<SubCategoryState> {
  final ProviderReference ref;

  API get api {
    return ref.read(apiProvider);
  }

  SubCategoryStateNotifier(this.ref) : super(SubCategoryState());

  Future<SubCategoryModel?> fetchSubCategory(categoryId) async {
    state = state.copyWith.call(isLoading: true, subCategory: [], total: 0);
    final response = await api.subCategory(categoryId, state.pageNumber);
    if (ref.mounted) {
      state = state.copyWith.call(
        subCategory: response?.data ?? [],
        total: response?.total ?? 0,
        pageNumber: state.pageNumber + 1,
        isLoading: false,
      );
    }
  }
}
