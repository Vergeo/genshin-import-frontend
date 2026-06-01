import 'package:flutter/material.dart';
import 'package:genshin_import/data/notifiers.dart';
import 'package:genshin_import/data/styles.dart';
import 'package:genshin_import/models/item.dart';
import 'package:genshin_import/services/item_service.dart';
import 'package:genshin_import/widgets/admin/item_list_widget.dart';
import 'package:genshin_import/widgets/card_widget.dart';

class AdminItemList extends StatefulWidget {
  const AdminItemList({super.key});

  @override
  State<AdminItemList> createState() => _AdminItemListState();
}

class _AdminItemListState extends State<AdminItemList> {
  List<Item> allItems = [];
  List<Item> filteredItems = [];

  int weaponCount = 0;
  int artifactCount = 0;

  bool isLoading = true;
  String? errorMessage;

  String selectedType = "all";

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  void loadItems() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final data = await ItemService.getAllItems();

      int weaponCnt = 0;
      int artifactCnt = 0;

      for (Item item in data) {
        if (item.itemType == "artifact") {
          artifactCnt += 1;
        } else {
          weaponCnt += 1;
        }
      }

      setState(() {
        allItems = data;
        filteredItems = data;
        isLoading = false;
        artifactCount = artifactCnt;
        weaponCount = weaponCnt;
      });
    } catch (error) {
      setState(() {
        errorMessage = error.toString();
        isLoading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage!),
            backgroundColor: Colors.redAccent,
            action: SnackBarAction(
              label: "RETRY",
              textColor: Colors.white,
              onPressed: loadItems,
            ),
          ),
        );
      }
    }
  }

  void filterItems(String type) {
    setState(() {
      selectedType = type;

      if (type == "all") {
        filteredItems = allItems;
      } else {
        filteredItems = allItems
            .where((item) => item.itemType == type)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (errorMessage != null) {
      return Center(child: Text(errorMessage!));
    }

    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 8,
          children: [
            CardWidget(
              onTap: () => filterItems("all"),
              child: Text(
                "${selectedType == "all" ? "✓ " : ""} All (${artifactCount + weaponCount})",
                style: TextStyle(color: GIStyle.inverseText[darkMode.value]),
              ),
            ),

            CardWidget(
              onTap: () => filterItems("weapon"),
              child: Text(
                "${selectedType == "weapon" ? "✓ " : ""} Weapon ($weaponCount)",
                style: TextStyle(color: GIStyle.inverseText[darkMode.value]),
              ),
            ),

            Expanded(
              child: CardWidget(
                onTap: () => filterItems("artifact"),
                child: Center(
                  child: Text(
                    "${selectedType == "artifact" ? "✓ " : ""} Artifact ($artifactCount)",
                    style: TextStyle(
                      color: GIStyle.inverseText[darkMode.value],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        if (filteredItems.isEmpty)
          const Center(child: Text("No items found"))
        else
          Column(
            spacing: 16,
            children: filteredItems
                .map((item) => ItemListWidget(item: item))
                .toList(),
          ),
      ],
    );
  }
}
