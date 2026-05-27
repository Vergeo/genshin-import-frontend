import 'package:flutter/material.dart';
import 'package:genshin_import/data/notifiers.dart';
import 'package:genshin_import/user/user_dashboard.dart';
import 'package:genshin_import/user/user_history.dart';
import 'package:genshin_import/user/widgets/user_navigation_bar_widget.dart';
import 'package:genshin_import/user/user_profile.dart';
import 'package:genshin_import/user/user_search.dart';

class UserWidgetTree extends StatefulWidget {
  const UserWidgetTree({super.key});

  @override
  State<UserWidgetTree> createState() => _UserWidgetTreeState();
}

class _UserWidgetTreeState extends State<UserWidgetTree> {
  List<Widget> pages = [
    UserDashboard(),
    UserSearch(),
    UserHistory(),
    UserProfile()
  ];
  
  List<dynamic> pageTitles = ["Dashboard", "Search", "History", "Profile"];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return Scaffold(
          appBar: AppBar(title: Text(pageTitles[selectedPage]),),
          body: pages[selectedPage],
          bottomNavigationBar: UserNavigationBarWidget(),
        );
      }
    );
  }
}