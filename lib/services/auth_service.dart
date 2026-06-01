import 'dart:convert';

import 'package:genshin_import/models/auth_response.dart';
import 'package:genshin_import/services/base_url.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static final GoogleSignIn signIn = GoogleSignIn.instance;

  static Future<void> initializeGoogle() async {
    await signIn.initialize(
      serverClientId:
          "812623446171-rq9v5dcqo4dsp9jpnrnrh1jm6iphoc99.apps.googleusercontent.com",
    );
  }

  static Future<void> _saveAuth(AuthResponse auth) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('accessToken', auth.accessToken);
    await prefs.setInt('userId', auth.userId);
    await prefs.setString('username', auth.username);
    await prefs.setString('fullName', auth.fullName);
    await prefs.setString('role', auth.role);
  }

  static Future<AuthResponse> register({
    required String username,
    required String password,
    required String fullName,
  }) async {
    final response = await post(
      BaseUrl.parseUri('auth/user-register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
        'full_name': fullName,
      }),
    );

    if (response.statusCode == 201) {
      final auth = AuthResponse.fromJson(jsonDecode(response.body));

      await _saveAuth(auth);

      return auth;
    }

    final msg = jsonDecode(response.body)['message'];

    if (msg is List && msg.isNotEmpty) {
      return Future.error(msg.first['msg'] ?? msg.first.toString());
    }

    return Future.error(msg.toString());
  }

  static Future<AuthResponse> login({
    required String username,
    required String password,
  }) async {
    final response = await post(
      BaseUrl.parseUri('auth/user-login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      final auth = AuthResponse.fromJson(jsonDecode(response.body));

      await _saveAuth(auth);

      return auth;
    }

    final msg = jsonDecode(response.body)['message'];

    if (msg is List && msg.isNotEmpty) {
      return Future.error(msg.first['msg'] ?? msg.first.toString());
    }

    return Future.error(msg.toString());
  }

  static Future<AuthResponse> googleLogin() async {
    try {
      final GoogleSignInAccount account = await signIn.authenticate();

      final authentication = account.authentication;

      final response = await post(
        BaseUrl.parseUri('auth/google-login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'google_token': authentication.idToken}),
      );

      if (response.statusCode != 200) {
        throw Exception(
          jsonDecode(response.body)['message'] ?? 'Google login failed',
        );
      }

      final auth = AuthResponse.fromJson(jsonDecode(response.body));

      await _saveAuth(auth);

      return auth;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<void> logout() async {
    try {
      await signIn.signOut();
    } catch (_) {}

    final prefs = await SharedPreferences.getInstance();

    await prefs.remove('accessToken');
    await prefs.remove('userId');
    await prefs.remove('username');
    await prefs.remove('fullName');
    await prefs.remove('role');
  }

  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken');
  }

  static Future<int?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('userId');
  }

  static Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }

  static Future<String?> getFullName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('fullName');
  }

  static Future<String?> getRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('role');
  }

  static Future<bool> isLoggedIn() async {
    final token = await getAccessToken();

    return token != null && token.isNotEmpty;
  }
}
