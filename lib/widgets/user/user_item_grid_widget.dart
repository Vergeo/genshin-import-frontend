import 'package:flutter/material.dart';
import 'package:genshin_import/data/notifiers.dart';
import 'package:genshin_import/data/styles.dart';
import 'package:genshin_import/models/item.dart';
import 'package:genshin_import/pages/user/user_item_details.dart';
import 'package:genshin_import/widgets/card_widget.dart';

class UserItemGridWidget extends StatelessWidget {
  final Item item;

  const UserItemGridWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => UserItemDetailsPage(item: item)),
        );
      },
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 5 / 4,
            child: Image.network(
              item.itemImage,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.image),
            ),
          ),

          Container(
            color: GIStyle.cardBackground[darkMode.value].withValues(
              red: GIStyle.cardBackground[darkMode.value].r * 0.8,
              green: GIStyle.cardBackground[darkMode.value].g * 0.8,
              blue: GIStyle.cardBackground[darkMode.value].b * 0.8,
            ),
            padding: const EdgeInsets.all(4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.itemName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: GIStyle.inverseText[darkMode.value],
                    fontSize: 12,
                  ),
                ),
                Text(
                  "${currencyNotifier.value.format(item.itemPrice)} • ${item.itemStock} stock(s)",
                  style: TextStyle(
                    color: GIStyle.inverseText[darkMode.value],
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
