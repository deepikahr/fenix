import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/htmlDataReponse/htmlDataReponse.dart';
part 'htmlPageScreenState.freezed.dart';

@freezed
class HtmlPageScreenState with _$HtmlPageScreenState {
  const factory HtmlPageScreenState({
    @Default(false) bool isLoading,
    HtmlDataReponse? data,
  }) = _Default;
}
