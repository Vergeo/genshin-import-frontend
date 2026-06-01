import 'dart:convert';

import 'package:genshin_import/helper/auth_headers.dart';
import 'package:genshin_import/models/user.dart';
import 'package:genshin_import/services/base_url.dart';
import 'package:http/http.dart';

class UserService {
  static Future<List<User>> getAllUsers() async {
    Response response = await get(
      BaseUrl.parseUri('users/get-all-users'),
      headers: await AuthHeaders.headers,
    );

    if (response.statusCode == 200) {
      return User.fromJsonList(jsonDecode(response.body));
    }

    throw Exception('Failed to fetch users');
  }

  static Future<User> getUserById(int userId) async {
    Response response = await get(
      BaseUrl.parseUri('users/get-users/$userId'),
      headers: await AuthHeaders.headers,
    );

    if (response.statusCode == 200) {
      return User.fromJsonList(jsonDecode(response.body)).first;
    }

    throw Exception('Failed to fetch user');
  }

  static Future<void> updateUser(
    int userId, {
    String? username,
    String? password,
    String? fullName,
    String? role,
  }) async {
    Response response = await patch(
      BaseUrl.parseUri('users/update-users/$userId'),
      headers: await AuthHeaders.headers,
      body: jsonEncode({
        'username': username,
        'password': password,
        'full_name': fullName,
        'role': role,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update user');
    }
  }

  static Future<void> deleteUser(int userId) async {
    Response response = await delete(
      BaseUrl.parseUri('users/delete-users/$userId'),
      headers: await AuthHeaders.headers,
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete user');
    }
  }
}
