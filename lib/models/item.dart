class Item {
  final int itemId;
  final String itemName;
  final String itemType;
  final String itemDescription;
  final int itemStock;
  final String itemImage;
  final double itemPrice;

  Item({
    required this.itemId,
    required this.itemName,
    required this.itemType,
    required this.itemDescription,
    required this.itemStock,
    required this.itemImage,
    required this.itemPrice,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      itemId: int.parse(json['item_id'].toString()),
      itemName: json['item_name'],
      itemType: json['item_type'],
      itemDescription: json['item_description'],
      itemStock: int.parse(json['item_stock'].toString()),
      itemImage: json['item_image'],
      itemPrice: double.parse(json['item_price'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'item_id': itemId,
      'item_name': itemName,
      'item_type': itemType,
      'item_description': itemDescription,
      'item_stock': itemStock,
      'item_image': itemImage,
      'item_price': itemPrice,
    };
  }

  static List<Item> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Item.fromJson(json)).toList();
  }
}
