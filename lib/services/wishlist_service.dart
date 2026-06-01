import 'dart:convert';

import 'package:genshin_import/models/wishlist.dart';
import 'package:genshin_import/services/base_url.dart';
import 'package:http/http.dart';

class WishlistService {
  static Future<List<Wishlist>> getAllWishlists() async {
    Response response = await get(
      BaseUrl.parseUri('wishlists/get-all-wishlists'),
    );

    if (response.statusCode == 200) {
      return Wishlist.fromJsonList(jsonDecode(response.body));
    }

    throw Exception('Failed to fetch wishlists');
  }

  static Future<Wishlist> getWishlistById(int wishlistId) async {
    Response response = await get(
      BaseUrl.parseUri('wishlists/get-wishlist/$wishlistId'),
    );

    if (response.statusCode == 200) {
      return Wishlist.fromJsonList(jsonDecode(response.body)).first;
    }

    throw Exception('Failed to fetch wishlist');
  }

  static Future<List<Wishlist>> getWishlistByUserAndItem(
    int userId,
    int itemId,
  ) async {
    Response response = await get(
      BaseUrl.parseUri(
        'wishlists/get-wishlists-by-users-items/query?user_id=$userId&item_id=$itemId',
      ),
    );

    if (response.statusCode == 200) {
      return Wishlist.fromJsonList(jsonDecode(response.body));
    }

    throw Exception('Failed to fetch wishlist');
  }

  static Future<Wishlist> createWishlist(Wishlist wishlist) async {
    Response response = await post(
      BaseUrl.parseUri('wishlists/create-wishlist'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(wishlist.toJson()),
    );

    if (response.statusCode == 201) {
      return Wishlist.fromJson(jsonDecode(response.body));
    }

    throw Exception('Failed to create wishlist');
  }

  static Future<void> updateWishlist(int wishlistId, Wishlist wishlist) async {
    Response response = await patch(
      BaseUrl.parseUri('wishlists/update-wishlist/$wishlistId'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(wishlist.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update wishlist');
    }
  }

  static Future<void> deleteWishlist(int wishlistId) async {
    Response response = await delete(
      BaseUrl.parseUri('wishlists/delete-wishlist/$wishlistId'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete wishlist');
    }
  }
}
