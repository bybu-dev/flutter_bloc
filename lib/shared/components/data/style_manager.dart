import 'package:bybuapp/shared/components/data/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StylesManager {
  static TextStyle _getTextStyle(
      String fontFamily, FontWeight fontWeight, double fontSize, Color color) {
      return GoogleFonts.ubuntu(textStyle: TextStyle(
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
      ));
  }

  static TextStyle getRegularStyle(
      {double fontSize = FontSize.s12, required Color color}) {
    return _getTextStyle(
        FontConstants.fontFamily, FontWeightManager.regular, fontSize, color);
  }

  static TextStyle getBoldStyle(
      {double fontSize = FontSize.s14, required Color color}) {
    return _getTextStyle(
        FontConstants.fontFamily, FontWeightManager.bold, fontSize, color);
  }

  static TextStyle getSemiBoldStyle(
      {double fontSize = FontSize.s14, required Color color}) {
    return _getTextStyle(
        FontConstants.fontFamily, FontWeightManager.semibold, fontSize, color);
  }

  static TextStyle getLightStyle(
      {double fontSize = FontSize.s14, required Color color}) {
    return _getTextStyle(
        FontConstants.fontFamily, FontWeightManager.light, fontSize, color);
  }

  static TextStyle getExtraBoldStyle(
      {double fontSize = FontSize.s14, required Color color}) {
    return _getTextStyle(
        FontConstants.fontFamily, FontWeightManager.extraBold, fontSize, color);
  }

  static TextStyle getExtraLightStyle(
      {double fontSize = FontSize.s14, required Color color}) {
    return _getTextStyle(
        FontConstants.fontFamily, FontWeightManager.extraLight, fontSize, color);
  }

  static TextStyle getMediumStyle(
      {double fontSize = FontSize.s14, required Color color}) {
    return _getTextStyle(
        FontConstants.fontFamily, FontWeightManager.medium, fontSize, color);
  }

  static TextStyle getThinStyle(
      {double fontSize = FontSize.s14, required Color color}) {
    return _getTextStyle(
        FontConstants.fontFamily, FontWeightManager.thin, fontSize, color);
  }
}
