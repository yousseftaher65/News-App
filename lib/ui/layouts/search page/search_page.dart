import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_pojo/core/constants/api_manager.dart';
import 'package:news_pojo/models/news_response.dart';
import 'package:news_pojo/ui/widgets/artical_item.dart';

class SearchPage extends StatefulWidget {
 const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchController  controller = SearchController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
               SearchBar(
                onSubmitted: (value) {
                  setState(() {
                  value = controller.text;
                  });
                },
                controller: controller,
                leading: Icon(Icons.search,
                    color: Theme.of(context).secondaryHeaderColor),
                hintText: "search_news".tr(),
              ),
              SizedBox(height: 8.h),
              FutureBuilder<NewsResponse>(
                  future: controller.text.isEmpty
                      ? ApiManager.getArticles('abc-news')
                      : ApiManager.getSearch(controller.text),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("failed".tr()),
                        );
                      } else if (snapshot.hasData &&
                          snapshot.data!.articles!.isNotEmpty) {
                        return Expanded(
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 8.h),
                            itemCount: snapshot.data?.articles?.length ?? 0,
                            itemBuilder: (context, index) {
                              var data = snapshot.data!.articles![index];
                              return ArticalItem(
                                  image: data.urlToImage,
                                  title: data.title,
                                  author: data.author,
                                  date: data.publishedAt);
                            },
                          ),
                        );
                      }
                    }
                    return Center(
                      child: Text(
                        'no_news'.tr(),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    );
                  }),
            ],
          ),
        ),
      )),
    );
  }
}
