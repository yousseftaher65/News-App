import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        secondaryHeaderColor: secondaryColor,
        indicatorColor: accentColor,
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
        dropdownMenuTheme: DropdownMenuThemeData(
            inputDecorationTheme: InputDecorationTheme(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              //labelStyle: TextStyle(color: primaryColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.r),
                borderSide: BorderSide(
                  color: primaryColor,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.r),
                borderSide: BorderSide(
                  color: primaryColor,
                  width: 2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.r),
                borderSide: BorderSide(
                  color: primaryColor,
                  width: 2,
                ),
              ),
            ),
            menuStyle: MenuStyle(
              elevation: WidgetStatePropertyAll(2),
              padding: WidgetStatePropertyAll(
                EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
              ),
              surfaceTintColor: WidgetStatePropertyAll(secondaryColor),
              backgroundColor: WidgetStatePropertyAll(secondaryColor),
            ),
            textStyle: supTitleTxt.copyWith(color: primaryColor)),
        menuButtonTheme: MenuButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStatePropertyAll(
                supTitleTxt.copyWith(color: primaryColor)),
            foregroundColor: WidgetStatePropertyAll(primaryColor),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: supTitleTxt.copyWith(color: secondaryColor),
          filled: true,
          fillColor: primaryColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: secondaryColor, width: 2.w),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: secondaryColor, width: 2.w),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: secondaryColor, width: 2.w),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16.h),
        ),
      );
}
