import 'package:flutter/material.dart';
import 'package:genshin_import/data/notifiers.dart';
import 'package:genshin_import/data/styles.dart';

class AdminNavbarWidget extends StatefulWidget {
  const AdminNavbarWidget({super.key});

  @override
  State<AdminNavbarWidget> createState() => _AdminNavbarWidgetState();
}

class _AdminNavbarWidgetState extends State<AdminNavbarWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPage,
      builder: (context, page, child) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: GIStyle.navbarBackground[darkMode.value],
          unselectedItemColor: GIStyle.navbarText[darkMode.value],
          selectedItemColor: GIStyle.navbarHighlight[darkMode.value],
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: "Dashboard",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.store_mall_directory_rounded),
              label: "Items",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: "Sales"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          currentIndex: page,
          onTap: (value) {
            setState(() {
              selectedPage.value = value;
            });
          },
        );
      },
    );
  }
}
