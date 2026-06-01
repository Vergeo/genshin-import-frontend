import 'package:flutter/material.dart';
import 'package:genshin_import/viewmodels/user/user_history_list.dart';
import 'package:genshin_import/widgets/scrollable_page_widget.dart';

class UserHistory extends StatefulWidget {
  const UserHistory({super.key});

  @override
  State<UserHistory> createState() => _UserHistoryState();
}

class _UserHistoryState extends State<UserHistory> {
  @override
  Widget build(BuildContext context) {
    return ScrollablePageWidget(child: UserHistoryList());
  }
}
