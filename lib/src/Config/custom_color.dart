import 'package:flutter/material.dart';

Map<int, Color> swatchOpacity = {
  50  : const Color.fromRGBO(139, 195, 74, -1),
  100 : const Color.fromRGBO(139, 195, 74, -1),
  200 : const Color.fromRGBO(139, 195, 74, -1),
  300 : const Color.fromRGBO(139, 195, 74, -1),
  400 : const Color.fromRGBO(139, 195, 74, -1),
  500 : const Color.fromRGBO(139, 195, 74, -1),
  600 : const Color.fromRGBO(139, 195, 74, -1),
  700 : const Color.fromRGBO(139, 195, 74, -1),
  800 : const Color.fromRGBO(139, 195, 74, -1),
  900 : const Color.fromRGBO(139, 195, 74, -1),
};

abstract class CustomColors {
  static Color customContrastColor = Colors.red.shade700;
  static MaterialColor customSwatchColor = MaterialColor(0xff8bc34a,swatchOpacity);
}
