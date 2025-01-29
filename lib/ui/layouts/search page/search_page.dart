import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_pojo/core/constants/api_manager.dart';
import 'package:news_pojo/models/news_response.dart';
import 'package:news_pojo/ui/widgets/artical_item.dart';
import 'package:news_pojo/ui/widgets/description_sheet.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchController controller = SearchController();
  String query = '';

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
              TextField(
                onSubmitted: (value) {
                  setState(() {
                    query = value;
                  });
                  _performSearch();
                },
                controller: controller,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onDoubleTap: () => Navigator.pop(context),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          controller.text = '';
                          query = '';
                        });
                      },
                      icon: Icon(Icons.close,
                          color: Theme.of(context).secondaryHeaderColor),
                    ),
                  ),
                  prefixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        query = controller.text;
                      });
                      _performSearch();
                    },
                    icon: Icon(Icons.search,
                        color: Theme.of(context).secondaryHeaderColor),
                  ),
                  hintText: "search".tr(),
                ),
              ),
              SizedBox(height: 8.h),
              FutureBuilder<NewsResponse>(
                  future: _performSearch(),
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
                              return GestureDetector(
                                onTap: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (context) {
                                      return DescriptionSheet(
                                          description: data.description,
                                          image: data.urlToImage);
                                    },
                                  );
                                },
                                child: ArticalItem(
                                    image: data.urlToImage,
                                    title: data.title,
                                    author: data.author,
                                    date: data.publishedAt),
                              );
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

  Future<NewsResponse> _performSearch() async {
    if (query.isEmpty) {
      return await ApiManager.getArticles('abc-news');
    } else {
      return await ApiManager.getSearch(query);
    }
  }

  @override
  void dispose() {
    controller;
    super.dispose();
  }
}
