import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_pojo/core/resources/assets.gen.dart';

class ArticalItem extends StatelessWidget {
  final String? title;
  final String? author;
  final String? date;
  final String? image;
  const ArticalItem(
      {super.key,
      required this.image,
      required this.title,
      required this.author,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context).secondaryHeaderColor, width: 2),
          //color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
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
              title ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 8.h),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'By: ${author != null ? author!.split('').length > 20 ? author?.substring(0, 20) ?? "" : author : ""}',
                softWrap: true,
                maxLines: 1,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                date?.substring(11, 16) ?? '',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ])
          ],
        ),
      ),
    );
  }
}
