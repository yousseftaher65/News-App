import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class BaseTheme {
  Color get primaryColor;
  Color get secondaryColor;
  Color get accentColor;
  TextStyle get titleTxt => GoogleFonts.inter(
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
  );
  TextStyle get supTitleTxt => GoogleFonts.inter(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
  );
  TextStyle get contentTxt => GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
  );
  TextStyle get subContentTxt => GoogleFonts.inter(
         fontSize: 12.sp,
        fontWeight: FontWeight.w500,
  );

  ThemeData get themeData;
}
