import 'package:flutter/material.dart';

class ColorManager {
  static Color background = HexColor.fromHex('#F9F8F8');
  static Color primary = HexColor.fromHex('#435EA3');
  static Color primaryLight = HexColor.fromHex('#2A4486');
  static Color primaryDark = HexColor.fromHex('#074587');
  static Color button = HexColor.fromHex('#074587');

  static Color disabledColor = HexColor.fromHex('#575964');
  static Color hintColor = HexColor.fromHex('#666666').withOpacity(0.7);

  static Color primaryText = HexColor.fromHex('#010101');
  static Color secondaryText = HexColor.fromHex('#FFFFFF');
  static Color darkText = HexColor.fromHex('#222222');
  static Color lightText = HexColor.fromHex('#424242');
  static Color errorText = HexColor.fromHex('#C30909');

  static Color cardBackround = HexColor.fromHex('#F0F0F0');

  static Color appBarBackground = HexColor.fromHex('#e9e9e9');
  static Color titleColor = HexColor.fromHex('#222222');

  static Color firstBarColor = HexColor.fromHex('#01b87d');
  static Color secondBarColor = HexColor.fromHex('#594ccf');
  static Color thirdBarColor = HexColor.fromHex('#09a8d9');
  static Color fourthBarColor = HexColor.fromHex('#cf4c7a');
  static Color fifthBarColor = HexColor.fromHex('#f2873f');
}

extension HexColor on Color {
  static Color fromHex(String hex) {
    String color = hex.replaceAll('#', '');
    if (color.length == 6) {
      color = 'FF$color';
    }

    return Color(int.parse(color, radix: 16));
  }
}
