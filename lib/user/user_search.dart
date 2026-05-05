import 'package:flutter/material.dart';

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
          children: [
             SearchBar(leading: Icon(Icons.search), hintText: 'Craving for Hama?')
          ], 
        ),
      ),
    );
  }
}