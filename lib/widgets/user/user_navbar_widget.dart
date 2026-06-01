import 'package:flutter/material.dart';
import 'package:genshin_import/data/notifiers.dart';
import 'package:genshin_import/data/styles.dart';

class UserNavbarWidget extends StatefulWidget {
  const UserNavbarWidget({super.key});

  @override
  State<UserNavbarWidget> createState() => _UserNavbarWidgetState();
}

class _UserNavbarWidgetState extends State<UserNavbarWidget> {
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
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: "History",
            ),
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
