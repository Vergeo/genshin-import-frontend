import 'package:flutter/material.dart';

class GIStyle {
  static const Color darkBeige = Color.fromARGB(255, 212, 206, 186);
  static const Color beige = Color.fromARGB(255, 237, 229, 216);
  static const Color white = Color.fromARGB(255, 248, 248, 246);
  static const Color darkGray = Color.fromARGB(255, 62, 71, 85);
  static const Color gray = Color.fromARGB(255, 72, 83, 101);
  static const Color lightGray = Color.fromARGB(255, 96, 105, 122);

  static const List<Color> background = [beige, gray];
  static const List<Color> text = [darkGray, white];
  static const List<Color> inverseText = [white, darkGray];
  static const List<Color> subText = [gray, beige];

  static const List<Color> navbarBackground = [gray, darkGray];
  static const List<Color> navbarText = [white, white];
  static const List<Color> navbarHighlight = [darkBeige, darkBeige];

  static const List<Color> cardBackground = [lightGray, beige];
}
