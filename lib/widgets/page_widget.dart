import 'package:flutter/material.dart';
import 'package:genshin_import/data/notifiers.dart';
import 'package:genshin_import/data/styles.dart';

class PageWidget extends StatelessWidget {
  final Widget child;
  final Widget? floatingActionButton;

  const PageWidget({super.key, required this.child, this.floatingActionButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GIStyle.background[darkMode.value],
      floatingActionButton: floatingActionButton,
      body: SafeArea(
        child: Padding(padding: EdgeInsetsGeometry.all(16), child: child),
      ),
    );
  }
}
