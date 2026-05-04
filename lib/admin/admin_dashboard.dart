import 'package:flutter/material.dart';
import 'package:genshin_import/admin/admin_navigation_bar_widget.dart';
import 'package:genshin_import/data/notifiers.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Dashboard"));
  }
}
