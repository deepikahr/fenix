import 'package:fenix_user/models/api_response_models/order_response/order_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_screen_state.freezed.dart';

@freezed
class CartScreenState with _$CartScreenState {
  const factory CartScreenState(
      {@Default(false) bool isLoading,
      @Default(false) bool isUpdateLoading,
      OrderResponse? orderResponse,
      @Default(0) int currentIndex,
      // @Default([]) List<String> modifiedProducts,
      String? selectedLanguage}) = _Default;
}
