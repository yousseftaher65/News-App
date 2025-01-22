import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_pojo/core/routes/app_routes.dart';
import 'package:news_pojo/core/theme/base_theme.dart';
import 'package:news_pojo/core/theme/dark_theme.dart';
import 'package:news_pojo/core/theme/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    BaseTheme lightTheme = LightTheme();
    BaseTheme darkTheme = DarkTheme();

    return ScreenUtilInit(
      designSize: Size(390, 850),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) => MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: lightTheme.themeData,
        darkTheme: darkTheme.themeData,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
