import 'dart:async';

import 'package:flutter/material.dart';
import 'package:genshin_import/data/notifiers.dart';
import 'package:genshin_import/data/styles.dart';
import 'package:genshin_import/models/item.dart';
import 'package:genshin_import/services/item_service.dart';
import 'package:genshin_import/widgets/card_widget.dart';
import 'package:genshin_import/widgets/text_field_widget.dart';
import 'package:genshin_import/widgets/user/user_item_grid_widget.dart';
import 'package:genshin_import/widgets/user/user_item_list_widget.dart';

class UserSearchList extends StatefulWidget {
  const UserSearchList({super.key});

  @override
  State<UserSearchList> createState() => _UserSearchListState();
}

class _UserSearchListState extends State<UserSearchList> {
  final TextEditingController searchController = TextEditingController();

  List<Item> items = [];

  bool isLoading = false;
  String? errorMessage;

  Timer? debounce;

  String view = "grid";

  @override
  void initState() {
    super.initState();
    loadItems();

    searchController.addListener(() {
      debounce?.cancel();

      debounce = Timer(const Duration(milliseconds: 500), searchItems);
    });
  }

  @override
  void dispose() {
    debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }

  Future<void> loadItems() async {
    try {
      setState(() {
        isLoading = true;
        errorMessage = null;
      });

      final data = await ItemService.getAllItems();

      setState(() {
        items = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  Future<void> searchItems() async {
    try {
      final keyword = searchController.text.trim();

      setState(() {
        isLoading = true;
        errorMessage = null;
      });

      if (keyword.isEmpty) {
        await loadItems();
        return;
      }

      final data = await ItemService.searchItems(keyword);

      setState(() {
        items = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        items = [];
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 8,
          children: [
            Expanded(
              child: TextFieldWidget(
                controller: searchController,
                hintText: "Search",
                hintIcon: Icon(Icons.search),
              ),
            ),
            CardWidget(
              borderRadius: 100,
              onTap: () {
                if (view == "grid") {
                  setState(() {
                    view = "list";
                  });
                } else {
                  setState(() {
                    view = "grid";
                  });
                }
              },
              child: view == "grid"
                  ? Icon(
                      Icons.grid_view_rounded,
                      color: GIStyle.inverseText[darkMode.value],
                    )
                  : Icon(
                      Icons.view_list_rounded,
                      color: GIStyle.inverseText[darkMode.value],
                    ),
            ),
          ],
        ),

        if (isLoading)
          const Center(child: CircularProgressIndicator())
        else if (errorMessage != null)
          Center(child: Text(errorMessage!))
        else if (items.isEmpty)
          const Center(child: Text("No items found"))
        else if (view == "list")
          Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items.map((item) {
              return UserItemListWidget(item: item);
            }).toList(),
          )
        else
          GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 0.98,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            shrinkWrap: true,

            physics: NeverScrollableScrollPhysics(),
            children: items.map((item) {
              return UserItemGridWidget(item: item);
            }).toList(),
          ),
      ],
    );
  }
}
