import 'package:flutter/material.dart';
import 'package:genshin_import/admin/admin_widget_tree.dart';
import 'package:genshin_import/data/notifiers.dart';
import 'package:genshin_import/data/styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          spacing: 50,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Genshin Import",
              style: TextStyle(fontSize: 48, color: GIStyle.text),
              textAlign: TextAlign.center,
            ),
            Column(children: [Text("Username"), TextFormField()]),
            Column(children: [Text("Password"), TextFormField()]),
            ElevatedButton(
              onPressed: () {
                selectedPageNotifier.value = 0;

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const AdminWidgetTree(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: GIStyle.subtext,
                foregroundColor: GIStyle.lightBg,
              ),
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
