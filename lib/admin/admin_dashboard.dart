import 'package:flutter/material.dart';
import 'package:genshin_import/data/styles.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
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
              Expanded(
                child: Container(
                  color: GIStyle.subtext,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Weapons", style: GIStyle.headerLight),
                        Text("20 items", style: GIStyle.subHeaderLight),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: GIStyle.subtext,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Artifacts", style: GIStyle.headerLight),
                        Text("20 items", style: GIStyle.subHeaderLight),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Total Sale", style: GIStyle.header),
              Text(
                "Rp 1000.00",
                style: TextStyle(fontSize: 32, color: GIStyle.text),
              ),
            ],
          ),
          Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Empty Stock", style: GIStyle.header),
              ListTile(
                title: Text("Staff of Hama", style: GIStyle.header2Light),
                subtitle: Text("Weapon", style: GIStyle.subHeaderLight),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("10", style: GIStyle.header2Light),
                    Text("Wishlisted", style: GIStyle.subHeaderLight),
                  ],
                ),
                tileColor: GIStyle.subtext,
                mouseCursor: MouseCursor.defer,
              ),
              ListTile(
                title: Text(
                  "Crimson Witch of Flames",
                  style: GIStyle.header2Light,
                ),
                subtitle: Text("Artifact", style: GIStyle.subHeaderLight),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("9", style: GIStyle.header2Light),
                    Text("Wishlisted", style: GIStyle.subHeaderLight),
                  ],
                ),
                tileColor: GIStyle.subtext,
                mouseCursor: MouseCursor.defer,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
