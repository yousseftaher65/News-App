import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class BaseTheme {
  Color get primaryColor;
  Color get secondaryColor;
  Color get accentColor;
  TextStyle get titleTxt => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w500,
  );
  TextStyle get supTitleTxt => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w500,
  );
  TextStyle get contentTxt => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w700,
  );
  TextStyle get subContentTxt => GoogleFonts.inter(
         fontSize: 12,
        fontWeight: FontWeight.w500,
  );
  ThemeData get themeData;
}
