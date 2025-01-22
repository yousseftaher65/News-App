import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_pojo/core/resources/assets.gen.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu , size: 24.sp,),
          onPressed: () {},
        ),
        title: Text("home".tr()),
        actions: [
          IconButton(
            icon: Icon(Icons.search , size: 24.sp,),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('welcome'.tr() , style: Theme.of(context).textTheme.titleLarge,),
              SizedBox(height: 16.h,),
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(Assets.images.dark.technologyDark.path , width: double.infinity , height: 300.h)),
            ],
          ),
        ),
      ),
    );
  }
}