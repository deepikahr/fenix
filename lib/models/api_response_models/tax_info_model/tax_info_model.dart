import 'package:freezed_annotation/freezed_annotation.dart';
import '../../base_model.dart';

part 'tax_info_model.freezed.dart';
part 'tax_info_model.g.dart';

@freezed
class TaxInfoModel with BaseModel<TaxInfoModel>, _$TaxInfoModel {
  const TaxInfoModel._();

  const factory TaxInfoModel({
    String? taxName,
    int? taxPercentage,
  }) = _TaxInfoModel;

  factory TaxInfoModel.fromJson(Map<String, dynamic> json) =>
      _$TaxInfoModelFromJson(json);

  @override
  TaxInfoModel fromMap(Map<String, dynamic> map) {
    return TaxInfoModel.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
