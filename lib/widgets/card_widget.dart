import 'package:flutter/material.dart';
import 'package:genshin_import/data/notifiers.dart';
import 'package:genshin_import/data/styles.dart';

class CardWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final double borderRadius;
  final Color? fillColor;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final Widget? child;
  final bool isButton;

  const CardWidget({
    super.key,
    this.width,
    this.height,
    this.borderRadius = 0,
    this.fillColor,
    this.padding = const EdgeInsets.all(16),
    this.onTap,
    this.child,
    this.isButton = false,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = fillColor ?? GIStyle.cardBackground[darkMode.value];
    EdgeInsetsGeometry actualPadding = isButton
        ? EdgeInsetsGeometry.symmetric(horizontal: 32, vertical: 8)
        : padding;

    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          padding: actualPadding,
          child: child,
        ),
      ),
    );
  }
}
