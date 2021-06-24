import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'thankYouState.dart';

class ThankYouStateNotifier extends StateNotifier<ThankYouState> {
  final API api;
  final DB db;
  ThankYouStateNotifier(this.api, this.db) : super(ThankYouState(isLoading: true));

}
