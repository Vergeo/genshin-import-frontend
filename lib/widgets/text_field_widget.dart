import 'package:flutter/material.dart';
import 'package:genshin_import/data/styles.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final Widget? hintIcon;

  const TextFieldWidget({
    super.key,
    required this.controller,
    this.obscureText = false,
    this.hintText = "",
    this.hintIcon,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(100),
      child: Container(
        color: GIStyle.white,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          controller: widget.controller,
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            icon: widget.hintIcon,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: GIStyle.darkGray, fontSize: 12),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
