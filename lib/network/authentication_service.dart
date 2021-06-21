import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthenticationService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<String?> googleSignIn() async {
    try {
      final user = await _googleSignIn.signIn();
      if (user != null) {
        final authDetails = await user.authentication;
        return authDetails.accessToken;
      }
    } catch (error) {
      print(error.toString());
    }
    return null;
  }

  Future<String?> facebookSignIn() async {
    try {
      // by default the login method has the next permissions ['email','public_profile']
      var loginResult = await FacebookAuth.instance.login();
      return loginResult.accessToken!.token;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
