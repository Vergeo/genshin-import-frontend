import 'package:flutter/material.dart';
import 'package:genshin_import/data/notifiers.dart';
import 'package:genshin_import/data/styles.dart';
import 'package:genshin_import/pages/user/user_history.dart';
import 'package:genshin_import/pages/user/user_home.dart';
import 'package:genshin_import/pages/user/user_profile.dart';
import 'package:genshin_import/pages/user/user_search.dart';
import 'package:genshin_import/services/auth_service.dart';
import 'package:genshin_import/widgets/user/user_navbar_widget.dart';

class UserWidgetTree extends StatefulWidget {
  const UserWidgetTree({super.key});

  @override
  State<UserWidgetTree> createState() => _UserWidgetTreeState();
}

class _UserWidgetTreeState extends State<UserWidgetTree> {
  String name = "";

  List pages = [UserHome(), UserSearch(), UserHistory(), UserProfile()];

  @override
  void initState() {
    super.initState();
    loadUsername();
  }

  void loadUsername() async {
    final fullName = await AuthService.getUsername();
    setState(() {
      name = fullName as String;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageTitles = [
      "Welcome${name.isNotEmpty ? ', $name' : ''}",
      "Search",
      "History",
      "Profile",
    ];
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
          bottomNavigationBar: UserNavbarWidget(),
        );
      },
    );
  }
}
