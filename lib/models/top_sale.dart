import 'package:genshin_import/models/item.dart';

class TopSale {
  final Item item;
  final int totalQuantity;

  TopSale({required this.item, required this.totalQuantity});

  factory TopSale.fromJson(Map<String, dynamic> json) {
    return TopSale(
      totalQuantity: int.parse(json['total_quantity'].toString()),
      item: Item.fromJson(json),
    );
  }

  static List<TopSale> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => TopSale.fromJson(json)).toList();
  }
}
