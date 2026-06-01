import 'package:flutter/material.dart';
import 'package:genshin_import/data/notifiers.dart';
import 'package:genshin_import/data/styles.dart';
import 'package:genshin_import/models/user.dart';
import 'package:genshin_import/pages/admin/admin_widget_tree.dart';
import 'package:genshin_import/pages/login_register_page.dart';
import 'package:genshin_import/services/auth_service.dart';
import 'package:genshin_import/widgets/card_widget.dart';
import 'package:genshin_import/widgets/scrollable_page_widget.dart';

class AdminProfile extends StatefulWidget {
  const AdminProfile({super.key});

  @override
  State<AdminProfile> createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
  User? user;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    final userId = await AuthService.getUserId();
    final username = await AuthService.getUsername();
    final fullName = await AuthService.getFullName();
    final role = await AuthService.getRole();

    if (!mounted) return;

    setState(() {
      if (userId != null &&
          username != null &&
          fullName != null &&
          role != null) {
        user = User(
          userId: userId,
          username: username,
          fullName: fullName,
          role: role,
        );
      }

      isLoading = false;
    });
  }

  Future<void> logout() async {
    await AuthService.logout();

    if (!mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginRegisterPage()),
      (route) => false,
    );
  }

  Widget buildInfoTile(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: GIStyle.inverseText[darkMode.value].withValues(alpha: 0.7),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            color: GIStyle.inverseText[darkMode.value],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (user == null) {
      return const Center(child: Text("No user logged in"));
    }

    return ScrollablePageWidget(
      child: Column(
        spacing: 24,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              backgroundColor: GIStyle.cardBackground[darkMode.value],
              foregroundColor: GIStyle.inverseText[darkMode.value],
              radius: 60,
              child: Text(
                user!.fullName.substring(0, 1).toUpperCase(),
                style: const TextStyle(fontSize: 40),
              ),
            ),
          ),

          CardWidget(
            width: double.infinity,
            child: Column(
              spacing: 24,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildInfoTile("User ID", user!.userId.toString()),
                buildInfoTile("Username", user!.username),
                buildInfoTile("Full Name", user!.fullName),
                buildInfoTile("Role", user!.role),
              ],
            ),
          ),

          CardWidget(
            width: double.infinity,
            onTap: () {
              darkMode.value = (darkMode.value + 1) % 2;
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => AdminWidgetTree()),
                (route) => false,
              );
            },
            child: Row(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                darkMode.value == 0
                    ? Icon(
                        Icons.light_mode,
                        color: GIStyle.inverseText[darkMode.value],
                      )
                    : Icon(
                        Icons.dark_mode,
                        color: GIStyle.inverseText[darkMode.value],
                      ),
                Text(
                  "Switch Color Mode",
                  style: TextStyle(color: GIStyle.inverseText[darkMode.value]),
                ),
              ],
            ),
          ),

          CardWidget(
            width: double.infinity,
            fillColor: Colors.red,
            onTap: logout,
            child: Row(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.logout, color: GIStyle.white),
                Text("Logout", style: TextStyle(color: GIStyle.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
