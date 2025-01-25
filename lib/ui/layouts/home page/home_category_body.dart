import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_pojo/core/resources/assets.gen.dart';
import 'package:news_pojo/ui/widgets/category_item.dart';

class HomeCategoryBody extends StatelessWidget {

 final Function onTapCategory;
 
   HomeCategoryBody({super.key , required this.onTapCategory});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'welcome'.tr(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 16.h,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 16.h,
                ),
                itemCount: imageList.length,
                itemBuilder: (context, index) {
                  return CategoryItem(image: imageList[index] , isleft: index.isEven , onTap: onTapCategory , selectedCategory: categoryList[index]);
                },
              ),
            )
          ],
        ),
      );
  }

  final List<String> imageList = [
    Assets.images.dark.generalDark.path,
    Assets.images.dark.businessDark.path,
    Assets.images.dark.entertainmentDark.path,
    Assets.images.dark.technologyDark.path,
    Assets.images.dark.scienceDark.path,
    Assets.images.dark.healthDark.path,
    Assets.images.dark.sportsDark.path,
  ];

  final List<String> categoryList = [
    'general',
    'business',
    'entertainment',
    'technology',
    'science',
    'health',
    'sports',
  ];

}