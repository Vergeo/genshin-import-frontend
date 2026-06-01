import 'package:flutter/material.dart';
import 'package:genshin_import/data/notifiers.dart';
import 'package:genshin_import/data/styles.dart';
import 'package:genshin_import/viewmodels/admin/admin_empty_stock.dart';
import 'package:genshin_import/viewmodels/admin/admin_total_sale.dart';
import 'package:genshin_import/widgets/page_widget.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return PageWidget(
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total Sale",
                style: TextStyle(
                  fontSize: 20,
                  color: GIStyle.text[darkMode.value],
                ),
              ),
              AdminTotalSale(),
            ],
          ),
          Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Empty Stock",
                style: TextStyle(
                  fontSize: 20,
                  color: GIStyle.text[darkMode.value],
                ),
              ),
              AdminEmptyStock(),
            ],
          ),
        ],
      ),
    );
  }
}
