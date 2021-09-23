import 'package:food_template/_qaas/models/Token.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {
  static final String _tokenAccess = 'TOKEN_ACCESS';

  static saveTokenToPref(Token token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_tokenAccess, token.accessToken);
  }

  static Future<String> getTokenAccess() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString(_tokenAccess);
    print('accessToken');
    print(accessToken);
    return accessToken;
  }
}
