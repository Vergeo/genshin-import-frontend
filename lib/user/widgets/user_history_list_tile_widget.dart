import 'package:flutter/material.dart';
import 'package:genshin_import/admin/admin_item_detail.dart';
import 'package:genshin_import/data/styles.dart';

class UserHistoryListTileWidget extends StatelessWidget {
  const UserHistoryListTileWidget({
    super.key,
    required this.itemName,
    required this.price,
  });

  final String itemName;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (context) => const AdminItemDetail(),
              ),
            );
          },
          child: Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [GIStyle.text, GIStyle.subtext, GIStyle.orange],
              ),
            ),
            child: ListTile(
              title: Text(itemName, style: GIStyle.header2Light),
              subtitle: Text("\$$price", style: GIStyle.subHeaderLight),
              trailing: Image.asset("assets/images/staff_of_homa.png"),
            ),
          ),
        ),

        ElevatedButton(
          onPressed: () {
            
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: GIStyle.subtext,
              foregroundColor: GIStyle.lightBg,
          ),
          child: Text("Repurchase")
        )
      ],
    );
  }
}
