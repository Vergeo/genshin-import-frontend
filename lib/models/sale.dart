import 'package:genshin_import/models/item.dart';

class Sale {
  final int salesId;
  final int userId;
  final int itemId;
  final int quantity;
  final Item item;

  Sale({
    required this.salesId,
    required this.userId,
    required this.itemId,
    required this.quantity,
    required this.item,
  });

  factory Sale.fromJson(Map<String, dynamic> json) {
    return Sale(
      salesId: json['sales_id'],
      userId: json['user_id'],
      itemId: json['item_id'],
      quantity: json['quantity'],
      item: Item.fromJson(json),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sales_id': salesId,
      'user_id': userId,
      'item_id': itemId,
      'quantity': quantity,
    };
  }

  static List<Sale> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Sale.fromJson(json)).toList();
  }
}
