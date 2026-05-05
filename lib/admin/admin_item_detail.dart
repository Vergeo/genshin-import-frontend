import 'package:flutter/material.dart';
import 'package:genshin_import/admin/admin_item_edit.dart';
import 'package:genshin_import/data/styles.dart';

class AdminItemDetail extends StatefulWidget {
  const AdminItemDetail({super.key});

  @override
  State<AdminItemDetail> createState() => _AdminItemDetailState();
}

class _AdminItemDetailState extends State<AdminItemDetail> {
  String itemName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Item Detail"),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 16,
              children: [
                Expanded(child: Image.asset("assets/images/staff_of_homa.png")),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Staff of Hama", style: GIStyle.header),
                        Text("Weapon", style: GIStyle.subHeader),
                        Text("Price: 700", style: GIStyle.header2),
                        Text("Stock: 0", style: GIStyle.header2),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (context) => const AdminItemEdit(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: GIStyle.subtext,
                                foregroundColor: GIStyle.lightBg,
                              ),
                              child: Text("Edit"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "To cleanse by fire all that is impure, to allow the impurities to rise with the flames unto the all-accommodating high heavens.\nThese rites would see fresh cinder lit during the rainy seasons, and wolf smoke would arise from those fires as prayers for blessings and the defeat of evil.",
              style: GIStyle.subHeader,
            ),
          ],
        ),
      ),
    );
  }
}
