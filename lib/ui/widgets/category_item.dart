import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  final String image;
  final String selectedCategory;
  final Function onTap;
  final bool isleft;
  const CategoryItem(
      {super.key,
      required this.image,
      required this.selectedCategory,
      required this.onTap,
      this.isleft = false});

  @override
  Widget build(BuildContext context) {

    bool isleft = this.isleft;
    if(context.locale.languageCode == 'ar'){
      isleft = !this.isleft;
    }

    return Stack(
      alignment: !isleft
          ? AlignmentDirectional.bottomStart
          : AlignmentDirectional.bottomEnd,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24.r),
          child: Image.asset(image, width: double.infinity.w, height: 200.h),
        ),
        GestureDetector(
          onTap: () {
            onTap(selectedCategory);
          },
          child: Container(
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              color: Theme.of(context).primaryColor.withOpacity(0.5),
            ),
            child:!isleft?
                 Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Icon(Icons.arrow_back_ios, size: 16 , color: Theme.of(context).secondaryHeaderColor,),
                      ),
                      SizedBox(width: 10.w),
                      Text('view_all'.tr(),
                          style: Theme.of(context).textTheme.titleLarge),
                      SizedBox(width: 16.w),
                    ],
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: 16.w),
                      Text('view_all'.tr(),
                          style: Theme.of(context).textTheme.titleLarge),
                      SizedBox(width: 10.w),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Icon(Icons.arrow_forward_ios, size: 16 ,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                      ),
                    ],
                  ),
          ),
        )
      ],
    );
  }
}
