import 'package:flutter/material.dart';
import 'package:genshin_import/admin/admin_item_detail.dart';
import 'package:genshin_import/data/styles.dart';

class AdminItemListTileWidget extends StatelessWidget {
  const AdminItemListTileWidget({
    super.key,
    required this.itemName,
    required this.itemStock,
  });

  final String itemName;
  final int itemStock;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
          subtitle: Text("$itemStock stock", style: GIStyle.subHeaderLight),
          trailing: Image.asset("assets/images/staff_of_homa.png"),
        ),
      ),
    );
  }
}
