import 'package:flutter/material.dart';
import 'package:genshin_import/data/notifiers.dart';
import 'package:genshin_import/data/styles.dart';
import 'package:genshin_import/viewmodels/login_form.dart';
import 'package:genshin_import/viewmodels/register_form.dart';
import 'package:genshin_import/widgets/card_widget.dart';
import 'package:genshin_import/widgets/page_widget.dart';

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({super.key});

  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  String status = "login";
  @override
  Widget build(BuildContext context) {
    return PageWidget(
      child: Center(
        child: Column(
          spacing: 50,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Genshin Import",
              style: TextStyle(
                color: GIStyle.text[darkMode.value],
                fontSize: 32,
              ),
            ),
            if (status == "login") LoginForm() else RegisterForm(),
            if (status == "login")
              CardWidget(
                borderRadius: 100,
                isButton: true,
                onTap: () => setState(() {
                  status = "register";
                }),
                child: Text(
                  "Register",
                  style: TextStyle(color: GIStyle.inverseText[darkMode.value]),
                ),
              )
            else
              CardWidget(
                borderRadius: 100,
                isButton: true,
                onTap: () => setState(() {
                  status = "login";
                }),
                child: Text(
                  "Go to Login Page",
                  style: TextStyle(color: GIStyle.inverseText[darkMode.value]),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
