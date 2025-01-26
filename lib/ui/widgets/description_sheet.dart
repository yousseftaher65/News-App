import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_pojo/core/resources/assets.gen.dart';

class DescriptionSheet extends StatelessWidget {
  final String? description;
  final String? image;
  const DescriptionSheet({super.key, required this.description , required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            //margin: EdgeInsets.only(bottom: 16.h),
            alignment: AlignmentDirectional.bottomCenter,
            decoration: BoxDecoration(
            color: Theme.of(context).secondaryHeaderColor,
              borderRadius: BorderRadius.circular(16.r),
            ),
            padding: EdgeInsets.all(8),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.network(
                    image != null && image!.isNotEmpty
                        ? image!
                        : Assets.images.dark.generalDark.path,
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        Assets.images.dark.generalDark.path,
                        height: 220,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  description ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(height: 8.h),
                ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.h ),
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                 child: Text('view_full'.tr(), style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).secondaryHeaderColor,
                  ),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
