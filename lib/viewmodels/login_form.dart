import 'package:flutter/material.dart';
import 'package:genshin_import/data/notifiers.dart';
import 'package:genshin_import/data/styles.dart';
import 'package:genshin_import/models/auth_response.dart';
import 'package:genshin_import/pages/admin/admin_widget_tree.dart';
import 'package:genshin_import/pages/user/user_widget_tree.dart';
import 'package:genshin_import/services/auth_service.dart';
import 'package:genshin_import/widgets/card_widget.dart';
import 'package:genshin_import/widgets/text_field_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  Future<void> googleLogin() async {
    try {
      setState(() {
        isLoading = true;
      });

      AuthResponse response = await AuthService.googleLogin();

      final prefs = await SharedPreferences.getInstance();

      await prefs.setString('access_token', response.accessToken);
      await prefs.setInt('user_id', response.userId);
      await prefs.setString('role', response.role);

      if (!mounted) return;

      if (response.role == "admin") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => AdminWidgetTree()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => UserWidgetTree()),
        );
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  Future<void> login() async {
    try {
      setState(() {
        isLoading = true;
      });

      AuthResponse response = await AuthService.login(
        username: usernameController.text,
        password: passwordController.text,
      );

      final prefs = await SharedPreferences.getInstance();

      await prefs.setString('access_token', response.accessToken);

      await prefs.setInt('user_id', response.userId);

      await prefs.setString('role', response.role);

      if (!mounted) return;

      if (response.role == "admin") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => AdminWidgetTree()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => UserWidgetTree()),
        );
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 50,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  "Username",
                  style: TextStyle(color: GIStyle.text[darkMode.value]),
                ),
                TextFieldWidget(controller: usernameController),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  "Password",
                  style: TextStyle(color: GIStyle.text[darkMode.value]),
                ),
                TextFieldWidget(
                  controller: passwordController,
                  obscureText: true,
                ),
              ],
            ),
          ],
        ),
        Center(
          child: Column(
            spacing: 16,
            children: [
              CardWidget(
                isButton: true,
                borderRadius: 100,
                onTap: isLoading ? null : login,
                child: isLoading
                    ? CircularProgressIndicator()
                    : Text(
                        "Login",
                        style: TextStyle(
                          color: GIStyle.inverseText[darkMode.value],
                        ),
                      ),
              ),

              CardWidget(
                isButton: true,
                borderRadius: 100,
                onTap: isLoading ? null : googleLogin,
                child: Row(
                  spacing: 8,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(
                      "https://images.icon-icons.com/2699/PNG/512/google_logo_icon_169090.png",
                      width: 20,
                      height: 20,
                    ),
                    Text(
                      "Sign in with Google",
                      style: TextStyle(
                        color: GIStyle.inverseText[darkMode.value],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
