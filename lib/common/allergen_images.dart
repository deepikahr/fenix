import 'package:collection/src/iterable_extensions.dart';
import 'package:fenix_user/models/api_response_models/allergens_images/allergens_images.dart';

class LocalStoredAllergenImages {
  static final List<AllergenImageModel> _images = [];

  void init(List<AllergenImageModel>? allergenImages) {
    if (allergenImages != null) {
      _images.clear();
      _images.addAll(allergenImages);
    }
  }

  String? getImageForAllergen(String? allergen) {
    final model =
        _images.firstWhereOrNull((element) => element.title == allergen);
    return model?.imageUrl;
  }
}
