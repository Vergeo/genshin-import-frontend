import 'package:flutter/material.dart';
import 'package:genshin_import/models/sale.dart';
import 'package:genshin_import/services/sale_service.dart';
import 'package:genshin_import/widgets/admin/sale_list_widget.dart';

class AdminSaleList extends StatefulWidget {
  const AdminSaleList({super.key});

  @override
  State<AdminSaleList> createState() => _AdminSaleListState();
}

class _AdminSaleListState extends State<AdminSaleList> {
  List<Sale> sales = [];

  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    loadSales();
  }

  Future<void> loadSales() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final data = await SaleService.getAllSales();

      setState(() {
        sales = data;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        errorMessage = error.toString();
        isLoading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage!),
            backgroundColor: Colors.redAccent,
            action: SnackBarAction(
              label: "RETRY",
              textColor: Colors.white,
              onPressed: loadSales,
            ),
          ),
        );
      }
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

    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (sales.isEmpty)
          Center(child: Text("No sales found"))
        else
          Column(
            spacing: 16,
            children: sales.map((sale) => SaleListWidget(sale: sale)).toList(),
          ),
      ],
    );
  }
}
