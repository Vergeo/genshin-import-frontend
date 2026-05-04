import 'package:flutter/material.dart';
import 'package:genshin_import/login_page.dart';
import 'package:genshin_import/user/user_dashboard.dart';
import 'package:genshin_import/user/user_widget_tree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Genshin Import",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: "Genshin",
      ),
      home: const UserWidgetTree(),
    );
  }
}
