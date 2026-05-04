import 'package:flutter/material.dart';
import 'package:genshin_import/admin/admin_analytics.dart';
import 'package:genshin_import/admin/admin_dashboard.dart';
import 'package:genshin_import/admin/admin_items.dart';
import 'package:genshin_import/admin/admin_navigation_bar_widget.dart';
import 'package:genshin_import/admin/admin_profile.dart';
import 'package:genshin_import/data/notifiers.dart';

class AdminWidgetTree extends StatefulWidget {
  const AdminWidgetTree({super.key});

  @override
  State<AdminWidgetTree> createState() => _AdminWidgetTreeState();
}

class _AdminWidgetTreeState extends State<AdminWidgetTree> {
  List pages = [
    AdminDashboard(),
    AdminAnalytics(),
    AdminItems(),
    AdminProfile(),
  ];

  List<dynamic> pageTitles = ["Dashboard", "Analytics", "Items", "Profile"];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              pageTitles[selectedPage],
              style: TextStyle(fontFamily: "Genshin"),
            ),
          ),
          body: pages[selectedPage],
          bottomNavigationBar: AdminNavigationBarWidget(),
        );
      },
    );
  }
}
