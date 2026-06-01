import 'package:flutter/material.dart';
import 'package:genshin_import/data/notifiers.dart';
import 'package:genshin_import/data/styles.dart';
import 'package:genshin_import/pages/admin/admin_dashboard.dart';
import 'package:genshin_import/pages/admin/admin_items.dart';
import 'package:genshin_import/pages/admin/admin_profile.dart';
import 'package:genshin_import/pages/admin/admin_sales.dart';
import 'package:genshin_import/widgets/admin/admin_navbar_widget.dart';

class AdminWidgetTree extends StatefulWidget {
  const AdminWidgetTree({super.key});

  @override
  State<AdminWidgetTree> createState() => _AdminWidgetTreeState();
}

class _AdminWidgetTreeState extends State<AdminWidgetTree> {
  List pages = [AdminDashboard(), AdminItems(), AdminSales(), AdminProfile()];
  List<String> pageTitles = ["Dashboard", "Items", "Sales", "Profile"];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPage,
      builder: (context, page, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: GIStyle.background[darkMode.value],
            title: Text(
              pageTitles[page],
              style: TextStyle(color: GIStyle.text[darkMode.value]),
            ),
          ),
          body: pages[page],
          bottomNavigationBar: AdminNavbarWidget(),
        );
      },
    );
  }
}
