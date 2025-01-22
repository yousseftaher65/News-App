import 'package:flutter/material.dart';
import 'package:news_pojo/core/theme/base_theme.dart';
import 'package:news_pojo/core/theme/color_palette.dart';

class LightTheme extends BaseTheme {

  @override
  Color get primaryColor => ColorPalette.primaryLightColor;

  @override
  Color get secondaryColor => ColorPalette.secondaryLightColor;

  @override
  Color get accentColor => ColorPalette.accentColor;

 

  @override
  ThemeData get themeData => ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: primaryColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: primaryColor,
      iconTheme: IconThemeData(
        color: secondaryColor,
      ),
      actionsIconTheme: IconThemeData(
        color: secondaryColor,
      ),
    titleTextStyle: titleTxt.copyWith(color: secondaryColor),
    surfaceTintColor: Colors.transparent,
    ),
    textTheme: TextTheme(
      titleLarge: titleTxt.copyWith(color: secondaryColor),
      titleMedium: supTitleTxt.copyWith(color: secondaryColor), 
      bodyLarge: contentTxt.copyWith(color: secondaryColor),
      bodyMedium: subContentTxt.copyWith(color: accentColor),
    ),
  );

}
