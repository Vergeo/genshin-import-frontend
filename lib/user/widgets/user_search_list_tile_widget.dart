import 'package:flutter/material.dart';
import 'package:genshin_import/data/styles.dart';

class UserSearchListTileWidget extends StatelessWidget {
  final String itemName;
  final int price;

  const UserSearchListTileWidget({
    super.key,
    required this.itemName,
    required this.price
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            
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
      ],
    );
  }
}