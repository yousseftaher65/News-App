import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_pojo/core/constants/api_manager.dart';
import 'package:news_pojo/ui/widgets/artical_item.dart';
import 'package:news_pojo/ui/widgets/description_sheet.dart';

class ArticalsFragment extends StatelessWidget {
  final String? sourceId;
  const ArticalsFragment({super.key, required this.sourceId});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
          future: ApiManager.getArticles(sourceId ?? ''),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Failed to load articles'),
                );
              } else if (snapshot.hasData &&
                  snapshot.data!.articles!.isNotEmpty) {
                return ListView.separated(
                    itemCount: snapshot.data!.articles!.length,
                    separatorBuilder: (context, index) => SizedBox(height: 1.h),
                    itemBuilder: (context, index) {
                      var article = snapshot.data!.articles![index];
                      return GestureDetector(
                        onTap: () async  {
                          await showDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (context) => DescriptionSheet(
                              description: article.description,
                              image: article.urlToImage,
                            ),
                          );
                        },
                        child: ArticalItem(
                          image: article.urlToImage,
                          author: article.author,
                          date: article.publishedAt,
                          title: article.title,
                        ),
                      );
                    });
              }
            }
            return Center(
              child: Text(
                'no_news'.tr(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
            );
          }),
    );
  }
}
