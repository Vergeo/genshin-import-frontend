import 'package:flutter/material.dart';
import 'package:genshin_import/viewmodels/admin/admin_sale_list.dart';
import 'package:genshin_import/widgets/scrollable_page_widget.dart';

class AdminSales extends StatefulWidget {
  const AdminSales({super.key});

  @override
  State<AdminSales> createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminSales> {
  @override
  Widget build(BuildContext context) {
    return ScrollablePageWidget(child: AdminSaleList());
  }
}
