import 'package:flutter/material.dart';
import 'package:genshin_import/data/notifiers.dart';
import 'package:genshin_import/data/styles.dart';
import 'package:genshin_import/models/item.dart';
import 'package:genshin_import/pages/admin/admin_widget_tree.dart';
import 'package:genshin_import/services/item_service.dart';
import 'package:genshin_import/widgets/card_widget.dart';
import 'package:genshin_import/widgets/scrollable_page_widget.dart';
import 'package:genshin_import/widgets/text_field_widget.dart';

class AdminItemEdit extends StatefulWidget {
  final Item item;

  const AdminItemEdit({super.key, required this.item});

  @override
  State<AdminItemEdit> createState() => _AdminItemEditState();
}

class _AdminItemEditState extends State<AdminItemEdit> {
  late TextEditingController nameController;
  late TextEditingController typeController;
  late TextEditingController descriptionController;
  late TextEditingController stockController;
  late TextEditingController imageController;
  late TextEditingController priceController;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: widget.item.itemName);

    typeController = TextEditingController(text: widget.item.itemType);

    descriptionController = TextEditingController(
      text: widget.item.itemDescription,
    );

    stockController = TextEditingController(
      text: widget.item.itemStock.toString(),
    );

    imageController = TextEditingController(text: widget.item.itemImage);

    priceController = TextEditingController(
      text: widget.item.itemPrice.toString(),
    );
  }

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

  Future<void> saveItem() async {
    setState(() {
      isLoading = true;
    });

    try {
      Item updatedItem = Item(
        itemId: widget.item.itemId,
        itemName: nameController.text,
        itemType: typeController.text,
        itemDescription: descriptionController.text,
        itemStock: int.parse(stockController.text),
        itemImage: imageController.text,
        itemPrice: double.parse(priceController.text),
      );

      await ItemService.updateItem(widget.item.itemId, updatedItem);

      if (mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const AdminWidgetTree()),
          (route) => false,
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }

    if (mounted) {
      setState(() {
        isLoading = false;
      });
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
                "Edit Item",
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
            onTap: isLoading ? null : saveItem,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                Icon(Icons.save, color: GIStyle.inverseText[darkMode.value]),
                Text(
                  "Save Changes",
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
