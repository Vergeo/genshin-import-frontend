import 'package:flutter/material.dart';
import 'package:genshin_import/data/styles.dart';

class AdminItemEdit extends StatefulWidget {
  const AdminItemEdit({super.key});

  @override
  State<AdminItemEdit> createState() => _AdminItemEditState();
}

class _AdminItemEditState extends State<AdminItemEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Item"),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Item Name"),
            TextFormField(),
            Text("Item Type"),
            TextFormField(),
            Text("Price"),
            TextFormField(),
            Text("Stock"),
            TextFormField(),
            Text("Description"),
            TextFormField(),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: GIStyle.subtext,
                foregroundColor: GIStyle.lightBg,
              ),
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
