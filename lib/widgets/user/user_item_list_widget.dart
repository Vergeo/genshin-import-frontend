import 'package:flutter/material.dart';
import 'package:genshin_import/data/notifiers.dart';
import 'package:genshin_import/data/styles.dart';
import 'package:genshin_import/models/item.dart';
import 'package:genshin_import/pages/user/user_item_details.dart';
import 'package:genshin_import/widgets/card_widget.dart';

class UserItemListWidget extends StatelessWidget {
  final Item item;

  const UserItemListWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      width: double.infinity,
      padding: EdgeInsetsGeometry.all(0),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => UserItemDetailsPage(item: item)),
        );
      },
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.itemName,
                    style: TextStyle(
                      fontSize: 16,
                      color: GIStyle.inverseText[darkMode.value],
                    ),
                  ),
                  Text(
                    "${currencyNotifier.value.format(item.itemPrice)} • ${item.itemStock} stock(s)",
                    style: TextStyle(
                      fontSize: 12,
                      color: GIStyle.inverseText[darkMode.value],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.network(
            item.itemImage,
            width: 80,
            height: 80,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.image_not_supported, size: 80),
          ),
        ],
      ),
    );
  }
}
