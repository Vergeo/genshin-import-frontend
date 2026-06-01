import 'package:flutter/material.dart';
import 'package:genshin_import/models/top_sale.dart';
import 'package:genshin_import/services/sale_service.dart';
import 'package:genshin_import/widgets/user/user_item_grid_widget.dart';

class UserBestsellingList extends StatefulWidget {
  const UserBestsellingList({super.key});

  @override
  State<UserBestsellingList> createState() => _UserBestsellingListState();
}

class _UserBestsellingListState extends State<UserBestsellingList> {
  List<TopSale> topSales = [];

  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    loadTopSales();
  }

  Future<void> loadTopSales() async {
    try {
      final data = await SaleService.getTopSales();

      setState(() {
        topSales = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (errorMessage != null) {
      return Center(child: Text(errorMessage!));
    }

    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.98,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      shrinkWrap: true,

      physics: NeverScrollableScrollPhysics(),
      children: topSales.map((sale) {
        return UserItemGridWidget(item: sale.item);
      }).toList(),
    );
  }
}
