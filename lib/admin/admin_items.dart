import 'package:flutter/material.dart';
import 'package:genshin_import/admin/widgets/admin_item_list_tile_widget.dart';
import 'package:genshin_import/data/styles.dart';

class AdminItems extends StatefulWidget {
  const AdminItems({super.key});

  @override
  State<AdminItems> createState() => _AdminItemsState();
}

class _AdminItemsState extends State<AdminItems> {
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
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Weapons", style: GIStyle.header),
              AdminItemListTileWidget(itemName: "Staff of Hama", itemStock: 0),
              AdminItemListTileWidget(
                itemName: "Primodial Jade Cutter",
                itemStock: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
