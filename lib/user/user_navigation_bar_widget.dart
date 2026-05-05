import 'package:flutter/material.dart';
import 'package:genshin_import/data/notifiers.dart';

class UserNavigationBarWidget extends StatefulWidget {
  const UserNavigationBarWidget({super.key});

  @override
  State<UserNavigationBarWidget> createState() => _UserNavigationBarWidgetState();
}

class _UserNavigationBarWidgetState extends State<UserNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable:  selectedPageNotifier,
      builder: (BuildContext context, dynamic selectedPage, Widget? child) {
        return NavigationBar(
      destinations: [
        NavigationDestination(
          icon: Icon(Icons.dashboard), 
          label: "Dashboard"
        ),
        
        NavigationDestination(
          icon: Icon(Icons.search), 
          label: "Search"
        ),
        
        NavigationDestination(
          icon: Icon(Icons.history), 
          label: "History"
        ),

        NavigationDestination(
          icon: Icon(Icons.person), 
          label: "Profile"
        )
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