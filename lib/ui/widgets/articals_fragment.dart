import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_pojo/core/constants/api_manager.dart';
import 'package:news_pojo/ui/widgets/artical_item.dart';

class ArticalsFragment extends StatelessWidget {
  final String? sourceId;
  const ArticalsFragment({super.key, required this.sourceId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
            } else if (snapshot.hasData) {
              return Expanded(
                child: ListView.separated(
                    itemCount: snapshot.data!.articles!.length,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 16.h),
                    itemBuilder: (context, index) {
                      var article = snapshot.data!.articles![index];
                      return ArticalItem(
                        image: article.urlToImage,
                        author: article.author,
                        date: article.publishedAt,
                        title: article.title,
                      );
                    }),
              );
            }
          }
          return Center(
            child: Text('No data found'),
          );
        });
  }
}
