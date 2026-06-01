import 'dart:convert';

import 'package:genshin_import/helper/auth_headers.dart';
import 'package:genshin_import/models/sale.dart';
import 'package:genshin_import/models/top_sale.dart';
import 'package:genshin_import/services/base_url.dart';
import 'package:http/http.dart';

class SaleService {
  static Future<List<Sale>> getAllSales() async {
    Response response = await get(
      BaseUrl.parseUri('sales/get-all-sales'),
      headers: await AuthHeaders.headers,
    );

    if (response.statusCode == 200) {
      return Sale.fromJsonList(jsonDecode(response.body));
    }

    throw Exception('Failed to fetch sales');
  }

  static Future<Sale> getSaleById(int salesId) async {
    Response response = await get(
      BaseUrl.parseUri('sales/get-sale/$salesId'),
      headers: await AuthHeaders.headers,
    );

    if (response.statusCode == 200) {
      return Sale.fromJsonList(jsonDecode(response.body)).first;
    }

    throw Exception('Failed to fetch sale');
  }

  static Future<List<Sale>> getSalesByUser(int userId) async {
    Response response = await get(
      BaseUrl.parseUri('sales/get-sales-by-users/$userId'),
      headers: await AuthHeaders.headers,
    );

    if (response.statusCode == 200) {
      return Sale.fromJsonList(jsonDecode(response.body));
    }

    throw Exception('Failed to fetch sales');
  }

  static Future<List<TopSale>> getTopSales() async {
    Response response = await get(
      BaseUrl.parseUri('sales/get-top-sales'),
      headers: await AuthHeaders.headers,
    );

    if (response.statusCode == 200) {
      return TopSale.fromJsonList(jsonDecode(response.body));
    }

    throw Exception('Failed to fetch top sales');
  }

  static Future<double> getTotalSale() async {
    Response response = await get(
      BaseUrl.parseUri('sales/get-total-sale'),
      headers: await AuthHeaders.headers,
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return double.parse(data['total_sale'].toString());
    }

    throw Exception('Failed to fetch total sale');
  }

  static Future createSale(Sale sale) async {
    Response response = await post(
      BaseUrl.parseUri('sales/create-sale'),
      headers: await AuthHeaders.headers,
      body: jsonEncode(sale.toJson()),
    );

    if (response.statusCode == 400) {
      throw Exception(jsonDecode(response.body)['message']);
    }

    if (response.statusCode != 201) {
      throw Exception('Failed to create sale');
    }
  }

  static Future<void> updateSale(int salesId, Sale sale) async {
    Response response = await patch(
      BaseUrl.parseUri('sales/update-sale/$salesId'),
      headers: await AuthHeaders.headers,
      body: jsonEncode(sale.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update sale');
    }
  }

  static Future<void> deleteSale(int salesId) async {
    Response response = await delete(
      BaseUrl.parseUri('sales/delete-sale/$salesId'),
      headers: await AuthHeaders.headers,
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete sale');
    }
  }
}
