import 'package:flutter/material.dart';
import 'package:news_pojo/core/constants/api_manager.dart';
import 'package:news_pojo/models/sources_response.dart';
import 'package:news_pojo/ui/widgets/articals_fragment.dart';

class NewsCategoryBody extends StatefulWidget {
  final String categoryName;

  const NewsCategoryBody({super.key, required this.categoryName});

  @override
  State<NewsCategoryBody> createState() => _NewsCategoryBodyState();
}

class _NewsCategoryBodyState extends State<NewsCategoryBody> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<SourcesResponse>(
          future: ApiManager.getSources(widget.categoryName),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Failed to load sources', style: TextStyle(color: Colors.red),),
                );
              } else if (snapshot.hasData && snapshot.data != null) {
                var data = snapshot.data!.sources;
                return DefaultTabController(
                  length: data?.length ?? 0,
                  initialIndex: selectedTabIndex,
                  child: Column(
                    children: [
                      TabBar(
                        dividerColor: Colors.transparent,
                        indicatorColor: Theme.of(context).secondaryHeaderColor,
                        labelColor: Theme.of(context).secondaryHeaderColor,
                        isScrollable: true,
                        onTap: (index) {
                          setState(() {
                            selectedTabIndex = index;
                          });
                        },
                        tabs: data!.map((e) => Tab(text: e.name!)).toList(),
                      ),
                      ArticalsFragment(sourceId: data[selectedTabIndex].id!),
                    ],
                  ),
                );
              }
            }
            return Center(
              child: Text('No data found', style: TextStyle(color: Colors.red),),
            );
          }),
    );
  }
}
