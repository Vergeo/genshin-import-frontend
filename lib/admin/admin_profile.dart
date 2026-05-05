import 'package:flutter/material.dart';
import 'package:genshin_import/data/styles.dart';
import 'package:genshin_import/login_page.dart';

class AdminProfile extends StatefulWidget {
  const AdminProfile({super.key});

  @override
  State<AdminProfile> createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 16,
            children: [
              CircleAvatar(
                radius: 75,
                backgroundImage: AssetImage("assets/images/asmoday.jpeg"),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Asmodays", style: GIStyle.header),
                      Text("Asmodays HAHAHA", style: GIStyle.header2),
                      Text(
                        "whereisyotwin@traveler.lol",
                        style: GIStyle.subHeader,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: GIStyle.subtext,
              foregroundColor: GIStyle.lightBg,
            ),
            child: Text("Edit Profile"),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: GIStyle.subtext,
              foregroundColor: GIStyle.lightBg,
            ),
            child: Text("Change Password"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: GIStyle.lightBg,
            ),
            child: Text("Logout"),
          ),
        ],
      ),
    );
  }
}
