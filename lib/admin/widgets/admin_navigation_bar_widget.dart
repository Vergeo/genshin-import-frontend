import 'package:flutter/material.dart';
import 'package:genshin_import/data/notifiers.dart';

class AdminNavigationBarWidget extends StatefulWidget {
  const AdminNavigationBarWidget({super.key});

  @override
  State<AdminNavigationBarWidget> createState() =>
      _AdminNavigationBarWidgetState();
}

class _AdminNavigationBarWidgetState extends State<AdminNavigationBarWidget> {
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return NavigationBar(
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.dashboard),
              label: "Dashboard",
            ),
            NavigationDestination(
              icon: Icon(Icons.store_mall_directory_rounded),
              label: "Items",
            ),
            NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
          ],
          selectedIndex: selectedPage,
          onDestinationSelected: (value) {
            setState(() {
              selectedPageNotifier.value = value;
            });
          },
        );
      },
    );
  }
}
