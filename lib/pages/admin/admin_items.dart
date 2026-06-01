import 'package:flutter/material.dart';
import 'package:genshin_import/data/notifiers.dart';
import 'package:genshin_import/data/styles.dart';
import 'package:genshin_import/pages/admin/admin_item_create.dart';
import 'package:genshin_import/viewmodels/admin/admin_item_list.dart';
import 'package:genshin_import/widgets/card_widget.dart';
import 'package:genshin_import/widgets/scrollable_page_widget.dart';

class AdminItems extends StatefulWidget {
  const AdminItems({super.key});

  @override
  State<AdminItems> createState() => _AdminItemsState();
}

class _AdminItemsState extends State<AdminItems> {
  @override
  Widget build(BuildContext context) {
    return ScrollablePageWidget(
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.5),
              blurRadius: 16,
              spreadRadius: 2,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: CardWidget(
          borderRadius: 100,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (context) => const AdminItemCreate(),
              ),
            );
          },
          child: Icon(Icons.add, color: GIStyle.inverseText[darkMode.value]),
        ),
      ),
      child: AdminItemList(),
    );
  }
}
