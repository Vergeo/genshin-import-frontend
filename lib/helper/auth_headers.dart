import 'package:shared_preferences/shared_preferences.dart';

class AuthHeaders {
  static Future<Map<String, String>> get headers async {
    final prefs = await SharedPreferences.getInstance();

    final token = prefs.getString('accessToken');

    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }
}
