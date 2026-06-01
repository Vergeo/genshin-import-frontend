import 'package:flutter/material.dart';
import 'package:genshin_import/data/notifiers.dart';
import 'package:genshin_import/data/styles.dart';
import 'package:genshin_import/models/item.dart';
import 'package:genshin_import/models/sale.dart';
import 'package:genshin_import/pages/user/user_widget_tree.dart';
import 'package:genshin_import/services/auth_service.dart';
import 'package:genshin_import/services/sale_service.dart';
import 'package:genshin_import/widgets/card_widget.dart';
import 'package:genshin_import/widgets/scrollable_page_widget.dart';
import 'package:genshin_import/widgets/text_field_widget.dart';

class UserItemDetailsPage extends StatefulWidget {
  final Item item;

  const UserItemDetailsPage({super.key, required this.item});

  @override
  State<UserItemDetailsPage> createState() => _UserItemDetailsPageState();
}

class _UserItemDetailsPageState extends State<UserItemDetailsPage> {
  final quantityController = TextEditingController(text: "1");

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    quantityController.addListener(() {
      setState(() {});
    });
  }

  Widget buildDetail(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: GIStyle.text[darkMode.value].withValues(alpha: 0.7),
          ),
        ),
        const SizedBox(height: 4),
        Text(value, style: TextStyle(color: GIStyle.text[darkMode.value])),
      ],
    );
  }

  Future<void> purchaseItem() async {
    try {
      final quantity = int.tryParse(quantityController.text) ?? 0;

      if (quantity <= 0) {
        throw Exception("Quantity must be greater than 0");
      }

      if (quantity > widget.item.itemStock) {
        throw Exception("Not enough stock");
      }

      setState(() {
        isLoading = true;
      });
      final userId = await AuthService.getUserId();

      await SaleService.createSale(
        Sale(
          salesId: 0,
          userId: userId!,
          itemId: widget.item.itemId,
          quantity: quantity,
          item: widget.item,
        ),
      );

      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Purchase successful")));

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => UserWidgetTree()),
        (route) => false,
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
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
    final item = widget.item;

    return ScrollablePageWidget(
      child: Column(
        spacing: 24,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              BackButton(color: GIStyle.text[darkMode.value]),
              Expanded(
                child: Text(
                  item.itemName,
                  style: TextStyle(
                    fontSize: 24,
                    color: GIStyle.text[darkMode.value],
                  ),
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
                  const Icon(Icons.image_not_supported, size: 250),
            ),
          ),

          buildDetail("Type", item.itemType),

          buildDetail("Price", currencyNotifier.value.format(item.itemPrice)),

          buildDetail("Stock", "${item.itemStock}"),

          buildDetail("Description", item.itemDescription),

          Text(
            "Quantity",
            style: TextStyle(color: GIStyle.text[darkMode.value]),
          ),

          TextFieldWidget(controller: quantityController),

          CardWidget(
            width: double.infinity,
            onTap: isLoading ? null : purchaseItem,
            child: Center(
              child: isLoading
                  ? const CircularProgressIndicator()
                  : Text(
                      "Purchase (${currencyNotifier.value.format(item.itemPrice * (int.tryParse(quantityController.text) ?? 0))})",
                      style: TextStyle(
                        color: GIStyle.inverseText[darkMode.value],
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
