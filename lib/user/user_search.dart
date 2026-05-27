import 'package:flutter/material.dart';
import 'package:genshin_import/data/styles.dart';
import 'package:genshin_import/user/widgets/user_history_list_tile_widget.dart';
import 'package:genshin_import/user/widgets/user_search_list_tile_widget.dart';

class UserSearch extends StatefulWidget {
  const UserSearch({super.key});

  @override
  State<UserSearch> createState() => _UserSearchState();
}

class _UserSearchState extends State<UserSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          spacing: 30,
          children: [
             SearchBar(leading: Icon(Icons.search), hintText: 'Craving for Hama?'),
             Column(
              spacing: 20,
              children: [
                Row(
                  spacing: 16,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          
                        },
                        child: Ink(
                          color: GIStyle.subtext,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Weapons", style: GIStyle.headerLight),
                                Text("20 items", style: GIStyle.subHeaderLight),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          
                        },
                        child: Ink(
                          color: GIStyle.subtext,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Artifacts", style: GIStyle.headerLight),
                                Text("20 items", style: GIStyle.subHeaderLight),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                  ],
                ),

                UserSearchListTileWidget(itemName: "Hama", price: 10),
                UserSearchListTileWidget(itemName: "Hama", price: 10)
              ],
             )
          ], 
        ),
      ),
    );
  }
}