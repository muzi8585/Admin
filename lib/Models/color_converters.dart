import 'package:flutter/material.dart';

String colorToHex(Color color) {
  return color.value
      .toRadixString(16)
      .padLeft(8, '0'); // Format as a hex string
}

Color colorFromHex(String hexColor) {
  final intColor = int.parse(hexColor, radix: 16);
  return Color(intColor);
}
