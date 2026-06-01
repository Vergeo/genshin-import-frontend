import 'package:flutter/material.dart';
import 'package:genshin_import/data/notifiers.dart';
import 'package:genshin_import/data/styles.dart';
import 'package:genshin_import/models/item.dart';
import 'package:genshin_import/services/item_service.dart';
import 'package:genshin_import/widgets/admin/item_list_widget.dart';

class AdminEmptyStock extends StatefulWidget {
  const AdminEmptyStock({super.key});

  @override
  State<AdminEmptyStock> createState() => _AdminEmptyStockState();
}

class _AdminEmptyStockState extends State<AdminEmptyStock> {
  List<Item> items = [];

  bool isLoading = true;
  String? errorMessage;

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
      final List<Item> data = await ItemService.getEmptyStock();

      setState(() {
        items = data;
        isLoading = false;
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

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (errorMessage != null) {
      return Center(child: Text(errorMessage!));
    }

    if (items.isEmpty) {
      return Center(
        child: Text(
          "No empty stock items",
          style: TextStyle(color: GIStyle.subText[darkMode.value]),
        ),
      );
    }

    return Column(
      spacing: 16,
      children: items.map((item) => ItemListWidget(item: item)).toList(),
    );
  }
}
