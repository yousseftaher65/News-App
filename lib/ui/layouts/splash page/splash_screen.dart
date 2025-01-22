import 'package:flutter/material.dart';
import 'package:news_pojo/core/resources/assets.gen.dart';
import 'package:news_pojo/core/routes/pages_route_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override 
  initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, PagesRouteName.home);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
           Center(
          child: Image.asset(Assets.images.light.splashLight.path, width: 200, height: 200),
        ),
        ]
      ),
    );
  }
}