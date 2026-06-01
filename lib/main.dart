import 'package:flutter/material.dart';
import 'package:genshin_import/pages/login_register_page.dart';
import 'package:genshin_import/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AuthService.initializeGoogle();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Genshin Import",
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: GIStyle.beige),
        fontFamily: "Genshin",
      ),
      home: const LoginRegisterPage(),
    );
  }
}
