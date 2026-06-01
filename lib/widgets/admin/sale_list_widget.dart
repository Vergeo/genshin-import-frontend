import 'package:flutter/material.dart';
import 'package:genshin_import/data/notifiers.dart';
import 'package:genshin_import/data/styles.dart';
import 'package:genshin_import/models/sale.dart';
import 'package:genshin_import/widgets/card_widget.dart';

class SaleListWidget extends StatelessWidget {
  final Sale sale;
  const SaleListWidget({super.key, required this.sale});

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      width: double.infinity,
      child: Row(
        spacing: 8,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${sale.quantity} × ${sale.item.itemName}",
                  style: TextStyle(
                    fontSize: 16,
                    color: GIStyle.inverseText[darkMode.value],
                  ),
                ),
                Text(
                  "Sale ID: ${sale.salesId}",
                  style: TextStyle(
                    fontSize: 12,
                    color: GIStyle.inverseText[darkMode.value],
                  ),
                ),
              ],
            ),
          ),
          Text(
            currencyNotifier.value.format(sale.quantity * sale.item.itemPrice),
            style: TextStyle(
              fontSize: 16,
              color: GIStyle.inverseText[darkMode.value],
            ),
          ),
        ],
      ),
    );
  }
}
