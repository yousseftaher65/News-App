import 'package:flutter/material.dart';
import 'package:news_pojo/core/theme/base_theme.dart';
import 'package:news_pojo/core/theme/color_palette.dart';

class DarkTheme extends BaseTheme {

  @override
  Color get primaryColor => ColorPalette.primaryDarkColor;
  
  @override
  Color get secondaryColor => ColorPalette.secondaryDarkColor;

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
  );
  
}
