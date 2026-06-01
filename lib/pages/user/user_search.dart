import 'package:flutter/material.dart';
import 'package:genshin_import/viewmodels/user/user_search_list.dart';
import 'package:genshin_import/widgets/scrollable_page_widget.dart';

class UserSearch extends StatefulWidget {
  const UserSearch({super.key});

  @override
  State<UserSearch> createState() => _UserSearchState();
}

class _UserSearchState extends State<UserSearch> {
  @override
  Widget build(BuildContext context) {
    return ScrollablePageWidget(child: UserSearchList());
  }
}
