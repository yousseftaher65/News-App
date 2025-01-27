import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_pojo/core/routes/pages_route_name.dart';
import 'package:news_pojo/ui/layouts/home%20page/home_category_body.dart';
import 'package:news_pojo/ui/layouts/home%20page/news_category_body.dart';
import 'package:news_pojo/ui/widgets/drawer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? categoryName;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerWidget(
        onBack: onBack,
      ),
      appBar: AppBar(
        title: Text(categoryName == null ? "home".tr() : categoryName!.tr()),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              size: 24,
            ),
            onPressed: () {
              Navigator.pushNamed(context, PagesRouteName.search);
            },
          ),
        ],
      ),
      body: categoryName == null
          ? HomeCategoryBody(
              onTapCategory: onTapCategory,
            )
          : NewsCategoryBody(categoryName: categoryName!),
    );
  }

  void onTapCategory(String category) {
    setState(() {
      categoryName = category;
    });
  }

  void onBack() {
    Navigator.pop(context);
    setState(() {
      categoryName = null;
    });
  }
}
