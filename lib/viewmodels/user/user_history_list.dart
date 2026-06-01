import 'package:flutter/material.dart';
import 'package:genshin_import/data/notifiers.dart';
import 'package:genshin_import/data/styles.dart';
import 'package:genshin_import/models/sale.dart';
import 'package:genshin_import/services/auth_service.dart';
import 'package:genshin_import/services/sale_service.dart';
import 'package:genshin_import/widgets/user/user_history_widget.dart';

class UserHistoryList extends StatefulWidget {
  const UserHistoryList({super.key});

  @override
  State<UserHistoryList> createState() => _UserHistoryListState();
}

class _UserHistoryListState extends State<UserHistoryList> {
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
      final userId = await AuthService.getUserId();

      final data = await SaleService.getSalesByUser(userId!);

      setState(() {
        sales = data;
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        if (isLoading)
          const Center(child: CircularProgressIndicator())
        else if (errorMessage != null)
          Center(
            child: Text(errorMessage!, style: TextStyle(color: Colors.red)),
          )
        else if (sales.isEmpty)
          Text(
            "No purchase history found.",
            style: TextStyle(color: GIStyle.text[darkMode.value]),
          )
        else
          Column(
            spacing: 16,
            children: sales
                .map((sale) => UserHistoryWidget(sale: sale))
                .toList(),
          ),
      ],
    );
  }
}
