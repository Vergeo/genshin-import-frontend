import 'package:flutter/material.dart';
import 'package:genshin_import/data/notifiers.dart';
import 'package:genshin_import/data/styles.dart';
import 'package:genshin_import/models/item.dart';
import 'package:genshin_import/pages/admin/admin_item_edit.dart';
import 'package:genshin_import/pages/admin/admin_widget_tree.dart';
import 'package:genshin_import/services/item_service.dart';
import 'package:genshin_import/widgets/card_widget.dart';
import 'package:genshin_import/widgets/scrollable_page_widget.dart';

class AdminItemDetails extends StatelessWidget {
  final Item item;

  const AdminItemDetails({super.key, required this.item});

  Widget buildDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: GIStyle.text[darkMode.value].withValues(alpha: 0.7),
            ),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16, color: GIStyle.text[darkMode.value]),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScrollablePageWidget(
      child: Column(
        spacing: 32,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              BackButton(
                color: GIStyle.text[darkMode.value],
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Text(
                item.itemName,
                style: TextStyle(
                  fontSize: 24,
                  color: GIStyle.text[darkMode.value],
                ),
              ),
            ],
          ),
          Center(
            child: Image.network(
              item.itemImage,
              height: 250,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.image_not_supported, size: 120),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildDetail("Name", item.itemName),
              buildDetail("Type", item.itemType),
              buildDetail(
                "Price",
                currencyNotifier.value.format(item.itemPrice),
              ),
              buildDetail("Stock", "${item.itemStock}"),
              buildDetail("Description", item.itemDescription),
            ],
          ),

          CardWidget(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => AdminItemEdit(item: item),
                ),
              );
            },
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                Icon(Icons.edit, color: GIStyle.inverseText[darkMode.value]),
                Text(
                  "Edit Item",
                  style: TextStyle(color: GIStyle.inverseText[darkMode.value]),
                ),
              ],
            ),
          ),
          CardWidget(
            onTap: () async {
              final confirm = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Delete Item"),
                  content: Text(
                    "Are you sure you want to delete ${item.itemName}?",
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text(
                        "Delete",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              );

              if (confirm != true) return;

              try {
                await ItemService.deleteItem(item.itemId);

                if (context.mounted) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const AdminWidgetTree()),
                    (route) => false,
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(e.toString())));
                }
              }
            },
            width: double.infinity,
            fillColor: Colors.red,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.delete, color: Colors.white),
                SizedBox(width: 8),
                Text("Delete Item", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
