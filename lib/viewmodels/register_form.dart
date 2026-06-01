import 'package:flutter/material.dart';
import 'package:genshin_import/data/notifiers.dart';
import 'package:genshin_import/data/styles.dart';
import 'package:genshin_import/models/auth_response.dart';
import 'package:genshin_import/pages/admin/admin_widget_tree.dart';
import 'package:genshin_import/pages/user/user_widget_tree.dart';
import 'package:genshin_import/services/auth_service.dart';
import 'package:genshin_import/widgets/card_widget.dart';
import 'package:genshin_import/widgets/text_field_widget.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController fullNameController = TextEditingController();

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    fullNameController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> register() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password and Confirm Password do not match"),
        ),
      );
      return;
    }

    try {
      setState(() {
        isLoading = true;
      });

      AuthResponse response = await AuthService.register(
        username: usernameController.text.trim(),
        password: passwordController.text,
        fullName: fullNameController.text.trim(),
      );

      if (!mounted) return;

      if (response.role == "admin") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const AdminWidgetTree()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const UserWidgetTree()),
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

  Widget buildField(
    String label,
    TextEditingController controller, {
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text(label, style: TextStyle(color: GIStyle.text[darkMode.value])),
        TextFieldWidget(controller: controller, obscureText: obscureText),
      ],
    );
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
            buildField("Full Name", fullNameController),
            buildField("Username", usernameController),
            buildField("Password", passwordController, obscureText: true),
            buildField(
              "Confirm Password",
              confirmPasswordController,
              obscureText: true,
            ),
          ],
        ),

        Center(
          child: CardWidget(
            isButton: true,
            borderRadius: 100,
            onTap: isLoading ? null : register,
            child: isLoading
                ? const CircularProgressIndicator()
                : Text(
                    "Register",
                    style: TextStyle(
                      color: GIStyle.inverseText[darkMode.value],
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
