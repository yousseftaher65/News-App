import 'package:flutter/material.dart';
import 'package:news_pojo/core/routes/app_routes.dart';
import 'package:news_pojo/core/theme/base_theme.dart';
import 'package:news_pojo/core/theme/dark_theme.dart';
import 'package:news_pojo/core/theme/light_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    BaseTheme lightTheme = LightTheme();
    BaseTheme darkTheme = DarkTheme();

    return MaterialApp(
      theme: lightTheme.themeData,
      darkTheme: darkTheme.themeData,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}