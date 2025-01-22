import 'package:flutter/material.dart';
import 'package:news_pojo/core/routes/pages_route_name.dart';
import 'package:news_pojo/ui/layouts/home%20page/home_page.dart';
import 'package:news_pojo/ui/layouts/search%20page/search_page.dart';
import 'package:news_pojo/ui/layouts/splash%20page/splash_screen.dart';

abstract class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case PagesRouteName.initial:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case PagesRouteName.home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case PagesRouteName.search:
        return MaterialPageRoute(builder: (_) => SearchPage());
      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}