import 'package:flutter/material.dart';
import 'package:genshin_import/admin/admin_dashboard.dart';
import 'package:genshin_import/admin/admin_items.dart';
import 'package:genshin_import/admin/widgets/admin_navigation_bar_widget.dart';
import 'package:genshin_import/admin/admin_profile.dart';
import 'package:genshin_import/data/styles.dart';
import 'package:genshin_import/data/notifiers.dart';

class AdminWidgetTree extends StatefulWidget {
  const AdminWidgetTree({super.key});

  @override
  State<AdminWidgetTree> createState() => _AdminWidgetTreeState();
}

class _AdminWidgetTreeState extends State<AdminWidgetTree> {
  List pages = [AdminDashboard(), AdminItems(), AdminProfile()];

  List<dynamic> pageTitles = ["Dashboard", "Items", "Profile"];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              pageTitles[selectedPage],
              style: TextStyle(color: GIStyle.text),
            ),
          ),
          body: pages[selectedPage],
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: GIStyle.bg,
            foregroundColor: GIStyle.text,
            child: Icon(Icons.add),
          ),
          bottomNavigationBar: AdminNavigationBarWidget(),
        );
      },
    );
  }
}
