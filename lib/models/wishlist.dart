class Wishlist {
  final int wishlistId;
  final int userId;
  final int itemId;

  Wishlist({
    required this.wishlistId,
    required this.userId,
    required this.itemId,
  });

  factory Wishlist.fromJson(Map<String, dynamic> json) {
    return Wishlist(
      wishlistId: json['wishlist_id'],
      userId: json['user_id'],
      itemId: json['item_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'wishlist_id': wishlistId, 'user_id': userId, 'item_id': itemId};
  }

  static List<Wishlist> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Wishlist.fromJson(json)).toList();
  }
}
