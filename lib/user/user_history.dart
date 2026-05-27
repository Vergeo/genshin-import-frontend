import 'package:flutter/material.dart';
import 'package:genshin_import/user/widgets/user_history_list_tile_widget.dart';

class UserHistory extends StatefulWidget {
  const UserHistory({super.key});

  @override
  State<UserHistory> createState() => _UserHistoryState();
}

class _UserHistoryState extends State<UserHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("March, 22nd"),
            UserHistoryListTileWidget(itemName: "YNTKTS", price: 700),
            UserHistoryListTileWidget(itemName: "YNTKTS", price: 700),
            Text("March, 21st"),
            UserHistoryListTileWidget(itemName: "YNTKTS", price: 700),
          ],
        ),
      ),
    );
  }
}