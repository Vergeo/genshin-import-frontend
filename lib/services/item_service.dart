import 'dart:convert';

import 'package:genshin_import/helper/auth_headers.dart';
import 'package:genshin_import/models/item.dart';
import 'package:genshin_import/services/base_url.dart';
import 'package:http/http.dart';

class ItemService {
  static Future<List<Item>> getAllItems() async {
    Response response = await get(
      BaseUrl.parseUri("items/get-all-items"),
      headers: await AuthHeaders.headers,
    );

    if (response.statusCode == 200) {
      return Item.fromJsonList(jsonDecode(response.body));
    }

    throw Exception('Failed to fetch items');
  }

  static Future<Item> getItemById(int itemId) async {
    Response response = await get(
      BaseUrl.parseUri("items/get-item/$itemId"),
      headers: await AuthHeaders.headers,
    );

    if (response.statusCode == 200) {
      return Item.fromJsonList(jsonDecode(response.body)).first;
    }

    throw Exception('Failed to fetch item');
  }

  static Future<List<Item>> getItemsByType(String itemType) async {
    Response response = await get(
      BaseUrl.parseUri("items/get-items-by-type/$itemType"),
      headers: await AuthHeaders.headers,
    );

    if (response.statusCode == 200) {
      return Item.fromJsonList(jsonDecode(response.body));
    }

    throw Exception('Failed to fetch items');
  }

  static Future<List<Item>> getEmptyStock() async {
    Response response = await get(
      BaseUrl.parseUri("items/get-empty-stock"),
      headers: await AuthHeaders.headers,
    );

    if (response.statusCode == 200) {
      return Item.fromJsonList(jsonDecode(response.body));
    }

    throw Exception('Failed to fetch items');
  }

  static Future<List<Item>> searchItems(String keyword) async {
    final response = await get(
      BaseUrl.parseUri("items/search/$keyword"),
      headers: await AuthHeaders.headers,
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);

      return data.map((e) => Item.fromJson(e)).toList();
    }

    throw Exception("Failed to search items");
  }

  static Future<Item> createItem(Item item) async {
    Response response = await post(
      BaseUrl.parseUri("items/create-item"),
      headers: await AuthHeaders.headers,
      body: jsonEncode(item.toJson()),
    );

    if (response.statusCode == 201) {
      return Item.fromJson(jsonDecode(response.body));
    }

    final msg = jsonDecode(response.body)['message'];

    if (msg is List && msg.isNotEmpty) {
      return Future.error(msg.first['msg'] ?? msg.first.toString());
    }

    return Future.error(msg.toString());
  }

  static Future<void> updateItem(int itemId, Item item) async {
    Response response = await patch(
      BaseUrl.parseUri("items/update-item/$itemId"),
      headers: await AuthHeaders.headers,
      body: jsonEncode(item.toJson()),
    );

    if (response.statusCode != 200) {
      final msg = jsonDecode(response.body)['message'];

      if (msg is List && msg.isNotEmpty) {
        return Future.error(msg.first['msg'] ?? msg.first.toString());
      }

      return Future.error(msg.toString());
    }
  }

  static Future<void> deleteItem(int itemId) async {
    Response response = await delete(
      BaseUrl.parseUri("items/delete-item/$itemId"),
      headers: await AuthHeaders.headers,
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete item');
    }
  }
}
