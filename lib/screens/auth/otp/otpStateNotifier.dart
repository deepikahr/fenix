import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'otpState.dart';

class OtpStateNotifier extends StateNotifier<OtpState> {
  final API api;
  final DB db;
  OtpStateNotifier(this.api, this.db) : super(OtpState(isLoading: true));

}
