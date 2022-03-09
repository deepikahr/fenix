import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/qr_screen/qr_screen_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QRScreenStateNotifier extends StateNotifier<QRScreenState> {
  final ProviderReference ref;

  API get api {
    return ref.read(apiProvider);
  }
  QRScreenStateNotifier(this.ref) : super(QRScreenState());
}