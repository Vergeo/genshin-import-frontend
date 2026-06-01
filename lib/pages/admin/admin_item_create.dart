import 'package:flutter/material.dart';
import 'package:genshin_import/data/notifiers.dart';
import 'package:genshin_import/data/styles.dart';
import 'package:genshin_import/models/item.dart';
import 'package:genshin_import/services/item_service.dart';
import 'package:genshin_import/widgets/card_widget.dart';
import 'package:genshin_import/widgets/scrollable_page_widget.dart';
import 'package:genshin_import/widgets/text_field_widget.dart';

class AdminItemCreate extends StatefulWidget {
  const AdminItemCreate({super.key});

  @override
  State<AdminItemCreate> createState() => _AdminItemCreateState();
}

class _AdminItemCreateState extends State<AdminItemCreate> {
  final nameController = TextEditingController();

  final typeController = TextEditingController();

  final descriptionController = TextEditingController();

  final stockController = TextEditingController();

  final imageController = TextEditingController();

  final priceController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    nameController.dispose();
    typeController.dispose();
    descriptionController.dispose();
    stockController.dispose();
    imageController.dispose();
    priceController.dispose();
    super.dispose();
  }

  Widget buildField(String label, TextEditingController controller) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, color: GIStyle.text[darkMode.value]),
        ),
        TextFieldWidget(controller: controller),
      ],
    );
  }

  Future<void> createItem() async {
    try {
      setState(() {
        isLoading = true;
      });

      final item = Item(
        itemId: 0,
        itemName: nameController.text,
        itemType: typeController.text,
        itemDescription: descriptionController.text,
        itemStock: int.parse(stockController.text),
        itemImage: imageController.text,
        itemPrice: double.parse(priceController.text),
      );

      final createdItem = await ItemService.createItem(item);

      if (mounted) {
        Navigator.pop(context, createdItem);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
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
                "Create Item",
                style: TextStyle(
                  fontSize: 24,
                  color: GIStyle.text[darkMode.value],
                ),
              ),
            ],
          ),

          buildField("Item Name", nameController),

          buildField("Item Type", typeController),

          buildField("Description", descriptionController),

          buildField("Stock", stockController),

          buildField("Image URL", imageController),

          buildField("Price", priceController),

          CardWidget(
            onTap: isLoading ? null : createItem,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                Icon(Icons.create, color: GIStyle.inverseText[darkMode.value]),
                Text(
                  "Create Item",
                  style: TextStyle(color: GIStyle.inverseText[darkMode.value]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
